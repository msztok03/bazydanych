CREATE TABLE rozliczenia.pracownicy (id_pracownika int NOT NULL, imie varchar(255) NOT NULL, nazwisko varchar(255) NOT NULL, adres varchar(255), telefon int, PRIMARY KEY (id_pracownika));
CREATE TABLE rozliczenia.godziny(id_godziny int NOT NULL, data timestamptz NOT NULL, liczba_godzin int NOT NULL, id_pracownika int NOT NULL, PRIMARY KEY(id_godziny));
CREATE TABLE rozliczenia.pensje(id_pensji int NOT NULL, stanowisko varchar(255) NOT NULL, kwota decimal NOT NULL, id_premii int NOT NULL, PRIMARY KEY(id_pensji));
CREATE TABLE rozliczenia.premie(id_premii int NOT NULL, rodzaj varchar(255) NOT NULL, kwota decimal NOT NULL, PRIMARY KEY(id_premii));
ALTER TABLE rozliczenia.godziny ADD CONSTRAINT id_pracownika FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy (id_pracownika);
ALTER TABLE rozliczenia.pensje ADD CONSTRAINT id_premii FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie (id_premii);
insert into rozliczenia.pracownicy ("id_pracownika", "imie", "nazwisko", "adres", "telefon") values(1, 'Michał', 'Zaborek','difnswuovn', 4893732);
insert into rozliczenia.pracownicy ("id_pracownika", "imie", "nazwisko", "adres", "telefon") values(2, 'Dejw', 'Slonik','a', 44353);
insert into rozliczenia.pracownicy ("id_pracownika", "imie", "nazwisko", "adres", "telefon") values(3, 'Miś', 'Ptyś','b', 4732);
insert into rozliczenia.pracownicy ("id_pracownika", "imie", "nazwisko", "adres", "telefon") values(4, 'Chał', 'Borek', 'c', 2322);
insert into rozliczenia.pracownicy ("id_pracownika", "imie", "nazwisko", "adres", "telefon") values(5, 'Ał', 'Rek','d', 4832);
insert into rozliczenia.pracownicy ("id_pracownika", "imie", "nazwisko", "adres", "telefon") values(6, 'Ichał', 'Aborek','e', 732);
insert into rozliczenia.pracownicy ("id_pracownika", "imie", "nazwisko", "adres", "telefon") values(7, 'Hał', 'Orek','f', 3732);
insert into rozliczenia.pracownicy ("id_pracownika", "imie", "nazwisko", "adres", "telefon") values(8, 'MiMichał', 'Zazaborek','g', 93732);
insert into rozliczenia.pracownicy ("id_pracownika", "imie", "nazwisko", "adres", "telefon") values(9, 'Chałmi', 'Borek','h', 4433732);
insert into rozliczenia.pracownicy ("id_pracownika", "imie", "nazwisko", "adres", "telefon") values(10, 'Mich', 'Zab','i', 35432);
INSERT INTO rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika)
VALUES
  (1, '2023-01-01', 8, 1),
  (2, '2023-01-02', 7, 2),
  (3, '2023-01-03', 9, 3),
  (4, '2023-01-04', 8, 4),
  (5, '2023-01-05', 7, 5),
  (6, '2023-01-06', 9, 6),
  (7, '2023-01-07', 8, 7),
  (8, '2023-01-08', 7, 8),
  (9, '2023-01-09', 9, 9),
  (10, '2023-01-10', 8, 10);
   INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota)
VALUES
  (1, 'Premia roczna', 1000),
  (2, 'Premia za wyniki', 800),
  (3, 'Premia za sprzedaż', 900),
  (4, 'Premia kwartalna', 750),
  (5, 'Premia za osiągnięcia', 850),
  (6, 'Premia za staż', 700),
  (7, 'Premia miesięczna', 750),
  (8, 'Premia za projekt', 1200),
  (9, 'Premia za jakość pracy', 950),
  (10, 'Premia za obsługę klienta', 700);
  INSERT INTO rozliczenia.pensje (id_pensji, stanowisko, kwota, id_premii)
VALUES
  (1, 'Kierownik', 5000, 1),
  (2, 'Programista', 4000, 2),
  (3, 'Specjalista ds. Sprzedaży', 4500, 3),
  (4, 'Księgowy', 4200, 4),
  (5, 'Inżynier', 4300, 5),
  (6, 'Asystent', 3500, 6),
  (7, 'Administrator', 4200, 7),
  (8, 'Projektant', 4800, 8),
  (9, 'Technik', 3700, 9),
  (10, 'Recepcjonista', 3500, 10);*/
Select rozliczenia.pracownicy.nazwisko, rozliczenia.pracownicy.adres from rozliczenia.pracownicy;
SELECT
    id_godziny,
    date_part('weekday', rozliczenia.godziny.data),
    date_part('month', rozliczenia.godziny.data)
FROM rozliczenia.godziny;
ALTER TABLE rozliczenia.pensje
RENAME COLUMN kwota TO kwota_brutto;
ALTER TABLE rozliczenia.pensje
ADD COLUMN kwota_netto numeric; 
UPDATE rozliczenia.pensje
SET kwota_netto = kwota_brutto * (1 - 23/ 100);