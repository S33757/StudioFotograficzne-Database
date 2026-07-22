-- Zapytania z JOIN:
--1: Historia sesji klientow wraz z fotografem, usluga, lokalizacja i statusem sesji
SELECT
    k.imie AS klient_imie,
    k.nazwisko AS klient_nazwisko,
    r.id AS rezerwacja_id,
    s.id AS sesja_id,
    u.nazwa AS usluga,
    f.imie AS fotograf_imie,
    f.nazwisko AS fotograf_nazwisko,
    l.nazwa AS lokalizacja,
    ss.nazwa AS status_sesji,
    s.godzina_start,
    s.godzina_koniec
FROM Klient k
JOIN Rezerwacja r ON k.id = r.Klient_id
JOIN Sesja s ON r.id = s.Rezerwacja_id
JOIN Usluga u ON s.Usluga_id = u.id
JOIN Fotograf f ON s.Fotograf_id = f.id
JOIN Lokalizacja l ON s.Lokalizacja_id = l.id
JOIN Status_Sesji ss ON s.Status_Sesji_id = ss.id
ORDER BY k.nazwisko, s.godzina_start;


--2: Sprzet uzyty podczas sesji
SELECT s.id AS sesja_id, sp.nazwa AS sprzet, ts.nazwa AS typ_sprzetu, ss.ilosc, ss.uwagi
FROM Sesja s
JOIN Sesja_Sprzet ss ON s.id = ss.Sesja_id
JOIN Sprzet sp ON ss.Sprzet_id = sp.id
JOIN Typ_Sprzetu ts ON sp.Typ_Sprzetu_id = ts.id
ORDER BY s.id;



-- Zapytania z funkcjami agregujacymi oraz GROUP BY / HAVING
--1: Laczna kwota oplaconych platnosci dla kazdej rezerwacji
SELECT r.id AS rezerwacja_id, k.imie, k.nazwisko, SUM(p.kwota) AS suma_oplaconych_platnosci
FROM Rezerwacja r
JOIN Klient k ON r.Klient_id = k.id
JOIN Platnosc p ON r.id = p.Rezerwacja_id
JOIN Status_Platnosci sp ON p.Status_Platnosci_id = sp.id
WHERE UPPER(sp.nazwa) = 'OPLACONA'
GROUP BY r.id, k.imie, k.nazwisko
HAVING SUM(p.kwota) > 500;


--2: Liczba sesji wykonanych przez fotografow
SELECT f.id AS fotograf_id, f.imie, f.nazwisko,
    COUNT(s.id) AS liczba_sesji
FROM Fotograf f
LEFT JOIN Sesja s ON f.id = s.Fotograf_id
GROUP BY f.id, f.imie, f.nazwisko
HAVING COUNT(s.id) >= 1;



-- Zapytania z podzapytaniem
-- 1: Uslugi drozsze niz srednia cena wszystkich uslug
SELECT id, nazwa, cena
FROM Usluga
WHERE cena > (
    SELECT AVG(cena)
    FROM Usluga
);


-- 2: Klienci, ktorzy maja rezerwacje o statusie 'Potwierdzona'
SELECT id, imie, nazwisko, email
FROM Klient
WHERE id IN (
    SELECT Klient_id
    FROM Rezerwacja
    WHERE Status_Rezerwacji_id = (
        SELECT id
        FROM Status_Rezerwacji
        WHERE nazwa = 'Potwierdzona'
    )
);



-- Zapytanie skorelowane:
-- Galerie z liczba nieobrobionych zdjec
SELECT
    g.id AS galeria_id,
    g.nazwa AS galeria,
    g.data_utworzenia,
    (
        SELECT COUNT(*)
        FROM Zdjecie z
        WHERE z.Galeria_id = g.id
          AND z.czy_obrobione = 0
    ) AS liczba_nieobrobionych,
    (
        SELECT COUNT(*)
        FROM Zdjecie z
        WHERE z.Galeria_id = g.id
    ) AS liczba_wszystkich
FROM Galeria g
WHERE (
    SELECT COUNT(*)
    FROM Zdjecie z
    WHERE z.Galeria_id = g.id
      AND z.czy_obrobione = 0
) > 0
ORDER BY liczba_nieobrobionych DESC;