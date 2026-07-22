CREATE TABLE Typ_Sprzetu (
    id INTEGER PRIMARY KEY,
    nazwa VARCHAR2(30) NOT NULL UNIQUE,
    opis VARCHAR2(100)
);

CREATE TABLE Status_Sprzetu (
    id INTEGER PRIMARY KEY,
    nazwa VARCHAR2(30) NOT NULL UNIQUE,
    opis VARCHAR2(100)
);

CREATE TABLE Status_Sesji (
    id INTEGER PRIMARY KEY,
    nazwa VARCHAR2(30) NOT NULL UNIQUE,
    opis VARCHAR2(100)
);

CREATE TABLE Status_Rezerwacji (
    id INTEGER PRIMARY KEY,
    nazwa VARCHAR2(30) NOT NULL UNIQUE,
    opis VARCHAR2(100)
);

CREATE TABLE Status_Platnosci (
    id INTEGER PRIMARY KEY,
    nazwa VARCHAR2(30) NOT NULL UNIQUE,
    opis VARCHAR2(100)
);

CREATE TABLE Metoda_Platnosci (
    id INTEGER PRIMARY KEY,
    nazwa VARCHAR2(30) NOT NULL UNIQUE,
    opis VARCHAR2(100)
);

CREATE TABLE Specjalizacja (
    id INTEGER PRIMARY KEY,
    nazwa VARCHAR2(30) NOT NULL UNIQUE,
    opis VARCHAR2(100)
);

CREATE TABLE Lokalizacja (
    id INTEGER PRIMARY KEY,
    nazwa VARCHAR2(50) NOT NULL,
    adres VARCHAR2(50),
    typ VARCHAR2(30)
);

CREATE TABLE Klient (
    id INTEGER PRIMARY KEY,
    imie VARCHAR2(20) NOT NULL,
    nazwisko VARCHAR2(20) NOT NULL,
    telefon VARCHAR2(15),
    email VARCHAR2(50) UNIQUE
);

CREATE TABLE Fotograf (
    id INTEGER PRIMARY KEY,
    Specjalizacja_id INTEGER NOT NULL,
    imie VARCHAR2(20) NOT NULL,
    nazwisko VARCHAR2(20) NOT NULL,
    stawka_godzinowa NUMBER(8,2) NOT NULL,

    CONSTRAINT fk_fotograf_specjalizacja
        FOREIGN KEY (Specjalizacja_id)
        REFERENCES Specjalizacja(id),

    CONSTRAINT chk_fotograf_stawka
        CHECK (stawka_godzinowa > 0)
);

CREATE TABLE Usluga (
    id INTEGER PRIMARY KEY,
    nazwa VARCHAR2(50) NOT NULL,
    opis VARCHAR2(100),
    cena NUMBER(8,2) NOT NULL,
    czas_trwania INTEGER NOT NULL,

    CONSTRAINT chk_usluga_cena
        CHECK (cena > 0),

    CONSTRAINT chk_usluga_czas
        CHECK (czas_trwania > 0)
);

CREATE TABLE Sprzet (
    id INTEGER PRIMARY KEY,
    Typ_Sprzetu_id INTEGER NOT NULL,
    Status_Sprzetu_id INTEGER NOT NULL,
    nazwa VARCHAR2(50) NOT NULL,
    nr_seryjny VARCHAR2(30) UNIQUE,

    CONSTRAINT fk_sprzet_typ
        FOREIGN KEY (Typ_Sprzetu_id)
        REFERENCES Typ_Sprzetu(id),

    CONSTRAINT fk_sprzet_status
        FOREIGN KEY (Status_Sprzetu_id)
        REFERENCES Status_Sprzetu(id)
);

CREATE TABLE Rezerwacja (
    id INTEGER PRIMARY KEY,
    Klient_id INTEGER NOT NULL,
    Status_Rezerwacji_id INTEGER NOT NULL,
    data_rezerwacji DATE NOT NULL,
    uwagi VARCHAR2(100),

    CONSTRAINT fk_rezerwacja_klient
        FOREIGN KEY (Klient_id)
        REFERENCES Klient(id),

    CONSTRAINT fk_rezerwacja_status
        FOREIGN KEY (Status_Rezerwacji_id)
        REFERENCES Status_Rezerwacji(id)
);

CREATE TABLE Platnosc (
    id INTEGER PRIMARY KEY,
    Rezerwacja_id INTEGER NOT NULL,
    Metoda_Platnosci_id INTEGER NOT NULL,
    Status_Platnosci_id INTEGER NOT NULL,
    kwota NUMBER(8,2) NOT NULL,
    data_platnosci DATE,

    CONSTRAINT fk_platnosc_rezerwacja
        FOREIGN KEY (Rezerwacja_id)
        REFERENCES Rezerwacja(id),

    CONSTRAINT fk_platnosc_metoda
        FOREIGN KEY (Metoda_Platnosci_id)
        REFERENCES Metoda_Platnosci(id),

    CONSTRAINT fk_platnosc_status
        FOREIGN KEY (Status_Platnosci_id)
        REFERENCES Status_Platnosci(id),

    CONSTRAINT chk_platnosc_kwota
        CHECK (kwota > 0)
);

CREATE TABLE Sesja (
    id INTEGER PRIMARY KEY,
    Rezerwacja_id INTEGER NOT NULL,
    Usluga_id INTEGER NOT NULL,
    Fotograf_id INTEGER NOT NULL,
    Lokalizacja_id INTEGER NOT NULL,
    Status_Sesji_id INTEGER NOT NULL,
    godzina_start TIMESTAMP NOT NULL,
    godzina_koniec TIMESTAMP NOT NULL,

    CONSTRAINT fk_sesja_rezerwacja
        FOREIGN KEY (Rezerwacja_id)
        REFERENCES Rezerwacja(id),

    CONSTRAINT fk_sesja_usluga
        FOREIGN KEY (Usluga_id)
        REFERENCES Usluga(id),

    CONSTRAINT fk_sesja_fotograf
        FOREIGN KEY (Fotograf_id)
        REFERENCES Fotograf(id),

    CONSTRAINT fk_sesja_lokalizacja
        FOREIGN KEY (Lokalizacja_id)
        REFERENCES Lokalizacja(id),

    CONSTRAINT fk_sesja_status
        FOREIGN KEY (Status_Sesji_id)
        REFERENCES Status_Sesji(id),

    CONSTRAINT chk_sesja_czas
        CHECK (godzina_koniec > godzina_start)
);

CREATE TABLE Galeria (
    id INTEGER PRIMARY KEY,
    Sesja_id INTEGER NOT NULL,
    nazwa VARCHAR2(50) NOT NULL,
    data_utworzenia DATE NOT NULL,
    link_do_galerii VARCHAR2(100),

    CONSTRAINT fk_galeria_sesja
        FOREIGN KEY (Sesja_id)
        REFERENCES Sesja(id)
);

CREATE TABLE Zdjecie (
    id INTEGER PRIMARY KEY,
    Galeria_id INTEGER NOT NULL,
    nazwa_pliku VARCHAR2(50) NOT NULL,
    format VARCHAR2(10) NOT NULL,
    data_dodania DATE NOT NULL,
    czy_obrobione SMALLINT DEFAULT 0 NOT NULL,

    CONSTRAINT fk_zdjecie_galeria
        FOREIGN KEY (Galeria_id)
        REFERENCES Galeria(id),

    CONSTRAINT chk_zdjecie_obrobione
        CHECK (czy_obrobione IN (0, 1)),

    CONSTRAINT chk_zdjecie_format
        CHECK (UPPER(format) IN ('JPG', 'JPEG', 'PNG', 'TIFF', 'RAW'))
);

CREATE TABLE Sesja_Sprzet (
    Sesja_id INTEGER NOT NULL,
    Sprzet_id INTEGER NOT NULL,
    ilosc INTEGER NOT NULL,
    uwagi VARCHAR2(100),

    CONSTRAINT pk_sesja_sprzet
        PRIMARY KEY (Sesja_id, Sprzet_id),

    CONSTRAINT fk_sesja_sprzet_sesja
        FOREIGN KEY (Sesja_id)
        REFERENCES Sesja(id),

    CONSTRAINT fk_sesja_sprzet_sprzet
        FOREIGN KEY (Sprzet_id)
        REFERENCES Sprzet(id),

    CONSTRAINT chk_sesja_sprzet_ilosc
        CHECK (ilosc > 0)
);
