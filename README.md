# StudioFotograficzne-Database

Projekt wykonany w ramach studiów na kierunku **Zarządzanie Informacją** w Polsko-Japońskiej Akademii Technik Komputerowych (PJATK).

## Opis projektu

Celem projektu było zaprojektowanie oraz implementacja relacyjnej bazy danych dla studia fotograficznego z wykorzystaniem **Oracle SQL** oraz **PL/SQL**.

Baza danych umożliwia zarządzanie m.in.:
- klientami,
- fotografami,
- rezerwacjami,
- usługami fotograficznymi,
- sesjami zdjęciowymi,
- płatnościami.

Projekt zawiera również zestaw zapytań SQL oraz wyzwalaczy (triggerów) automatyzujących wybrane procesy i zapewniających spójność danych.

## Wykorzystane technologie

- Oracle Database
- Oracle SQL
- PL/SQL
- Oracle SQL Developer
- Redgate Data Modeler
- Lucidchart

## Struktura repozytorium

```text
.
├── create.sql             # Skrypt tworzący strukturę bazy danych
├── insert.sql             # Dane testowe
├── queries.sql            # Przykładowe zapytania SQL
├── triggers.sql           # Wyzwalacze PL/SQL
└── Diagram_Encji.png      # Diagram encji i relacji
```

## Funkcjonalności

- projekt relacyjnej bazy danych,
- wykorzystanie kluczy głównych i obcych,
- zapewnienie integralności danych za pomocą ograniczeń,
- zapytania SQL z użyciem:
  - JOIN,
  - GROUP BY,
  - HAVING,
  - podzapytań,
  - funkcji agregujących,
- implementacja wyzwalaczy PL/SQL,
- przygotowanie danych testowych.

## Przykładowe możliwości systemu

- zarządzanie klientami,
- obsługa rezerwacji sesji zdjęciowych,
- ewidencja płatności,
- generowanie raportów za pomocą zapytań SQL,
- automatyczna kontrola poprawności danych przy użyciu wyzwalaczy.

## Cel projektu

Projekt został wykonany w celach edukacyjnych i ma na celu zaprezentowanie umiejętności z zakresu:
- projektowania relacyjnych baz danych,
- tworzenia zapytań SQL,
- programowania w PL/SQL,
- modelowania danych,
- dokumentowania projektu informatycznego.

---

## Autor

**Hubert Bogucki**  
Student Zarządzania Informacją  
Polsko-Japońska Akademia Technik Komputerowych (PJATK)
