-- BEFORE INSERT OR UPDATE OR DELETE
--1 : Kontrola poprawnosci sesji
CREATE OR REPLACE TRIGGER trg_biud_sesja_kontrola
BEFORE INSERT OR UPDATE OR DELETE ON Sesja
FOR EACH ROW
DECLARE
    v_status_nazwa Status_Sesji.nazwa%TYPE;
    v_minuty NUMBER;
BEGIN
    IF INSERTING OR UPDATING THEN

        IF :NEW.godzina_koniec <= :NEW.godzina_start THEN
            RAISE_APPLICATION_ERROR(-20001, 'Godzina konca musi byc pozniejsza niz godzina startu.');
        END IF;

        v_minuty :=
            EXTRACT(DAY FROM (:NEW.godzina_koniec - :NEW.godzina_start)) * 24 * 60 +
            EXTRACT(HOUR FROM (:NEW.godzina_koniec - :NEW.godzina_start)) * 60 +
            EXTRACT(MINUTE FROM (:NEW.godzina_koniec - :NEW.godzina_start));

        IF v_minuty < 30 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Sesja musi trwac co najmniej 30 minut.');
        END IF;

        SELECT nazwa
        INTO v_status_nazwa
        FROM Status_Sesji
        WHERE id = :NEW.Status_Sesji_id;

        IF UPPER(v_status_nazwa) = 'ZAKONCZONA'
           AND :NEW.godzina_koniec > SYSTIMESTAMP THEN
            RAISE_APPLICATION_ERROR(-20003, 'Nie mozna zakonczyc sesji, ktora jeszcze sie nie odbyla.');
        END IF;

    END IF;

    IF DELETING THEN

        SELECT nazwa
        INTO v_status_nazwa
        FROM Status_Sesji
        WHERE id = :OLD.Status_Sesji_id;

        IF UPPER(v_status_nazwa) = 'ZAKONCZONA' THEN
            RAISE_APPLICATION_ERROR(-20004, 'Nie mozna usunac zakonczonej sesji.');
        END IF;

    END IF;
END;
/


-- 2: Kontrola platnosci
CREATE OR REPLACE TRIGGER trg_biud_platnosc_kontrola
BEFORE INSERT OR UPDATE OR DELETE ON Platnosc
FOR EACH ROW
DECLARE
    v_status_nazwa Status_Platnosci.nazwa%TYPE;
BEGIN
    IF INSERTING OR UPDATING THEN

        IF :NEW.kwota <= 0 THEN
            RAISE_APPLICATION_ERROR(-20005, 'Kwota platnosci musi byc wieksza od zera.');
        END IF;

        SELECT nazwa
        INTO v_status_nazwa
        FROM Status_Platnosci
        WHERE id = :NEW.Status_Platnosci_id;

        IF UPPER(v_status_nazwa) = 'OPLACONA'
           AND :NEW.data_platnosci IS NULL THEN
            :NEW.data_platnosci := SYSDATE;
        END IF;

    END IF;

    IF DELETING THEN

        SELECT nazwa
        INTO v_status_nazwa
        FROM Status_Platnosci
        WHERE id = :OLD.Status_Platnosci_id;

        IF UPPER(v_status_nazwa) = 'ZWROCONA' THEN
            RAISE_APPLICATION_ERROR(-20006, 'Nie mozna usunac zwroconej platnosci.');
        END IF;

    END IF;
END;
/



-- AFTER INSERT
--1: Po dodaniu sesji automatycznie tworzy galerie
CREATE OR REPLACE TRIGGER trg_ai_sesja_galeria
AFTER INSERT ON Sesja
FOR EACH ROW
DECLARE
    v_galeria_id INTEGER;
    v_nazwa_uslugi Usluga.nazwa%TYPE;
BEGIN
    SELECT nazwa
    INTO v_nazwa_uslugi
    FROM Usluga
    WHERE id = :NEW.Usluga_id;

    SELECT NVL(MAX(id), 0) + 1
    INTO v_galeria_id
    FROM Galeria;

    INSERT INTO Galeria (
        id,
        Sesja_id,
        nazwa,
        data_utworzenia,
        link_do_galerii
    )
    VALUES (
        v_galeria_id,
        :NEW.id,
        'Galeria - ' || v_nazwa_uslugi,
        SYSDATE,
        '/galerie/sesja_' || :NEW.id
    );
END;
/


-- 2: Po zmianie platnosci aktualizuje status rezerwacji
CREATE OR REPLACE TRIGGER trg_aiud_platnosc_status
AFTER INSERT OR UPDATE OR DELETE ON Platnosc
FOR EACH ROW
DECLARE
    v_rezerwacja_id INTEGER;
    v_status_platnosci Status_Platnosci.nazwa%TYPE;
    v_status_potwierdzona INTEGER;
    v_status_oczekujaca INTEGER;
    v_status_anulowana INTEGER;
    v_aktualny_status INTEGER;
BEGIN
    SELECT id
    INTO v_status_potwierdzona
    FROM Status_Rezerwacji
    WHERE UPPER(nazwa) = 'POTWIERDZONA';

    SELECT id
    INTO v_status_oczekujaca
    FROM Status_Rezerwacji
    WHERE UPPER(nazwa) = 'OCZEKUJACA';

    SELECT id
    INTO v_status_anulowana
    FROM Status_Rezerwacji
    WHERE UPPER(nazwa) = 'ANULOWANA';

    IF INSERTING OR UPDATING THEN
        v_rezerwacja_id := :NEW.Rezerwacja_id;
    ELSE
        v_rezerwacja_id := :OLD.Rezerwacja_id;
    END IF;

    SELECT Status_Rezerwacji_id
    INTO v_aktualny_status
    FROM Rezerwacja
    WHERE id = v_rezerwacja_id;

    IF v_aktualny_status <> v_status_anulowana THEN

        IF DELETING THEN
            UPDATE Rezerwacja
            SET Status_Rezerwacji_id = v_status_oczekujaca
            WHERE id = v_rezerwacja_id;
        ELSE
            SELECT nazwa
            INTO v_status_platnosci
            FROM Status_Platnosci
            WHERE id = :NEW.Status_Platnosci_id;

            IF UPPER(v_status_platnosci) = 'OPLACONA' THEN
                UPDATE Rezerwacja
                SET Status_Rezerwacji_id = v_status_potwierdzona
                WHERE id = v_rezerwacja_id;
            ELSE
                UPDATE Rezerwacja
                SET Status_Rezerwacji_id = v_status_oczekujaca
                WHERE id = v_rezerwacja_id;
            END IF;
        END IF;

    END IF;
END;
/



-- Czyszczenie danych ------------------------------------
DELETE FROM Galeria
WHERE Sesja_id = 99;

DELETE FROM Sesja
WHERE id = 99;

DELETE FROM Platnosc
WHERE id = 99;

COMMIT;
-----------------------------------------------------------------------------------------------------------------


-- TESTY TRIGGEROW
-- 1: Bledny czas sesji, powinien pojawic sie blad
INSERT INTO Sesja VALUES (
    99, 1, 1, 1, 1, 1,
    TIMESTAMP '2026-07-01 14:00:00',
    TIMESTAMP '2026-07-01 12:00:00'
);


-- 2: Platnosc z ujemna kwota, powinien pojawic sie blad
INSERT INTO Platnosc VALUES (
    99, 8, 1, 2,
    -100,
    SYSDATE
);


-- 3: Platnosc oplacona bez daty, trigger powinien wpisac dzisiejsza date
INSERT INTO Platnosc VALUES (
    99, 8, 1, 2,
    100,
    NULL
);

SELECT id, Rezerwacja_id, kwota, data_platnosci
FROM Platnosc
WHERE id = 99;


-- 4: Dodanie sesji, trigger powinien automatycznie utworzyc galerie
INSERT INTO Sesja VALUES (
    99, 8, 2, 2, 2, 1,
    TIMESTAMP '2026-07-01 10:00:00',
    TIMESTAMP '2026-07-01 12:00:00'
);

SELECT *
FROM Galeria
WHERE Sesja_id = 99;

-- 5: UPDATE platnosci, trigger powinien zmienic status rezerwacji
UPDATE Platnosc
SET kwota = 500,
    Status_Platnosci_id = 2
WHERE id = 99;

SELECT r.id, sr.nazwa AS status_rezerwacji
FROM Rezerwacja r
JOIN Status_Rezerwacji sr ON r.Status_Rezerwacji_id = sr.id
WHERE r.id = 8;


-- 6: DELETE platnosci, trigger powinien zmienic status rezerwacji na oczekujaca
DELETE FROM Platnosc
WHERE id = 99;

SELECT r.id, sr.nazwa AS status_rezerwacji
FROM Rezerwacja r
JOIN Status_Rezerwacji sr ON r.Status_Rezerwacji_id = sr.id
WHERE r.id = 8;


-- 7: Usuniecie testowej sesji i galerii
DELETE FROM Galeria
WHERE Sesja_id = 99;

DELETE FROM Sesja
WHERE id = 99;

SELECT *
FROM Sesja
WHERE id = 99;

COMMIT;