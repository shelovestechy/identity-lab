# Access Request ei ole vain tiketti

Käyttöoikeuspyyntö voi näyttää arjessa yksinkertaiselta tikettityöltä.

Käyttäjä tarvitsee pääsyn johonkin järjestelmään, kansioon tai sovellukseen. Tiketti tulee sisään. Joku hyväksyy. IT lisää oikeuden. Tiketti suljetaan.

Paperilla tämä kuulostaa helpolta.

Käytännössä käyttöoikeuspyyntö on paljon enemmän kuin tekninen tehtävä.

Se liittyy tarpeeseen, vastuuseen, hyväksyntään, järjestelmän omistajuuteen, tietoturvaan, dokumentointiin ja siihen kuka myöhemmi pystyy todistamaan miksi oikeus annettiin.

---

## Pikakatsaus

Hyvässä käyttöoikeuspyynnössä pitäisi selvitä ainakin:

- kuka tarvitsee oikeuden
- mihin järjestelmään tai resurssiin oikeus tarvitaan
- miksi oikeus tarvitaan
- kuka hyväksyy pyynnön
- kuka omistaa järjestelmän tai tiedon
- onko oikeus pysyvä vai väliaikainen
- milloin oikeus pitää tarkistaa tai poistaa
- mitä riskiä oikeuteen liittyy
- mitä tikettiin dokumentoidaan

**Elikkäs:**  
Access request ei ole vain “lisää käyttäjä ryhmään”. Se on päätös siitä, kuka saa pääsyn johonkin ja millä perusteella.

---

## Esimerkkitilanne

Aku Ankka tarvitsee pääsyn Ankkalinna Oy:n raportointijärjestelmään.

Hän tekee pyynnön yrityksen tikettijärjestelmään, esimerkiksi ServiceNow’hun, tai ilmoittaa tarpeesta esihenkilölleen.

Pyynnössä lukee:

- käyttäjä: Aku Ankka
- tarvittava oikeus: raportointijärjestelmän lukuoikeus
- perustelu: tarvitsee pääsyn viikoittaisten tuotantoraporttien tarkasteluun
- hyväksyjä: Akun esihenkilö
- järjestelmän omistaja: raportointijärjestelmän pääkäyttäjä tai business owner

Jos prosessi toimii hyvin, oikeus annetaan vasta kun tarve on perusteltu ja oikea vastuuhenkilö on hyväksynyt pyynnön.

Jos prosessi toimii huonosti, oikeus voidaan antaa vain siksi, että käyttäjä pyysi sitä.

**Elikkäs:**  
Käyttäjä voi ilmoittaa tarpeen, mutta käyttöoikeuden ei pitäisi syntyä pelkästä “haluan tämän” -pyynnöstä.

---

## Käyttäjä ei yleensä omista päätöstä

Käyttäjä tietää usein, mitä hän ei pysty tekemään.

Hän voi sanoa:

> “En pääse raportointijärjestelmään.”

Tai:

> “Tarvitsen oikeuden tähän kansioon.”

Mutta käyttäjä ei aina tiedä:

- mitä oikeustasoa hän tarvitsee
- mitä kaikkea oikeus antaa
- onko oikeus liian laaja
- kuuluuko pääsy hänen rooliinsa
- onko tieto arkaluontoista
- kuka oikeuden saa hyväksyä

Siksi käyttöoikeuspyynnössä pitää erottaa kaksi asiaa:

- käyttäjän tarve
- organisaation päätös antaa oikeus

Käyttäjä voi kertoa tarpeen, mutta vastuu päätöksestä kuuluu esihenkilölle, järjestelmän omistajalle tai muulle määritellylle hyväksyjälle.

**Elikkäs:**  
Käyttäjä voi pyytää pääsyä, mutta käyttäjän oma pyyntö ei yksin saa olla hyväksyntä.

---

## Esihenkilön vastuu

Esihenkilöllä on usein tärkeä rooli käyttöoikeuspyynnöissä.

Esihenkilön pitäisi tietää:

- mitä työntekijä tekee
- mitä järjestelmiä työssä tarvitaan
- onko pyyntö perusteltu
- liittyykö oikeus nykyiseen tehtävään
- onko kyse pysyvästä vai väliaikaisesta tarpeesta
- pitääkö oikeus poistaa myöhemmin

Mutta tässä on käytännön ongelma.

Esihenkilö ei aina ymmärrä järjestelmän oikeustasoja tai sitä, mitä joku ryhmä oikeasti antaa.

Esimerkiksi Ankkalinna Oy:ssä esihenkilö voi hyväksyä Akulle oikeuden ryhmään `REPORTING-FINANCE-RW`, koska nimi kuulostaa raportointiin liittyvältä.

Todellisuudessa ryhmä voi antaa muokkausoikeuden talousraportteihin, vaikka Akulle riittäisi pelkkä lukuoikeus.

**Riski:**  
Esihenkilö voi hyväksyä oikeuden ymmärtämättä täysin mitä oikeus antaa.

**Elikkäs:**  
Esihenkilö tietää työn tarpeen, mutta järjestelmän omistajan pitäisi usein tietää oikeuden tekninen ja toiminnallinen merkitys.

---

## Järjestelmän omistajan vastuu

Järjestelmän omistaja tai pääkäyttäjä tuntee yleensä paremmin järjestelmän roolit ja oikeustasot.

Hänen pitäisi ymmärtää esimerkiksi:

- mitä eri roolit tarkoittavat
- mikä oikeus on lukuoikeus
- mikä oikeus antaa muokkausmahdollisuuden
- mikä oikeus antaa admin-tason valtaa
- mitä tietoa järjestelmässä käsitellään
- mitä riskejä väärään oikeuteen liittyy

Jos järjestelmällä ei ole selkeää omistajaa, käyttöoikeuspyynnöt muuttuvat helposti arvailuksi.

Service Desk voi nähdä tiketin ja teknisesti tietää miten käyttäjä lisätään ryhmään, mutta se ei tarkoita, että Service Desk tietäisi kuuluuko käyttäjän saada kyseinen oikeus.

**Elikkäs:**  
Järjestelmän omistajan pitäisi tietää mitä oikeus tarkoittaa. IT voi toteuttaa, mutta jonkun pitää omistaa päätös.

---

## Service Deskin rooli

Service Desk on usein se paikka, jossa käyttöoikeuspyyntö näkyy käytännössä.

Service Desk voi:

- vastaanottaa tiketin
- tarkistaa pyynnön tiedot
- varmistaa hyväksynnän
- lisätä käyttäjän oikeaan ryhmään
- dokumentoida tehdyn muutoksen
- sulkea tiketin
- huomata toistuvia ongelmia prosessissa

Mutta Service Desk ei saisi joutua arvaamaan, kuuluuko oikeus käyttäjälle.

Jos tiketti on epäselvä, siitä pitäisi selvitä ennen toteutusta:

- mitä oikeutta pyydetään
- kuka hyväksyi pyynnön
- mihin perustuu oikeuden tarve
- onko oikeus määräaikainen
- onko kyseessä normaali vai poikkeava oikeus

**Riski:**  
Jos prosessi on epäselvä, Service Desk voi joutua kantamaan vastuuta päätöksestä, jota sen ei pitäisi omistaa.

**Elikkäs:**  
Service Desk voi olla toteuttaja, mutta sen ei pitäisi olla arvaaja.

---

## “Kiireellinen tarve” ei saisi ohittaa kaikkea

Joskus käyttöoikeuspyyntö tulee kiireellisenä.

Esimerkiksi Ankkalinna Oy:ssä Hannu Hanhi tarvitsee nopeasti pääsyn hyväksyntäjärjestelmään, koska esihenkilö on lomalla ja työ pitää saada eteenpäin.

Kiire voi olla todellinen.

Mutta kiire ei saisi tarkoittaa sitä, että kaikki kontrollit ohitetaan.

Tällaisessa tilanteessa pitäisi silti kysyä:

- kuka hyväksyy väliaikaisen oikeuden
- kuinka kauan oikeus on voimassa
- mitä oikeustasoa tarvitaan
- poistetaanko oikeus automaattisesti
- dokumentoidaanko poikkeus
- tarkistetaanko oikeus myöhemmin

**Riski:**  
Kiireellä annettu oikeus voi jäädä pysyväksi, vaikka tarve oli väliaikainen.

**Elikkäs:**  
Kiireellinen käyttöoikeus voi olla perusteltu, mutta sen pitää olla hallittu poikkeus, ei villi ohituskaista.

---

## Väliaikaiset oikeudet

Väliaikaiset oikeudet ovat käyttöoikeushallinnan klassinen miinakenttä.

Ne annetaan usein hyvällä syyllä:

- tuuraus
- projekti
- loma-aika
- auditointi
- testaus
- kiireellinen tuotantotilanne
- määräaikainen tehtävä

Ongelma syntyy silloin, kun väliaikaiselle oikeudelle ei anneta päättymispäivää.

Esimerkiksi Hannu Hanhi saa kahdeksi viikoksi pääsyn esihenkilön hyväksyntäkansioon.

Jos oikeutta ei poisteta tuurauksen jälkeen, Hannulla voi olla sama pääsy vielä vuoden päästä.

**Elikkäs:**  
Väliaikainen oikeus ilman päättymispäivää ei ole väliaikainen. Se on pysyvä oikeus valeviiksillä.

---

## Oikeuden laajuus pitää ymmärtää

Kaikki käyttöoikeudet eivät ole samanarvoisia.

On eri asia antaa käyttäjälle:

- lukuoikeus ohjeisiin
- muokkausoikeus raportteihin
- pääsy henkilötietoihin
- pääsy taloustietoihin
- oikeus hyväksyä maksuja
- admin-oikeus järjestelmään
- oikeus muuttaa muiden käyttäjien oikeuksia

Siksi pyynnössä pitäisi näkyä mahdollisimman tarkasti, mitä oikeutta pyydetään.

Huono pyyntö:

- “Tarvitsen pääsyn raportointiin.”

Parempi pyyntö:

- “Tarvitsen lukuoikeuden tuotantoraportteihin, koska seuraan oman tiimini viikkotilastoja.”

Vielä parempi, jos mukana on:

- järjestelmän nimi
- tarvittava rooli
- perustelu
- hyväksyjä
- päättymispäivä, jos oikeus on väliaikainen

**Elikkäs:**  
“Pääsy järjestelmään” ei riitä. Pitää tietää mitä pääsy oikeasti antaa.

---

## Audit trail

Käyttöoikeuspyynnöstä pitäisi jäädä jälki.

Myöhemmin pitäisi pystyä tarkistamaan:

- kuka pyysi oikeutta
- mitä oikeutta pyydettiin
- miksi oikeus tarvittiin
- kuka hyväksyi oikeuden
- milloin oikeus annettiin
- kuka toteutti muutoksen
- oliko oikeus määräaikainen
- milloin oikeus poistettiin tai tarkistettiin

Tämä on tärkeää auditoinnin, tietoturvan ja vastuiden kannalta.

Jos myöhemmin kysytään, miksi Aku Ankalla oli pääsy tiettyyn kansioon, vastauksen ei pitäisi olla:

> “En tiedä, se on varmaan joskus lisätty.”

Parempi vastaus olisi:

> “Oikeus pyydettiin tiketin kautta, esihenkilö hyväksyi sen, järjestelmän omistaja vahvisti roolin ja oikeus annettiin määräajaksi projektia varten.”

**Elikkäs:**  
Jos käyttöoikeudesta ei jää jälkeä, myöhemmin on vaikea todistaa miksi se oli olemassa.

---

## Mitä voi mennä pieleen?

Käyttöoikeuspyyntö voi epäonnistua monella tavalla.

Esimerkiksi:

- käyttäjä pyytää liian laajaa oikeutta
- esihenkilö hyväksyy ymmärtämättä oikeuden sisältöä
- järjestelmän omistajaa ei tiedetä
- hyväksyntä puuttuu
- oikeus annetaan väärään ryhmään
- oikeus jää pysyväksi, vaikka se oli väliaikainen
- pyyntö dokumentoidaan huonosti
- Service Desk joutuu arvaamaan mitä pitää tehdä
- samaa oikeutta pyydetään eri nimillä
- käyttäjälle kopioidaan oikeudet toiselta käyttäjältä
- vanhoja oikeuksia ei poisteta
- audit trail jää puutteelliseksi

**Elikkäs:**  
Huono access request -prosessi ei aiheuta vain yksittäistä virhettä. Se rakentaa hitaasti sekavan ja riskialttiin käyttöoikeusympäristön.

---

## Hyvä käyttöoikeuspyyntö

Hyvä käyttöoikeuspyyntö voisi näyttää tältä:

| Asia | Hyvä kysymys |
| :--- | :--- |
| Käyttäjä | Kenelle oikeus annetaan? |
| Tarve | Miksi oikeus tarvitaan? |
| Resurssi | Mihin järjestelmään, kansioon tai sovellukseen pääsy tarvitaan? |
| Oikeustaso | Tarvitaanko luku-, muokkaus- vai admin-oikeus? |
| Hyväksyjä | Kuka hyväksyy pyynnön? |
| Omistaja | Kuka omistaa järjestelmän tai tiedon? |
| Kesto | Onko oikeus pysyvä vai määräaikainen? |
| Riski | Sisältääkö oikeus arkaluontoista tietoa tai laajaa valtaa? |
| Dokumentointi | Jääkö pyynnöstä riittävä jälki? |

**Elikkäs:**  
Hyvä käyttöoikeuspyyntö on selkeä, perusteltu ja jäljitettävä.

---

## Ankkalinna-esimerkki: huono prosessi

Aku Ankka tekee tiketin:

> “Tarvitsen pääsyn raportointiin.”

Service Desk saa tiketin, mutta siitä ei selviä:

- mihin raportointijärjestelmään pääsy tarvitaan
- mitä oikeustasoa tarvitaan
- kuka hyväksyi pyynnön
- onko oikeus pysyvä vai määräaikainen
- miksi oikeus tarvitaan

Kiireessä Aku lisätään ryhmään, jolla on laajemmat oikeudet kuin olisi tarpeen.

Puolen vuoden päästä access reviewissä kukaan ei enää muista, miksi Aku sai oikeuden.

**Riski:**  
Oikeus annettiin nopeasti, mutta päätös oli huonosti perusteltu ja huonosti dokumentoitu.

**Elikkäs:**  
Tiketti meni kiinni, mutta käyttöoikeushallinta ei oikeasti onnistunut.

---

## Ankkalinna-esimerkki: parempi prosessi

Aku Ankka tarvitsee pääsyn tuotantoraportteihin.

Pyyntöön kirjataan:

- käyttäjä: Aku Ankka
- järjestelmä: Ankkalinna Reporting
- oikeus: tuotantoraporttien lukuoikeus
- perustelu: viikkoraporttien tarkastelu oman tiimin osalta
- hyväksyjä: Akun esihenkilö
- järjestelmän omistaja: raportointijärjestelmän pääkäyttäjä
- kesto: pysyvä nykyisen roolin ajan
- tarkistus: seuraava access review

Tässä tilanteessa Service Desk voi toteuttaa pyynnön turvallisemmin, koska päätös ja perustelu ovat selkeämpiä.

**Elikkäs:**  
Hyvä tiketti ei ole pitkä romaani. Sen pitää vain vastata oikeisiin kysymyksiin.

---

## Mittee mietin:

Minusta käyttöoikeuspyynnöissä näkyy hyvin se, että IAM ei ole pelkkää tekniikkaa.

Teknisesti käyttäjän lisääminen ryhmään voi olla helppoa.

Vaikeampi osa on ymmärtää:

- kuuluuko käyttäjän saada tämä oikeus
- kuka saa päättää siitä
- mitä riskiä oikeuteen liittyy
- milloin oikeus pitää poistaa
- miten päätös voidaan todistaa myöhemmin

Service Deskissä access request voi näyttää yhdeltä tikettityypiltä muiden joukossa, mutta IAM-ajattelussa se on tärkeä kontrollipiste.

Jos tässä kohtaa tehdään huonoja päätöksiä, niistä syntyy myöhemmin role creepiä, access driftiä, auditointiongelmia ja tietoturvariskejä.

**Elikkäs:**  
Access request ei ole vain tiketti. Se on kohta, jossa organisaatio päättää kuka saa pääsyn, miksi saa pääsyn ja kuka kantaa vastuun siitä päätöksestä.
