REATE OR REPLACE FORCE EDITIONABLE VIEW "V_MECZ_DETAILS" ("MECZID", "GOSPODARZ", "GOŚĆ", "SĘDZIA_GŁÓWNY", "SĘDZIA_ASYSTENT_NR_1", "SĘDZIA_ASYSTENT_NR_2", "DATA_MECZU", "WYNIK", "KOLEJKA") AS 
  SELECT MECZID,
       Gosp.NAZWA AS Gospodarz,
       Gosc.NAZWA AS Gość,
       Sg.IMIE || ' ' || Sg.NAZWISKO AS Sędzia_główny,
       As1.IMIE || ' ' || As1.NAZWISKO AS Sędzia_asystent_nr_1,
       As2.IMIE || ' ' || As2.NAZWISKO AS Sędzia_asystent_nr_2,
       m.DATAMECZU AS Data_meczu,
       m.WYNIKKONCOWY AS Wynik,
       m.NRKOLEJKI AS Kolejka
FROM MECZ m 
JOIN Sedzia Sg ON m.SEDZIAGLOWNYID = Sg.SEDZIAID
JOIN Sedzia As1 ON m.SEDZIAAS1ID = As1.SEDZIAID
JOIN Sedzia As2 ON m.SEDZIAAS2ID = As2.SEDZIAID
JOIN Klub Gosp ON m.KLUBGOSPID = Gosp.KLUBID
JOIN Klub Gosc ON m.KLUBGOSCID = Gosc.KLUBID;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "VW_ZDARZENIA_MECZOWE" ("ZDARZENIEMECZID", "MECZID", "TYPZDARZENIEMECZ", "MINUTA", "GOLID", "GOL_ZAWODNIKID", "TYPGOLA", "KARTKAID", "KARTKA_ZAWODNIKID", "KOLORKARTKI", "ZMIANAID", "ZAWODNIKSCHODZACYID", "ZAWODNIKWCHODZACYID", "GOSPODARZ_ZMIANY", "GOSPODARZ_KARTKI", "GOSPODARZ_GOLE", "WYNIK", "GOSC_GOLE", "GOSC_KARTKI", "GOSC_ZMIANY") AS 
  SELECT
    ZM.ZdarzenieMeczID,
    ZM.MeczID,
    ZM.TypZdarzenieMecz,
    ZM.Minuta,
    ZMG.GOLID AS GolID,
    ZMG.ZawodnikStrzelajacyID AS Gol_ZawodnikID,
    ZMG.TypGola,
    ZMK.KartkaID AS KartkaID,
    ZMK.ZawodnikKartkowanyID AS Kartka_ZawodnikID,
    ZMK.KolorKartki,
    ZMZ.ZmianaID AS ZmianaID,
    ZMZ.ZawodnikSchodzacyID AS ZawodnikSchodzacyID,
    ZMZ.ZawodnikWchodzacyID AS ZawodnikWchodzacyID,
    
    -- Gospodarz Zmiany
    CASE
        WHEN ZM.TypZdarzenieMecz = 'Zmiana' AND ZawodnikSchodzacy.KlubID = M.KlubGospID
        THEN ZawodnikSchodzacy.Nazwisko || ' -> ' || ZawodnikWchodzacy.Nazwisko
        ELSE NULL
    END AS Gospodarz_Zmiany,

    -- Gospodarz Kartki
    CASE
        WHEN ZM.TypZdarzenieMecz = 'Kartka' AND ZawodnikKartkowany.KlubID = M.KlubGospID
        THEN ZawodnikKartkowany.Nazwisko || ' (' || ZMK.KolorKartki || ')'
        ELSE NULL
    END AS Gospodarz_Kartki,

    -- Gospodarz Gole
    CASE
        WHEN ZM.TypZdarzenieMecz = 'Gol' AND ZawodnikStrzelajacy.KlubID = M.KlubGospID
        THEN ZawodnikStrzelajacy.Nazwisko || ' (' || ZMG.TypGola || ')'
        ELSE NULL
    END AS Gospodarz_Gole,

    -- Wynik (dynamiczny, w środku)
    SUM(CASE 
        WHEN ZM.TypZdarzenieMecz = 'Gol' AND ZawodnikStrzelajacy.KlubID = M.KlubGospID THEN 1
        ELSE 0
    END) OVER (ORDER BY ZM.Minuta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
    || ' - ' || 
    SUM(CASE 
        WHEN ZM.TypZdarzenieMecz = 'Gol' AND ZawodnikStrzelajacy.KlubID = M.KlubGoscID THEN 1
        ELSE 0
    END) OVER (ORDER BY ZM.Minuta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Wynik,

    -- Gość Gole
    CASE
        WHEN ZM.TypZdarzenieMecz = 'Gol' AND ZawodnikStrzelajacy.KlubID = M.KlubGoscID
        THEN ZawodnikStrzelajacy.Nazwisko || ' (' || ZMG.TypGola || ')'
        ELSE NULL
    END AS Gosc_Gole,

    -- Gość Kartki
    CASE
        WHEN ZM.TypZdarzenieMecz = 'Kartka' AND ZawodnikKartkowany.KlubID = M.KlubGoscID
        THEN ZawodnikKartkowany.Nazwisko || ' (' || ZMK.KolorKartki || ')'
        ELSE NULL
    END AS Gosc_Kartki,

    -- Gość Zmiany
    CASE
        WHEN ZM.TypZdarzenieMecz = 'Zmiana' AND ZawodnikSchodzacy.KlubID = M.KlubGoscID
        THEN ZawodnikSchodzacy.Nazwisko || ' -> ' || ZawodnikWchodzacy.Nazwisko
        ELSE NULL
    END AS Gosc_Zmiany

FROM
    Mecz M
JOIN
    Klub Gosp ON M.KlubGospID = Gosp.KlubID
JOIN
    Klub Gosc ON M.KlubGoscID = Gosc.KlubID
JOIN
    ZdarzenieMecz ZM ON M.MeczID = ZM.MeczID
LEFT JOIN
    ZdarzenieMeczGol ZMG ON ZM.ZdarzenieMeczID = ZMG.ZdarzenieMeczID
LEFT JOIN
    Zawodnik ZawodnikStrzelajacy ON ZMG.ZawodnikStrzelajacyID = ZawodnikStrzelajacy.ZawodnikID
LEFT JOIN
    ZdarzenieMeczKartka ZMK ON ZM.ZdarzenieMeczID = ZMK.ZdarzenieMeczID
LEFT JOIN
    Zawodnik ZawodnikKartkowany ON ZMK.ZawodnikKartkowanyID = ZawodnikKartkowany.ZawodnikID
LEFT JOIN
    ZdarzenieMeczZmiana ZMZ ON ZM.ZdarzenieMeczID = ZMZ.ZdarzenieMeczID
LEFT JOIN
    Zawodnik ZawodnikSchodzacy ON ZMZ.ZawodnikSchodzacyID = ZawodnikSchodzacy.ZawodnikID
LEFT JOIN
    Zawodnik ZawodnikWchodzacy ON ZMZ.ZawodnikWchodzacyID = ZawodnikWchodzacy.ZawodnikID;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "LIGATABELA" ("POZYCJA", "LIGAID", "KLUB", "WYGRANE", "REMISY", "PRZEGRANE", "BRAMKI_ZDOBYTE", "BRAMKI_STRACONE", "ROZNICA_BRAMEK", "PUNKTY") AS 
  WITH Statystyki AS (
    SELECT 
        k.KlubID,
        k.LigaID,                           
        k.Nazwa AS Klub,
        
        -- Wygrane
        SUM(
            CASE 
              WHEN m.KlubGospID = k.KlubID 
                   AND TO_NUMBER(SUBSTR(m.WynikKoncowy, 1, INSTR(m.WynikKoncowy, ':') - 1)) 
                       > TO_NUMBER(SUBSTR(m.WynikKoncowy, INSTR(m.WynikKoncowy, ':') + 1)) 
              THEN 1
              WHEN m.KlubGoscID = k.KlubID 
                   AND TO_NUMBER(SUBSTR(m.WynikKoncowy, INSTR(m.WynikKoncowy, ':') + 1)) 
                       > TO_NUMBER(SUBSTR(m.WynikKoncowy, 1, INSTR(m.WynikKoncowy, ':') - 1)) 
              THEN 1
              ELSE 0
            END
        ) AS Wygrane,

        -- Remisy
        SUM(
            CASE 
              WHEN TO_NUMBER(SUBSTR(m.WynikKoncowy, 1, INSTR(m.WynikKoncowy, ':') - 1)) 
                   = TO_NUMBER(SUBSTR(m.WynikKoncowy, INSTR(m.WynikKoncowy, ':') + 1)) 
              THEN 1
              ELSE 0 
            END
        ) AS Remisy,

        -- Przegrane
        SUM(
            CASE 
              WHEN m.KlubGospID = k.KlubID 
                   AND TO_NUMBER(SUBSTR(m.WynikKoncowy, 1, INSTR(m.WynikKoncowy, ':') - 1)) 
                       < TO_NUMBER(SUBSTR(m.WynikKoncowy, INSTR(m.WynikKoncowy, ':') + 1)) 
              THEN 1
              WHEN m.KlubGoscID = k.KlubID 
                   AND TO_NUMBER(SUBSTR(m.WynikKoncowy, INSTR(m.WynikKoncowy, ':') + 1)) 
                       < TO_NUMBER(SUBSTR(m.WynikKoncowy, 1, INSTR(m.WynikKoncowy, ':') - 1)) 
              THEN 1
              ELSE 0
            END
        ) AS Przegrane,

        -- Bramki Zdobyte
        SUM(
            CASE 
              WHEN m.KlubGospID = k.KlubID THEN 
                   TO_NUMBER(SUBSTR(m.WynikKoncowy, 1, INSTR(m.WynikKoncowy, ':') - 1))
              WHEN m.KlubGoscID = k.KlubID THEN 
                   TO_NUMBER(SUBSTR(m.WynikKoncowy, INSTR(m.WynikKoncowy, ':') + 1))
              ELSE 0
            END
        ) AS Bramki_Zdobyte,

        -- Bramki Stracone
        SUM(
            CASE 
              WHEN m.KlubGospID = k.KlubID THEN 
                   TO_NUMBER(SUBSTR(m.WynikKoncowy, INSTR(m.WynikKoncowy, ':') + 1))
              WHEN m.KlubGoscID = k.KlubID THEN 
                   TO_NUMBER(SUBSTR(m.WynikKoncowy, 1, INSTR(m.WynikKoncowy, ':') - 1))
              ELSE 0
            END
        ) AS Bramki_Stracone,

        -- Punkty
        SUM(
            CASE 
              WHEN 
                   ( m.KlubGospID = k.KlubID 
                     AND TO_NUMBER(SUBSTR(m.WynikKoncowy, 1, INSTR(m.WynikKoncowy, ':') - 1)) 
                         > TO_NUMBER(SUBSTR(m.WynikKoncowy, INSTR(m.WynikKoncowy, ':') + 1)) 
                   )
                   OR
                   ( m.KlubGoscID = k.KlubID 
                     AND TO_NUMBER(SUBSTR(m.WynikKoncowy, INSTR(m.WynikKoncowy, ':') + 1)) 
                         > TO_NUMBER(SUBSTR(m.WynikKoncowy, 1, INSTR(m.WynikKoncowy, ':') - 1))
                   )
              THEN 3
              
              WHEN TO_NUMBER(SUBSTR(m.WynikKoncowy, 1, INSTR(m.WynikKoncowy, ':') - 1)) 
                   = TO_NUMBER(SUBSTR(m.WynikKoncowy, INSTR(m.WynikKoncowy, ':') + 1)) 
              THEN 1

              ELSE 0
            END
        ) AS Punkty
        
    FROM
        Klub k
        LEFT JOIN Mecz m 
               ON k.KlubID IN (m.KlubGospID, m.KlubGoscID)
    GROUP BY 
        k.KlubID, 
        k.Nazwa,
        k.LigaID                     
)
SELECT 
    ROW_NUMBER() OVER (ORDER BY Punkty DESC, (Bramki_Zdobyte - Bramki_Stracone) DESC) AS Pozycja,
    s.LigaID,            
    s.Klub,
    s.Wygrane,
    s.Remisy,
    s.Przegrane,
    s.Bramki_Zdobyte,
    s.Bramki_Stracone,
    (s.Bramki_Zdobyte - s.Bramki_Stracone) AS Roznica_Bramek,
    s.Punkty
FROM Statystyki s;

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "STATYSTYKIZAWODNIKOW" ("ZAWODNIKID", "IMIE", "NAZWISKO", "LICZBAMINUT", "GOLE", "ZOLTEKARTKI", "CZERWONEKARTKI") AS 
  SELECT "ZAWODNIKID","IMIE","NAZWISKO","LICZBAMINUT","GOLE","ZOLTEKARTKI","CZERWONEKARTKI" FROM TABLE(ObliczStatystykiZawodnikow());