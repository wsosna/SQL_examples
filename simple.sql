--RBD projekt, walidacja
--Zapytanie podstawowe

SELECT towary.nazwa, pozycjedok.ilosc
FROM pozycjedok, towary
WHERE ilosc=2 OR ilosc=3
ORDER BY ilosc;

select * from document
where symbol = 'WZ' AND data='18/12/12';
SELECT nazwa AS Drukarki , cena 
FROM towary
WHERE nazwa LIKE '%Drukarka%' AND
cena < 350;

--Ze złączeniami

--ZAPYTANIE O JEDNA FAKTURE
select dokument.nazwa, towary.nazwa, pozycjedok.ilosc
from pozycjedok
INNER JOIN dokument
ON pozycjedok.id_dokument = dokument.id_dokument
INNER JOIN towary
ON pozycjedok.id_towaru = towary.id_towaru
Where dokument.nazwa = 'FV/01/01';

-- ZAPYTANIE O TOWAR KUPIONY W ILOSCI WIEKSZEJ NIŻ 3

select  dokument.nazwa, towary.nazwa, kontrahent.nazwa, pozycjedok.ilosc
from pozycjedok
INNER JOIN towary
ON pozycjedok.id_towaru = towary.id_towaru
INNER JOIN dokhandlowy
ON pozycjedok.id_dokument = dokhandlowy.id_dokument
inner join kontrahent
on dokhandlowy.id_kontrahenta = kontrahent.id_kontrahenta
inner join dokument
on pozycjedok.id_dokument = dokument.id_dokument
where pozycjedok.ilosc > 3
ORDER BY dokhandlowy.id_kontrahenta;

--ZAPYTANIE O NUMERY FAKTUR Z KONTRAHENTEM NA KTÓREGO ZOSTALY WYSTAWIONE

Select dokument.nazwa AS Numer_Faktury, kontrahent.nazwa AS Nazwa_kontrahenta, kontrahent.adres
from dokhandlowy
inner join dokument
on dokhandlowy.id_dokument = dokument.id_dokument
inner join kontrahent
on dokhandlowy.id_kontrahenta = kontrahent.id_kontrahenta;

--	GRUPOWANIE

--Suma ilości z jednego dokumentu i suma ceny

SELECT pozycjedok.id_dokument, SUM(ilosc)AS ILOSC_SUMA, SUM(towary.cena) AS CENA_SUMA
From pozycjedok
inner join towary
on pozycjedok.id_towaru = towary.id_towaru
inner join dokument
on pozycjedok.id_dokument = dokument.id_dokument
group by pozycjedok.id_dokument;

--Ilość dokumentów w magazynie, inaczej ilość zamowien

SELECT id_magazynu, COUNT(*) AS Ilosc_Zamowien
From dokmagazynowy
Group by id_magazynu




