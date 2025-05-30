reate or replace FUNCTION ObliczCzerwoneKartki(ZawodnikID IN INTEGER)
  RETURN NUMBER
IS
  czerwone_kartki NUMBER := 0;
BEGIN
  SELECT COUNT(*)
  INTO czerwone_kartki
  FROM ZdarzenieMeczKartka
  WHERE ZawodnikKartkowanyID = ZawodnikID
    AND KolorKartki = 'Czerwona';

  RETURN czerwone_kartki;
END ObliczCzerwoneKartki;
/
create or replace FUNCTION ObliczCzerwoneKartki2(
    p_zawodnik_id IN INTEGER,
    p_liga_id     IN INTEGER
)
RETURN NUMBER
IS
  v_czerwone NUMBER := 0;
BEGIN
  SELECT COUNT(*)
    INTO v_czerwone
    FROM ZdarzenieMeczKartka zmk
         JOIN ZdarzenieMecz zm ON zmk.ZdarzenieMeczID = zm.ZdarzenieMeczID
         JOIN Mecz m           ON zm.MeczID          = m.MeczID
         JOIN Klub kgosp       ON m.KlubGospID       = kgosp.KlubID
         JOIN Klub kgosc       ON m.KlubGoscID       = kgosc.KlubID
   WHERE zmk.ZawodnikKartkowanyID = p_zawodnik_id
     AND zmk.KolorKartki = 'Czerwona'
     AND kgosp.LigaID = p_liga_id
     AND kgosc.LigaID = p_liga_id;

  RETURN v_czerwone;
END ObliczCzerwoneKartki2;
/
create or replace FUNCTION ObliczLiczbeGoli(ZawodnikID IN INTEGER)
  RETURN NUMBER
IS
  liczba_goli NUMBER := 0;
BEGIN
  SELECT COUNT(*)
  INTO liczba_goli
  FROM ZdarzenieMeczGol
  WHERE ZawodnikStrzelajacyID = ZawodnikID;

  RETURN liczba_goli;
END ObliczLiczbeGoli;
/
create or replace FUNCTION ObliczLiczbeGoli2(
    p_zawodnik_id IN INTEGER,
    p_liga_id     IN INTEGER
)
RETURN NUMBER
IS
  v_gole NUMBER := 0;
BEGIN
  SELECT COUNT(*)
    INTO v_gole
    FROM ZdarzenieMeczGol zg
         JOIN ZdarzenieMecz zm ON zg.ZdarzenieMeczID = zm.ZdarzenieMeczID
         JOIN Mecz m          ON zm.MeczID         = m.MeczID
         JOIN Klub kgosp      ON m.KlubGospID      = kgosp.KlubID
         JOIN Klub kgosc      ON m.KlubGoscID      = kgosc.KlubID
   WHERE zg.ZawodnikStrzelajacyID = p_zawodnik_id
     AND zg.TypGola IN ('zwykly', 'karny')
     AND kgosp.LigaID = p_liga_id
     AND kgosc.LigaID = p_liga_id;    
     
  RETURN v_gole;
END ObliczLiczbeGoli2;
/
create or replace FUNCTION ObliczLiczbeMinut(ZawodnikID IN INTEGER)
  RETURN NUMBER
IS
  liczba_minut NUMBER := 0;

  CURSOR MeczeZawodnika IS
    SELECT 
      SM.MeczID,
      SM.RolaWSkladzie,
      NVL(ZM.Minuta, 0) AS Minuta,
      ZM.TypZdarzenieMecz,
      ZCZ.ZawodnikWchodzacyID,
      ZCZ.ZawodnikSchodzacyID
    FROM SkladMeczowy SM
    LEFT JOIN ZdarzenieMecz ZM ON SM.MeczID = ZM.MeczID
    LEFT JOIN ZdarzenieMeczZmiana ZCZ ON ZM.ZdarzenieMeczID = ZCZ.ZdarzenieMeczID
    WHERE SM.ZawodnikID = ZawodnikID
    ORDER BY SM.MeczID, NVL(ZM.Minuta, 0);

  is_on_field BOOLEAN := FALSE;
  last_start_minute INTEGER := 0;

BEGIN
  FOR r IN MeczeZawodnika LOOP
    -- Jeśli zawodnik zaczyna jako podstawowy
    IF r.RolaWSkladzie = 'P' THEN
      IF r.TypZdarzenieMecz = 'Zmiana' AND r.ZawodnikSchodzacyID = ZawodnikID THEN
        -- Zawodnik schodzi z boiska, dodaj minuty od początku do momentu zmiany
        liczba_minut := liczba_minut + r.Minuta;
        is_on_field := FALSE;
      END IF;
    ELSIF r.RolaWSkladzie = 'R' THEN
      -- Jeśli zawodnik jest rezerwowy
      IF r.TypZdarzenieMecz = 'Zmiana' AND r.ZawodnikWchodzacyID = ZawodnikID THEN
        -- Zawodnik wchodzi na boisko
        is_on_field := TRUE;
        last_start_minute := r.Minuta;
      ELSIF is_on_field AND r.TypZdarzenieMecz = 'Zmiana' AND r.ZawodnikSchodzacyID = ZawodnikID THEN
        -- Zawodnik schodzi z boiska jako rezerwowy
        liczba_minut := liczba_minut + (r.Minuta - last_start_minute);
        is_on_field := FALSE;
      END IF;
    END IF;
  END LOOP;

  -- Po zakończeniu pętli, dodaj odpowiednie minuty:
  FOR r IN (SELECT * FROM SkladMeczowy WHERE ZawodnikID = ZawodnikID) LOOP
    IF r.RolaWSkladzie = 'P' AND NOT EXISTS (
      SELECT 1
      FROM ZdarzenieMeczZmiana
      WHERE ZawodnikSchodzacyID = ZawodnikID AND MeczID = r.MeczID
    ) THEN
      -- Zawodnik gra cały mecz jako podstawowy
      liczba_minut := liczba_minut + 90;
    ELSIF r.RolaWSkladzie = 'R' AND is_on_field THEN
      -- Zawodnik jest rezerwowy, gra od momentu wejścia do końca meczu
      liczba_minut := liczba_minut + (90 - last_start_minute);
    END IF;
  END LOOP;

  RETURN liczba_minut;
END ObliczLiczbeMinut;
/
create or replace FUNCTION ObliczStatystykiZawodnika(ZawodnikID IN INTEGER)
  RETURN StatystykiZawodnikaTyp
IS
  liczba_minut INTEGER := 0;
  liczba_goli INTEGER := 0;
  zolte_kartki INTEGER := 0;
  czerwone_kartki INTEGER := 0;

  is_on_field BOOLEAN := FALSE;
  last_start_minute INTEGER := 0;

  CURSOR MeczeZawodnika IS
    SELECT SM.MeczID, NVL(ZM.Minuta, 0) AS Minuta, ZM.TypZdarzenieMecz, 
           ZCZ.ZawodnikWchodzacyID, ZCZ.ZawodnikSchodzacyID
    FROM SkladMeczowy SM
    LEFT JOIN ZdarzenieMecz ZM ON SM.MeczID = ZM.MeczID
    LEFT JOIN ZdarzenieMeczZmiana ZCZ ON ZM.ZdarzenieMeczID = ZCZ.ZdarzenieMeczID
    WHERE SM.ZawodnikID = ZawodnikID
    ORDER BY SM.MeczID, NVL(ZM.Minuta, 0);

BEGIN
  -- Iteracja po kursorze
  FOR r IN MeczeZawodnika LOOP
    IF r.TypZdarzenieMecz = 'Zmiana' THEN
      IF r.ZawodnikWchodzacyID = ZawodnikID THEN
        IF NOT is_on_field THEN
          is_on_field := TRUE;
          last_start_minute := r.Minuta;
        END IF;
      ELSIF r.ZawodnikSchodzacyID = ZawodnikID AND is_on_field THEN
        liczba_minut := liczba_minut + (r.Minuta - last_start_minute);
        is_on_field := FALSE;
      END IF;
    END IF;
  END LOOP;

  IF is_on_field THEN
    liczba_minut := liczba_minut + (90 - last_start_minute);
  END IF;

  -- Liczba goli
  SELECT COUNT(*)
  INTO liczba_goli
  FROM ZdarzenieMeczGol
  WHERE ZawodnikStrzelajacyID = ZawodnikID;

  -- Żółte kartki
  SELECT COUNT(*)
  INTO zolte_kartki
  FROM ZdarzenieMeczKartka
  WHERE ZawodnikKartkowanyID = ZawodnikID
    AND KolorKartki = 'Zolta';

  -- Czerwone kartki
  SELECT COUNT(*)
  INTO czerwone_kartki
  FROM ZdarzenieMeczKartka
  WHERE ZawodnikKartkowanyID = ZawodnikID
    AND KolorKartki = 'Czerwona';

  RETURN StatystykiZawodnikaTyp(
    liczba_minut,
    liczba_goli,
    zolte_kartki,
    czerwone_kartki
  );
END ObliczStatystykiZawodnika;
/
create or replace FUNCTION ObliczStatystykiZawodnikow RETURN StatystykaZawodnikaTable PIPELINED AS
BEGIN
  FOR r IN (
    SELECT
      z.ZawodnikID,
      z.Imie,
      z.Nazwisko,
      
      -- Obliczanie minut
      NVL(SUM(
        CASE 
          WHEN sm.RolaWSkladzie = 'P' THEN 
            CASE 
              -- Jeśli zawodnik nie jest zmieniany, to gra przez 90 minut
              WHEN NOT EXISTS (
                SELECT 1 FROM ZdarzenieMeczZmiana zm
                WHERE zm.ZawodnikSchodzacyID = z.ZawodnikID
              ) THEN 90
              -- Jeśli zawodnik jest zmieniany, to zliczamy minutę zmiany
              ELSE (
                SELECT MIN(zm_min.Minuta) FROM ZdarzenieMeczZmiana zm
                JOIN ZdarzenieMecz zm_min ON zm.ZdarzenieMeczID = zm_min.ZdarzenieMeczID
                WHERE zm.ZawodnikSchodzacyID = z.ZawodnikID
              )
            END
          WHEN EXISTS (
            -- Obliczamy minutę dla zawodnika, który wszedł na boisko
            SELECT 1 FROM ZdarzenieMeczZmiana zm
            JOIN ZdarzenieMecz zm_min ON zm.ZdarzenieMeczID = zm_min.ZdarzenieMeczID
            WHERE zm.ZawodnikWchodzacyID = z.ZawodnikID
          ) THEN 90 - (
            SELECT MIN(zm_min.Minuta) FROM ZdarzenieMeczZmiana zm
            JOIN ZdarzenieMecz zm_min ON zm.ZdarzenieMeczID = zm_min.ZdarzenieMeczID
            WHERE zm.ZawodnikWchodzacyID = z.ZawodnikID
          )
        END
      ), 0) AS LiczbaMinut,

      -- Zliczanie goli tylko dla danego zawodnika
      COUNT(DISTINCT g.GolID) AS Gole,

      -- Zliczanie żółtych kartek tylko dla danego zawodnika
      COUNT(CASE WHEN k.ZawodnikKartkowanyID = z.ZawodnikID AND k.KolorKartki = 'Zolta' THEN 1 END) AS ZolteKartki,

      -- Zliczanie czerwonych kartek tylko dla danego zawodnika
      COUNT(CASE WHEN k.ZawodnikKartkowanyID = z.ZawodnikID AND k.KolorKartki = 'Czerwona' THEN 1 END) AS CzerwoneKartki

    FROM
      Zawodnik z
      LEFT JOIN SkladMeczowy sm ON z.ZawodnikID = sm.ZawodnikID
      LEFT JOIN ZdarzenieMeczGol g ON z.ZawodnikID = g.ZawodnikStrzelajacyID
      LEFT JOIN ZdarzenieMeczKartka k ON z.ZawodnikID = k.ZawodnikKartkowanyID

    GROUP BY
      z.ZawodnikID, z.Imie, z.Nazwisko
  ) LOOP
    PIPE ROW(StatystykaZawodnika(
      r.ZawodnikID,
      r.Imie,
      r.Nazwisko,
      r.LiczbaMinut,
      r.Gole,
      r.ZolteKartki,
      r.CzerwoneKartki
    ));
  END LOOP;
  RETURN;
END ObliczStatystykiZawodnikow;
/
create or replace FUNCTION ObliczZolteKartki(ZawodnikID IN INTEGER)
  RETURN NUMBER
IS
  zolte_kartki NUMBER := 0;
BEGIN
  SELECT COUNT(*)
  INTO zolte_kartki
  FROM ZdarzenieMeczKartka
  WHERE ZawodnikKartkowanyID = ZawodnikID
    AND KolorKartki = 'Zolta';

  RETURN zolte_kartki;
END ObliczZolteKartki;
/
create or replace FUNCTION ObliczZolteKartki2(
    p_zawodnik_id IN INTEGER,
    p_liga_id     IN INTEGER
)
RETURN NUMBER
IS
  v_zolte NUMBER := 0;
BEGIN
  SELECT COUNT(*)
    INTO v_zolte
    FROM ZdarzenieMeczKartka zmk
         JOIN ZdarzenieMecz zm ON zmk.ZdarzenieMeczID = zm.ZdarzenieMeczID
         JOIN Mecz m           ON zm.MeczID          = m.MeczID
         JOIN Klub kgosp       ON m.KlubGospID       = kgosp.KlubID
         JOIN Klub kgosc       ON m.KlubGoscID       = kgosc.KlubID
   WHERE zmk.ZawodnikKartkowanyID = p_zawodnik_id
     AND zmk.KolorKartki = 'Zolta'
     AND kgosp.LigaID = p_liga_id
     AND kgosc.LigaID = p_liga_id;

  RETURN v_zolte;
END ObliczZolteKartki2;
/
