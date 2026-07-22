-- TYP_SPRZETU

INSERT INTO Typ_Sprzetu VALUES (1, 'Aparat', 'Aparaty fotograficzne');
INSERT INTO Typ_Sprzetu VALUES (2, 'Obiektyw', 'Obiektywy fotograficzne');
INSERT INTO Typ_Sprzetu VALUES (3, 'Statyw', 'Statywy fotograficzne');
INSERT INTO Typ_Sprzetu VALUES (4, 'Lampa', 'Oswietlenie studyjne i plenerowe');
INSERT INTO Typ_Sprzetu VALUES (5, 'Tlo', 'Tla fotograficzne');

-- STATUS_SPRZETU

INSERT INTO Status_Sprzetu VALUES (1, 'Dostepny', 'Sprzet gotowy do uzycia');
INSERT INTO Status_Sprzetu VALUES (2, 'W serwisie', 'Sprzet oddany do naprawy');
INSERT INTO Status_Sprzetu VALUES (3, 'Wypozyczony', 'Sprzet aktualnie uzywany');
INSERT INTO Status_Sprzetu VALUES (4, 'Uszkodzony', 'Sprzet wymaga sprawdzenia');

-- STATUS_SESJI

INSERT INTO Status_Sesji VALUES (1, 'Zaplanowana', 'Sesja oczekuje na realizacje');
INSERT INTO Status_Sesji VALUES (2, 'W trakcie', 'Sesja jest realizowana');
INSERT INTO Status_Sesji VALUES (3, 'Zakonczona', 'Sesja zostala zakonczona');
INSERT INTO Status_Sesji VALUES (4, 'Anulowana', 'Sesja zostala anulowana');

-- STATUS_REZERWACJI

INSERT INTO Status_Rezerwacji VALUES (1, 'Oczekujaca', 'Nowa rezerwacja');
INSERT INTO Status_Rezerwacji VALUES (2, 'Potwierdzona', 'Rezerwacja zaakceptowana');
INSERT INTO Status_Rezerwacji VALUES (3, 'Anulowana', 'Rezerwacja anulowana');
INSERT INTO Status_Rezerwacji VALUES (4, 'Zrealizowana', 'Rezerwacja zostala zrealizowana');

-- STATUS_PLATNOSCI

INSERT INTO Status_Platnosci VALUES (1, 'Oczekujaca', 'Platnosc nieoplacona');
INSERT INTO Status_Platnosci VALUES (2, 'Oplacona', 'Platnosc zakonczona');
INSERT INTO Status_Platnosci VALUES (3, 'Zwrocona', 'Platnosc zwrocona');
INSERT INTO Status_Platnosci VALUES (4, 'Czesciowa', 'Platnosc czesciowo oplacona');

-- METODA_PLATNOSCI

INSERT INTO Metoda_Platnosci VALUES (1, 'Gotowka', 'Platnosc gotowka');
INSERT INTO Metoda_Platnosci VALUES (2, 'Karta', 'Platnosc karta');
INSERT INTO Metoda_Platnosci VALUES (3, 'Przelew', 'Platnosc przelewem');
INSERT INTO Metoda_Platnosci VALUES (4, 'BLIK', 'Platnosc BLIK');
INSERT INTO Metoda_Platnosci VALUES (5, 'Voucher', 'Platnosc voucherem');

-- SPECJALIZACJA

INSERT INTO Specjalizacja VALUES (1, 'Slubna', 'Fotografia slubna');
INSERT INTO Specjalizacja VALUES (2, 'Portretowa', 'Fotografia portretowa');
INSERT INTO Specjalizacja VALUES (3, 'Produktowa', 'Fotografia produktowa');
INSERT INTO Specjalizacja VALUES (4, 'Eventowa', 'Fotografia wydarzen');
INSERT INTO Specjalizacja VALUES (5, 'Rodzinna', 'Fotografia rodzinna i dziecieca');

-- LOKALIZACJA

INSERT INTO Lokalizacja VALUES (1, 'Studio A', 'Warszawa, ul. Prosta 1', 'Studio');
INSERT INTO Lokalizacja VALUES (2, 'Studio B', 'Warszawa, ul. Pulawska 10', 'Studio');
INSERT INTO Lokalizacja VALUES (3, 'Lazienki Krolewskie', 'Warszawa', 'Plener');
INSERT INTO Lokalizacja VALUES (4, 'Park Saski', 'Warszawa', 'Plener');
INSERT INTO Lokalizacja VALUES (5, 'Sala Weselna Magnolia', 'Warszawa, ul. Slubna 5', 'Sala');
INSERT INTO Lokalizacja VALUES (6, 'Studio Produktowe', 'Warszawa, ul. Magazynowa 8', 'Studio');

-- KLIENT

INSERT INTO Klient VALUES (1, 'Jan', 'Kowalski', '500111222', 'jan@gmail.com');
INSERT INTO Klient VALUES (2, 'Anna', 'Nowak', '500333444', 'anna@gmail.com');
INSERT INTO Klient VALUES (3, 'Piotr', 'Wisniewski', '500555666', 'piotr@gmail.com');
INSERT INTO Klient VALUES (4, 'Klaudia', 'Zielinska', '501222333', 'klaudia@gmail.com');
INSERT INTO Klient VALUES (5, 'Michal', 'Wojcik', '502333444', 'michal@gmail.com');
INSERT INTO Klient VALUES (6, 'Natalia', 'Kaczmarek', '503444555', 'natalia@gmail.com');
INSERT INTO Klient VALUES (7, 'Tomasz', 'Kowalczyk', '504555666', 'tomasz@gmail.com');

-- FOTOGRAF

INSERT INTO Fotograf VALUES (1, 1, 'Marek', 'Nowicki', 120);
INSERT INTO Fotograf VALUES (2, 2, 'Karolina', 'Maj', 100);
INSERT INTO Fotograf VALUES (3, 3, 'Tomasz', 'Lewandowski', 150);
INSERT INTO Fotograf VALUES (4, 4, 'Olga', 'Krawczyk', 130);
INSERT INTO Fotograf VALUES (5, 5, 'Adam', 'Sikora', 110);

-- USLUGA

INSERT INTO Usluga VALUES (1, 'Sesja slubna', 'Fotografia slubna', 1500, 240);
INSERT INTO Usluga VALUES (2, 'Sesja portretowa', 'Fotografia portretowa', 500, 90);
INSERT INTO Usluga VALUES (3, 'Sesja produktowa', 'Fotografia produktow', 800, 120);
INSERT INTO Usluga VALUES (4, 'Reportaz eventowy', 'Fotografia z wydarzenia', 1200, 180);
INSERT INTO Usluga VALUES (5, 'Sesja rodzinna', 'Sesja rodzinna w studio lub plenerze', 700, 120);
INSERT INTO Usluga VALUES (6, 'Sesja biznesowa', 'Zdjecia do CV i social media', 400, 60);

-- SPRZET

INSERT INTO Sprzet VALUES (1, 1, 1, 'Canon EOS R6', 'CAN001');
INSERT INTO Sprzet VALUES (2, 2, 1, 'Canon RF 50mm', 'OBJ001');
INSERT INTO Sprzet VALUES (3, 3, 2, 'Manfrotto 190', 'STA001');
INSERT INTO Sprzet VALUES (4, 4, 1, 'Profoto B10 Plus', 'LAM001');
INSERT INTO Sprzet VALUES (5, 2, 1, 'Canon RF 24-70mm', 'OBJ002');
INSERT INTO Sprzet VALUES (6, 1, 3, 'Sony A7 IV', 'SON001');
INSERT INTO Sprzet VALUES (7, 5, 1, 'Tlo biale', 'TLO001');
INSERT INTO Sprzet VALUES (8, 5, 1, 'Tlo czarne', 'TLO002');
INSERT INTO Sprzet VALUES (9, 4, 4, 'Softbox 120cm', 'LAM002');
INSERT INTO Sprzet VALUES (10, 2, 1, 'Sigma 85mm', 'OBJ003');

-- REZERWACJA

INSERT INTO Rezerwacja VALUES (1, 1, 4, TO_DATE('2026-05-20','YYYY-MM-DD'), 'Sesja slubna');
INSERT INTO Rezerwacja VALUES (2, 2, 1, TO_DATE('2026-06-02','YYYY-MM-DD'), 'Sesja portretowa');
INSERT INTO Rezerwacja VALUES (3, 3, 2, TO_DATE('2026-06-03','YYYY-MM-DD'), 'Sesja produktowa');
INSERT INTO Rezerwacja VALUES (4, 4, 2, TO_DATE('2026-06-04','YYYY-MM-DD'), 'Reportaz eventowy');
INSERT INTO Rezerwacja VALUES (5, 5, 1, TO_DATE('2026-06-05','YYYY-MM-DD'), 'Sesja rodzinna w plenerze');
INSERT INTO Rezerwacja VALUES (6, 6, 3, TO_DATE('2026-06-06','YYYY-MM-DD'), 'Anulowana sesja biznesowa');
INSERT INTO Rezerwacja VALUES (7, 7, 2, TO_DATE('2026-06-07','YYYY-MM-DD'), 'Sesja biznesowa');
INSERT INTO Rezerwacja VALUES (8, 1, 1, TO_DATE('2026-06-08','YYYY-MM-DD'), 'Dodatkowa sesja portretowa');

-- PLATNOSC

INSERT INTO Platnosc VALUES (1, 1, 3, 2, 1500, TO_DATE('2026-05-21','YYYY-MM-DD'));
INSERT INTO Platnosc VALUES (2, 2, 2, 4, 250, TO_DATE('2026-06-06','YYYY-MM-DD'));
INSERT INTO Platnosc VALUES (3, 3, 1, 2, 800, TO_DATE('2026-06-07','YYYY-MM-DD'));
INSERT INTO Platnosc VALUES (4, 4, 4, 2, 1200, TO_DATE('2026-06-08','YYYY-MM-DD'));
INSERT INTO Platnosc VALUES (5, 5, 3, 1, 300, NULL);
INSERT INTO Platnosc VALUES (6, 6, 2, 3, 400, TO_DATE('2026-06-09','YYYY-MM-DD'));
INSERT INTO Platnosc VALUES (7, 7, 2, 2, 400, TO_DATE('2026-06-10','YYYY-MM-DD'));
INSERT INTO Platnosc VALUES (8, 8, 1, 1, 100, NULL);
INSERT INTO Platnosc VALUES (9, 5, 4, 4, 200, TO_DATE('2026-06-11','YYYY-MM-DD'));
INSERT INTO Platnosc VALUES (10, 2, 3, 2, 250, TO_DATE('2026-06-12','YYYY-MM-DD'));

-- SESJA

INSERT INTO Sesja VALUES (1, 1, 1, 1, 5, 3, TIMESTAMP '2026-05-25 10:00:00', TIMESTAMP '2026-05-25 14:00:00');
INSERT INTO Sesja VALUES (2, 2, 2, 2, 2, 1, TIMESTAMP '2026-06-15 12:00:00', TIMESTAMP '2026-06-15 13:30:00');
INSERT INTO Sesja VALUES (3, 3, 3, 3, 6, 1, TIMESTAMP '2026-06-20 09:00:00', TIMESTAMP '2026-06-20 11:00:00');
INSERT INTO Sesja VALUES (4, 4, 4, 4, 4, 1, TIMESTAMP '2026-06-28 14:00:00', TIMESTAMP '2026-06-28 17:00:00');
INSERT INTO Sesja VALUES (5, 5, 5, 5, 3, 1, TIMESTAMP '2026-07-02 10:00:00', TIMESTAMP '2026-07-02 12:00:00');
INSERT INTO Sesja VALUES (6, 6, 6, 2, 1, 4, TIMESTAMP '2026-07-04 11:00:00', TIMESTAMP '2026-07-04 12:00:00');
INSERT INTO Sesja VALUES (7, 7, 6, 5, 1, 1, TIMESTAMP '2026-07-08 15:00:00', TIMESTAMP '2026-07-08 16:00:00');
INSERT INTO Sesja VALUES (8, 8, 2, 1, 2, 1, TIMESTAMP '2026-07-12 10:00:00', TIMESTAMP '2026-07-12 11:30:00');

-- GALERIA

INSERT INTO Galeria VALUES (1, 1, 'Galeria Slubna Kowalscy', TO_DATE('2026-05-26','YYYY-MM-DD'), '/galerie/slubna_kowalscy');
INSERT INTO Galeria VALUES (2, 2, 'Galeria Portretowa Anna', TO_DATE('2026-06-16','YYYY-MM-DD'), '/galerie/portret_anna');
INSERT INTO Galeria VALUES (3, 3, 'Galeria Produktowa Piotr', TO_DATE('2026-06-21','YYYY-MM-DD'), '/galerie/produkt_piotr');
INSERT INTO Galeria VALUES (4, 4, 'Galeria Event Klaudia', TO_DATE('2026-06-29','YYYY-MM-DD'), '/galerie/event_klaudia');
INSERT INTO Galeria VALUES (5, 5, 'Galeria Rodzinna Michal', TO_DATE('2026-07-03','YYYY-MM-DD'), '/galerie/rodzinna_michal');
INSERT INTO Galeria VALUES (6, 6, 'Galeria Anulowana Natalia', TO_DATE('2026-07-04','YYYY-MM-DD'), '/galerie/anulowana_natalia');
INSERT INTO Galeria VALUES (7, 7, 'Galeria Biznes Tomasz', TO_DATE('2026-07-09','YYYY-MM-DD'), '/galerie/biznes_tomasz');
INSERT INTO Galeria VALUES (8, 8, 'Galeria Portret Jan', TO_DATE('2026-07-13','YYYY-MM-DD'), '/galerie/portret_jan');

-- ZDJECIE

INSERT INTO Zdjecie VALUES (1, 1, 'slub1.jpg', 'JPG', TO_DATE('2026-05-26','YYYY-MM-DD'), 1);
INSERT INTO Zdjecie VALUES (2, 1, 'slub2.jpg', 'JPG', TO_DATE('2026-05-26','YYYY-MM-DD'), 1);
INSERT INTO Zdjecie VALUES (3, 1, 'slub3.jpg', 'JPG', TO_DATE('2026-05-26','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (4, 2, 'portret1.jpg', 'JPG', TO_DATE('2026-06-16','YYYY-MM-DD'), 1);
INSERT INTO Zdjecie VALUES (5, 2, 'portret2.jpg', 'JPG', TO_DATE('2026-06-16','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (6, 3, 'produkt1.png', 'PNG', TO_DATE('2026-06-21','YYYY-MM-DD'), 1);
INSERT INTO Zdjecie VALUES (7, 3, 'produkt2.png', 'PNG', TO_DATE('2026-06-21','YYYY-MM-DD'), 1);
INSERT INTO Zdjecie VALUES (8, 3, 'produkt3.raw', 'RAW', TO_DATE('2026-06-21','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (9, 4, 'event1.jpg', 'JPG', TO_DATE('2026-06-29','YYYY-MM-DD'), 1);
INSERT INTO Zdjecie VALUES (10, 4, 'event2.jpg', 'JPG', TO_DATE('2026-06-29','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (11, 5, 'rodzina1.jpg', 'JPG', TO_DATE('2026-07-03','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (12, 5, 'rodzina2.jpg', 'JPG', TO_DATE('2026-07-03','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (13, 5, 'rodzina3.jpg', 'JPG', TO_DATE('2026-07-03','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (14, 6, 'anulowana1.jpg', 'JPG', TO_DATE('2026-07-04','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (15, 7, 'biznes1.jpg', 'JPG', TO_DATE('2026-07-09','YYYY-MM-DD'), 1);
INSERT INTO Zdjecie VALUES (16, 7, 'biznes2.jpg', 'JPG', TO_DATE('2026-07-09','YYYY-MM-DD'), 1);
INSERT INTO Zdjecie VALUES (17, 8, 'jan_portret1.jpg', 'JPG', TO_DATE('2026-07-13','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (18, 8, 'jan_portret2.jpg', 'JPG', TO_DATE('2026-07-13','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (19, 8, 'jan_portret3.tiff', 'TIFF', TO_DATE('2026-07-13','YYYY-MM-DD'), 0);
INSERT INTO Zdjecie VALUES (20, 4, 'event3.jpg', 'JPG', TO_DATE('2026-06-29','YYYY-MM-DD'), 1);

-- SESJA_SPRZET

INSERT INTO Sesja_Sprzet VALUES (1, 1, 1, 'Aparat glowny');
INSERT INTO Sesja_Sprzet VALUES (1, 2, 1, 'Obiektyw portretowy');
INSERT INTO Sesja_Sprzet VALUES (1, 4, 2, 'Lampy do sali');
INSERT INTO Sesja_Sprzet VALUES (2, 1, 1, 'Aparat zapasowy');
INSERT INTO Sesja_Sprzet VALUES (2, 10, 1, 'Obiektyw do portretu');
INSERT INTO Sesja_Sprzet VALUES (3, 6, 1, 'Aparat do produktow');
INSERT INTO Sesja_Sprzet VALUES (3, 5, 1, 'Obiektyw uniwersalny');
INSERT INTO Sesja_Sprzet VALUES (3, 7, 1, 'Tlo do produktow');
INSERT INTO Sesja_Sprzet VALUES (4, 1, 1, 'Aparat do reportazu');
INSERT INTO Sesja_Sprzet VALUES (4, 5, 1, 'Zoom do wydarzenia');
INSERT INTO Sesja_Sprzet VALUES (5, 6, 1, 'Aparat plenerowy');
INSERT INTO Sesja_Sprzet VALUES (5, 2, 1, 'Obiektyw jasny');
INSERT INTO Sesja_Sprzet VALUES (7, 1, 1, 'Aparat do biznesu');
INSERT INTO Sesja_Sprzet VALUES (7, 8, 1, 'Czarne tlo');
INSERT INTO Sesja_Sprzet VALUES (8, 1, 1, 'Aparat portretowy');
INSERT INTO Sesja_Sprzet VALUES (8, 10, 1, 'Obiektyw portretowy');

COMMIT;