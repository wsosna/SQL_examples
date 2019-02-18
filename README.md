# SQL

### Pivot - example

##### BEFORE
---
|Pracownik|Dodatek|Kwota|
| ------------- |:-------------:| -----:|
|0024|Składka PZU|80 zł|
|0024|Dodatek za staż|123 zł|
|0089|Premia|230zł|
|0024|Premia|400zł|
|01672|Składka PZU| 76zł|
|01672|Dodatek za staż|25zł|


##### AFTER
---

| Pracownik     |  Składka PZU     | Premia  | Dodatek za staż|
| ------------- |:-------------:| -----:|-----:|
| 0024      | 80 zł | 400 zł | 123 zł|
| 0089      | 84 zł      |   230 zł | NULL|
| 01672 | 76 zł      |    NULL | 25 zł|
