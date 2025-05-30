create or replace PROCEDURE DML_ZDARZENIE_MECZOWE (
    P_ZDARZENIE_MECZ_ID IN OUT NUMBER,
    P_MECZ_ID IN NUMBER,
    P_TYP_ZDARZENIA IN VARCHAR2,
    P_MINUTA IN NUMBER,
    P_GOL_ZAWODNIK_ID IN NUMBER,
    P_TYP_GOLA IN VARCHAR2,
    P_KARTKA_ZAWODNIK_ID IN NUMBER,
    P_KOLOR_KARTKI IN VARCHAR2,
    P_ZMIANA_ZAWODNIK_SCHODZACY_ID IN NUMBER,
    P_ZMIANA_ZAWODNIK_WCHODZACY_ID IN NUMBER,
    P_OPERACJA IN VARCHAR2
) IS
BEGIN
    IF P_OPERACJA = 'INSERT' THEN
        INSERT INTO ZdarzenieMecz (MeczID, TypZdarzenieMecz, Minuta)
        VALUES (P_MECZ_ID, P_TYP_ZDARZENIA, P_MINUTA)
        RETURNING ZdarzenieMeczID INTO P_ZDARZENIE_MECZ_ID;
        IF P_TYP_ZDARZENIA = 'Gol' THEN
            INSERT INTO ZdarzenieMeczGol (ZdarzenieMeczID, ZawodnikStrzelajacyID, TypGola)
            VALUES (P_ZDARZENIE_MECZ_ID, P_GOL_ZAWODNIK_ID, P_TYP_GOLA);
        ELSIF P_TYP_ZDARZENIA = 'Kartka' THEN
            INSERT INTO ZdarzenieMeczKartka (ZdarzenieMeczID, ZawodnikKartkowanyID, KolorKartki)
            VALUES (P_ZDARZENIE_MECZ_ID, P_KARTKA_ZAWODNIK_ID, P_KOLOR_KARTKI);
        ELSIF P_TYP_ZDARZENIA = 'Zmiana' THEN
            INSERT INTO ZdarzenieMeczZmiana (ZdarzenieMeczID, ZawodnikSchodzacyID, ZawodnikWchodzacyID)
            VALUES (P_ZDARZENIE_MECZ_ID, P_ZMIANA_ZAWODNIK_SCHODZACY_ID, P_ZMIANA_ZAWODNIK_WCHODZACY_ID);
        END IF;

    ELSIF P_OPERACJA = 'UPDATE' THEN
        UPDATE ZdarzenieMecz
        SET MeczID = P_MECZ_ID, TypZdarzenieMecz = P_TYP_ZDARZENIA, Minuta = P_MINUTA
        WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
        IF P_TYP_ZDARZENIA = 'Gol' THEN
            DELETE FROM ZdarzenieMeczKartka WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
            DELETE FROM ZdarzenieMeczZmiana WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
            MERGE INTO ZdarzenieMeczGol ZMG
            USING DUAL
            ON (ZMG.ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID)
            WHEN MATCHED THEN
                UPDATE SET ZMG.ZawodnikStrzelajacyID = P_GOL_ZAWODNIK_ID, ZMG.TypGola = P_TYP_GOLA
            WHEN NOT MATCHED THEN
                INSERT (ZdarzenieMeczID, ZawodnikStrzelajacyID, TypGola)
                VALUES (P_ZDARZENIE_MECZ_ID, P_GOL_ZAWODNIK_ID, P_TYP_GOLA);
        ELSIF P_TYP_ZDARZENIA = 'Kartka' THEN
            DELETE FROM ZdarzenieMeczGol WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
            DELETE FROM ZdarzenieMeczZmiana WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
            MERGE INTO ZdarzenieMeczKartka ZMK
            USING DUAL
            ON (ZMK.ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID)
            WHEN MATCHED THEN
                UPDATE SET ZMK.ZawodnikKartkowanyID = P_KARTKA_ZAWODNIK_ID, ZMK.KolorKartki = P_KOLOR_KARTKI
            WHEN NOT MATCHED THEN
                INSERT (ZdarzenieMeczID, ZawodnikKartkowanyID, KolorKartki)
                VALUES (P_ZDARZENIE_MECZ_ID, P_KARTKA_ZAWODNIK_ID, P_KOLOR_KARTKI);
        ELSIF P_TYP_ZDARZENIA = 'Zmiana' THEN
            DELETE FROM ZdarzenieMeczGol WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
            DELETE FROM ZdarzenieMeczKartka WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
            MERGE INTO ZdarzenieMeczZmiana ZMZ
            USING DUAL
            ON (ZMZ.ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID)
            WHEN MATCHED THEN
                UPDATE SET ZMZ.ZawodnikSchodzacyID = P_ZMIANA_ZAWODNIK_SCHODZACY_ID, 
                           ZMZ.ZawodnikWchodzacyID = P_ZMIANA_ZAWODNIK_WCHODZACY_ID
            WHEN NOT MATCHED THEN
                INSERT (ZdarzenieMeczID, ZawodnikSchodzacyID, ZawodnikWchodzacyID)
                VALUES (P_ZDARZENIE_MECZ_ID, P_ZMIANA_ZAWODNIK_SCHODZACY_ID, P_ZMIANA_ZAWODNIK_WCHODZACY_ID);
        END IF;

    ELSIF P_OPERACJA = 'DELETE' THEN
        DELETE FROM ZdarzenieMeczGol WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
        DELETE FROM ZdarzenieMeczKartka WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
        DELETE FROM ZdarzenieMeczZmiana WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
        DELETE FROM ZdarzenieMecz WHERE ZdarzenieMeczID = P_ZDARZENIE_MECZ_ID;
    END IF;

    COMMIT;
END;
/
create or replace PROCEDURE DodajZdarzenieGol(
    P_ZdarzenieMeczID IN NUMBER,
    P_MeczID IN NUMBER,
    P_SedziaID IN NUMBER,
    P_Minuta IN NUMBER,
    P_GolID IN NUMBER,
    P_StrzelecID IN NUMBER,
    P_TypGola IN VARCHAR2
) AS
BEGIN
    INSERT INTO ZdarzenieMecz (
        ZdarzenieMeczID,
        MeczID,
        SedziaID,
        Minuta,
        TypZdarzenieMecz
    ) VALUES (
        P_ZdarzenieMeczID,
        P_MeczID,
        P_SedziaID,
        P_Minuta,
        'Gol'
    );

    INSERT INTO ZdarzenieMeczGol (
        GolID, 
        ZdarzenieMeczID, 
        ZawodnikStrzelajacyID, 
        TypGola
    ) VALUES (
        P_GolID, 
        P_ZdarzenieMeczID, 
        P_StrzelecID, 
        P_TypGola
    );
END;
/
create or replace PROCEDURE GenerujRaportStatystyk IS
    CURSOR c_Zawodnicy IS
        SELECT ZawodnikID, Imie, Nazwisko FROM Zawodnik;
    v_Wynik VARCHAR2(4000);
BEGIN
    FOR r IN c_Zawodnicy LOOP
        v_Wynik := ObliczStatystykiZawodnika(r.ZawodnikID);
        DBMS_OUTPUT.PUT_LINE(r.Imie || ' ' || r.Nazwisko || ': ' || v_Wynik);
    END LOOP;
END GenerujRaportStatystyk;
/