# Joiner, Mover ja Leaver -riskit

Tämä on pohdintaa siitä, miten käyttäjän elinkaaren hallinta voi mennä pieleen oikeassa IT-ympäristössä.

Joiner, mover ja leaver kuulostavat paperilla yksinkertaisilta:

- käyttäjä aloittaa
- käyttäjä vaihtaa roolia
- käyttäjä lähtee

Käytännössä nämä vaiheet voivat olla paljon sotkuisempia.

Käyttöoikeudet eivät ole vain tekninen asia. Ne liittyvät ihmisiin, esihenkilöihin, HR-järjestelmiin, automaatioihin, järjestelmän pääkäyttäjiin, tietoturvaan ja siihen, ymmärtääkö kukaan oikeasti mitä käyttäjän pitäisi saada tehdä.

---

## Miksi JML-prosessi on tärkeä?

JML tarkoittaa käyttäjän elinkaaren kolmea vaihetta:

- **Joiner** - uusi työntekijä tai käyttäjä
- **Mover** - käyttäjä vaihtaa roolia, tiimiä, osastoa tai tehtävää
- **Leaver** - käyttäjä lähtee organisaatiosta

Hyvä JML-prosessi varmistaa, että käyttäjä saa oikeat oikeudet oikeaan aikaan ja menettää ne silloin kun niitä ei enää tarvita.

Huono JML-prosessi taas aiheuttaa helposti:

- liian laajoja käyttöoikeuksia
- vanhoja oikeuksia, jotka jäävät roikkumaan
- puuttuvia oikeuksia
- tuplatunnuksia
- väärään nimeen tai rooliin jääviä tilejä
- epäselviä vastuita
- tietoturvariskejä
- käyttäjien ja IT-tuen turhaa kuormitusta

**Elikkäs:**  
JML ei ole vain käyttäjätilin luontia ja sulkemista. Se on koko käyttäjän työelämän digitaalinen selkäranka.

---

## Esihenkilön ja pääkäyttäjien vastuu

Käyttöoikeuksien hallinnassa iso vastuu on usein esihenkilöillä ja järjestelmän pääkäyttäjillä.

IT voi teknisesti lisätä käyttäjän ryhmään tai antaa pääsyn järjestelmään, mutta IT ei aina voi tietää, tarvitseeko käyttäjä sitä oikeasti.

Esihenkilön pitäisi ymmärtää:

- mitä työntekijä oikeasti tekee
- mitä järjestelmiä hän tarvitsee
- mitä tietoja hän saa nähdä
- mitkä oikeudet ovat liian laajoja
- milloin oikeus pitää poistaa
- kuka hyväksyy pääsyn
- kuka omistaa järjestelmän tai tiedon

Järjestelmän pääkäyttäjän pitäisi ymmärtää:

- mitä eri roolit järjestelmässä tarkoittavat
- mitä riskejä oikeuksiin liittyy
- kenelle oikeudet kuuluvat
- milloin oikeudet pitää tarkistaa
- mitä lokit ja audit trail näyttävät myöhemmin

Ongelma on se, että esihenkilöillä ei aina ole tarpeeksi tietoa tai ymmärrystä käyttöoikeuksien tärkeydestä. He voivat ajatella, että oikeus on vain “pääsy johonkin ohjelmaan”, vaikka oikeasti kyse voi olla asiakastiedoista, henkilötiedoista, talousdatasta tai tuotannon kannalta kriittisistä järjestelmistä.

**Elikkäs:**  
IT voi toteuttaa pyynnön, mutta esihenkilön ja järjestelmän omistajan pitäisi tietää miksi oikeus annetaan ja miksi se on perusteltu.

---

## Joiner-riskit: oikeuksien kopiointi toiselta käyttäjältä

Joiner on uusi työntekijä tai käyttäjä.

Esimerkiksi Ankkalinna Oy palkkaa uuden tuotannon työntekijän nimeltä Hupu Ankka. Hänelle pitää luoda tunnus, sähköposti ja pääsy tarvittaviin järjestelmiin.

Tässä kohtaa ensimmäinen iso kysymys on:

> Mitä oikeuksia Hupu oikeasti tarvitsee?

Käytännössä vastaus voi joskus olla:

> “Antakaa Hupulle samat oikeudet kuin Akulla. Aku tekee samaa työtä.”

Tämä kuulostaa helpolta, mutta se voi olla riskialtista.

Aku on voinut olla Ankkalinna Oy:ssä monta vuotta. Hän on voinut työskennellä eri rooleissa, osallistua projekteihin, tuurata esihenkilöä tai saada väliaikaisia oikeuksia, joita ei ole koskaan poistettu.

Jos Akun oikeudet kopioidaan suoraan Hupulle, mukana voi tulla myös vanhoja, turhia tai liian laajoja oikeuksia.

**Riski:**  
Uusi käyttäjä saa liian laajat oikeudet heti työsuhteen alussa.

**Elikkäs:**  
“Anna samat oikeudet kuin kollegalla” on helppo pyyntö, mutta huono IAM-periaate, jos kukaan ei tarkista mitä oikeuksia kollegalla oikeasti on.

---

## Mover-riskit: uudet oikeudet lisätään, vanhat unohtuvat

Mover tarkoittaa käyttäjää, joka vaihtaa roolia, tiimiä, osastoa tai tehtävää.

Mover on usein JML-prosessin hankalin vaihe, koska käyttäjä ei lähde talosta. Hän vain liikkuu talon sisällä.

Tällöin huomio menee helposti uusiin oikeuksiin:

- mitä käyttäjä tarvitsee uudessa roolissa?
- mihin järjestelmiin hänen pitää päästä?
- mitä ryhmiä hänelle lisätään?

Mutta yhtä tärkeä kysymys unohtuu helposti:

> Mitä vanhoja oikeuksia pitää poistaa?

**Esimerkkitilanne:**  
Iines Ankka työskenteli ensin hallinnossa ja hänellä oli pääsy arkaluontoisiin dokumentteihin, raportteihin ja henkilöstöön liittyviin tietoihin.

Myöhemmin Iines siirtyy tuotannon puolelle.

Hänelle lisätään tuotannon järjestelmien oikeudet, mutta hallinnon oikeuksia ei poisteta.

Lopputulos:

- Iines pääsee tuotannon järjestelmiin
- Iines pääsee edelleen hallinnon kansioihin
- kukaan ei muista, miksi hänellä on nämä oikeudet
- access reviewissä joku voi hyväksyä oikeudet vanhasta tottumuksesta

**Riski:**  
Käyttäjälle kertyy oikeuksia eri rooleista, vaikka nykyinen tehtävä ei enää vaadi niitä.

**Elikkäs:**  
Mover ei ole vain uusien oikeuksien lisäämistä. Se on myös vanhojen oikeuksien poistamista.

---

## Väliaikaiset oikeudet, jotka jäävät pysyviksi

Yksi yleinen mover-riski on väliaikainen pääsy.

Hannu Hanhi tuuraa esihenkilöä kesäloman ajan. Hänelle annetaan pääsy hyväksyntäkansioihin ja raportteihin.

Kesäloma loppuu. Esihenkilö palaa töihin.

Mutta Hannun oikeuksia ei poisteta.

Puolen vuoden päästä Hannulla on edelleen pääsy tietoihin, joita hän tarvitsi vain kahden viikon ajan.

Tämä ei välttämättä ole pahantahtoista. Se on vain unohtunut.

Mutta tietoturvan kannalta unohtunut oikeus on silti oikeus.

**Elikkäs:**  
Väliaikaisille oikeuksille pitäisi aina olla päättymispäivä tai tarkistus. Muuten “hetkeksi annettu” muuttuu helposti pysyväksi.

---

## Leaver-riskit: tunnus jää auki tai sulkeutuu väärään aikaan

Leaver tarkoittaa käyttäjää, joka lähtee organisaatiosta.

Tässä vaiheessa tilin ja oikeuksien sulkemisen pitäisi toimia varmasti.

Mutta joskus näin ei käy.

Leaver-prosessi voi epäonnistua esimerkiksi siksi, että:

- HR-järjestelmässä on väärä päättymispäivä
- automaatio ei toimi
- tieto ei siirry HR-järjestelmästä identiteettijärjestelmään
- esihenkilö ei ilmoita lähtöä ajoissa
- käyttäjällä on useita tunnuksia
- käyttäjä on siirtynyt talon sisällä, mutta käsitellään väärin uutena käyttäjänä
- manuaalinen tiketti unohtuu

---

## Esimerkki: tunnus jää aktiiviseksi

Roope Ankka lopettaa Ankkalinna Oy:ssä.

HR-järjestelmään on merkitty päättymispäivä, mutta automaatio epäonnistuu. Tämän takia Roopen käyttäjätili ei menekään automaattisesti pois käytöstä.

Tunnus jää aktiiviseksi.

Jos kukaan ei huomaa virhettä, Roopella voi olla edelleen pääsy sähköpostiin, tiedostoihin tai muihin järjestelmiin.

**Riski:**  
Lähteneen käyttäjän tunnus jää aktiiviseksi ja sitä voidaan käyttää väärin.

**Elikkäs:**  
Leaver-prosessissa ei saa vain luottaa siihen, että automaatio varmasti teki kaiken. Tärkeistä asioista pitää jäädä tarkistettava jälki.

---

## Esimerkki: tunnus menee pois päältä liian aikaisin

Joskus ongelma voi olla myös päinvastainen.

Aku Ankan työsopimusta jatketaan, mutta esihenkilö ei muista ilmoittaa lisäaikaa ajoissa HR-järjestelmään tai käyttöoikeusprosessiin.

Automaation näkökulmasta Aku on lähtevä käyttäjä.

Tunnus menee pois päältä, vaikka Aku tulee seuraavana päivänä töihin.

Lopputulos:

- Aku ei pääse kirjautumaan
- työ pysähtyy
- Service Desk saa tiketin
- käyttäjä turhautuu
- esihenkilö ihmettelee miksi tunnus sulkeutui

**Riski:**  
Käyttäjän työ estyy, vaikka hänellä olisi edelleen oikeus olla töissä ja käyttää järjestelmiä.

**Elikkäs:**  
Leaver-prosessi tarvitsee myös hyvät jatko- ja poikkeuskäytännöt. Muuten oikea työntekijä voidaan vahingossa lukita ulos.

---

## Talon sisäinen muutos: kun käyttäjän suhde organisaatioon muuttuu

Talon sisäiset muutokset voivat olla yllättävän hankalia.

Kaikki muutokset eivät ole yksinkertaisesti “uusi työntekijä aloittaa” tai “työntekijä lähtee”. Joskus sama ihminen jatkaa organisaation ympärillä, mutta hänen roolinsa tai suhteensa yritykseen muuttuu.

Esimerkiksi Ankkalinna Oy:ssä voi tapahtua näin:

- tuotannon tuntityöntekijä siirtyy toimihenkilörooliin
- harjoittelija palkataan vakituiseksi työntekijäksi
- sisäinen työntekijä lähtee talosta, mutta palaa myöhemmin yrittäjänä tai konsulttina myymään palveluitaan yritykselle
- ulkoinen konsultti palkataan myöhemmin sisäiseksi työntekijäksi
- määräaikainen työntekijä jatkaa uudella sopimuksella eri roolissa

Tämä ei ole aina varsinainen uusi työntekijä, mutta ei myöskään tavallinen pieni roolinvaihto.

Joissain ympäristöissä HR-järjestelmä voi käsitellä muutoksen uutena työsuhteena tai uutena henkilönä, vaikka kyse on samasta ihmisestä. Toisessa järjestelmässä käyttäjä taas voi näyttää edelleen vanhalta työntekijältä.

Tästä voi seurata:

- käyttäjälle luodaan uusi tunnus
- vanha tunnus jää roikkumaan
- käyttäjällä on samaan aikaan sisäinen ja ulkoinen identiteetti
- sähköpostiosoite menee sekaisin
- oikeudet eivät siirry oikein
- vanhat oikeudet jäävät vanhalle tunnukselle
- uudet oikeudet tulevat uudelle tunnukselle
- järjestelmät eivät ymmärrä, kumpi tunnus on oikea
- audit trail ja raportointi näyttävät sekavalta
- käyttäjä ei pääse työhön tarvittaviin järjestelmiin oikeaan aikaan

**Riski:**  
Yhdestä ihmisestä voi syntyä kaksi tai useampi digitaalinen identiteetti, mikä aiheuttaa sotkua käyttöoikeuksiin, sähköpostiin, raportointiin ja auditointiin.

Erityisen hankalaa tämä on silloin, jos henkilö muuttuu sisäisestä työntekijästä ulkoiseksi konsultiksi tai yrittäjäksi. Silloin oikeuksien ei pitäisi välttämättä jatkua samalla tavalla, vaikka ihminen on sama. Hänen työnsä, vastuunsa, sopimuksensa ja tietotarpeensa voivat olla erilaiset.

**Elikkäs:**  
Talon sisäinen muutos ei ole aina vain pieni päivitys. Jos HR- ja identiteettiprosessi eivät ymmärrä muutosta oikein, yhdestä ihmisestä voi tulla järjestelmissä monta käyttäjää tai hänelle voi jäädä väärät oikeudet vanhasta roolista.


---

## Nimenmuutokset ja identiteettitiedot

Nimenmuutos kuulostaa pieneltä asialta, mutta IT-ympäristössä se voi olla yllättävän kuormittava.

Esimerkiksi Iines Ankka menee naimisiin ja hänen sukunimensä muuttuu.

Nimi pitäisi päivittyä oikein HR-järjestelmästä identiteettijärjestelmään, kuten Microsoft Entra ID:hen. Jos muutos kulkee hallitusti HR-järjestelmän ja automaation kautta, se voi mennä siististi.

Mutta jos nimeä aletaan muokata käsin vääristä paikoista, voidaan rikkoa perustietoja.

Nimenmuutoksessa pitää ymmärtää esimerkiksi:

- mikä on käyttäjän näkyvä nimi
- mikä on kirjautumistunnus
- mikä on ensisijainen sähköpostiosoite
- mitkä ovat vanhat sähköpostialiakset
- mitkä attribuutit tulevat HR-järjestelmästä
- mitkä tulevat AD:stä
- mitkä synkronoituvat Entra ID:hen
- mitä saa muuttaa käsin ja mitä ei

---

## Esimerkki: nimenmuutos menee väärin

Nimenmuutos voi vaikuttaa kirjautumiseen, sähköpostiin, synkronointiin ja käyttäjän identiteettiin useassa järjestelmässä.

Lue tarkempi pohdinta täältä:  
[Nimenmuutos ja identiteettiriskit Microsoft-ympäristössä](./name-change-identity-risks.md)

Iines Ankan nimi vaihtuu muotoon Iines Hanhi.

Joku muuttaa käsin käyttäjän tietoja väärästä paikasta ja vääristä attribuuteista.

Tämän seurauksena:

- käyttäjän kirjautumistunnus voi muuttua väärin
- sähköpostin kulku voi rikkoutua
- vanhalle nimelle tulevat viestit eivät löydä perille
- käyttäjän tiedot voivat synkronoitua väärin
- eri järjestelmissä näkyy eri nimi
- Service Desk joutuu korjaamaan sotkua jälkikäteen

Usein nimenmuutoksessa pitäisi miettiä erikseen ainakin näkyvä nimi, käyttäjätunnus ja sähköpostiosoitteet.

Sähköpostin takia on yleensä tärkeää säilyttää myös vanha osoite aliaksena, jotta vanhalla nimellä lähetetyt viestit tulevat edelleen perille.

Microsoft-ympäristössä tämä voi liittyä esimerkiksi käyttäjän ensisijaiseen sähköpostiosoitteeseen ja vanhoihin osoitteisiin, jotka säilytetään aliaksina. Ympäristökohtaiset käytännöt pitää kuitenkin aina tarkistaa, koska AD-, Entra ID- ja Exchange-asetukset voivat vaihdella.

**Riski:**  
Pieni nimenmuutos voi rikkoa kirjautumista, sähköpostia tai käyttäjän perustietoja, jos ei ymmärretä mistä attribuutit tulevat ja mihin ne vaikuttavat.

**Elikkäs:**  
Nimenmuutos ei ole vain “vaihda nimi kenttään”. Se pitää tehdä hallitusti, koska nimi voi liittyä kirjautumiseen, sähköpostiin, synkronointiin ja käyttäjän identiteettiin monessa järjestelmässä.

---

## Kaimat ja nimeämiskäytännöt

Nimenmuutoksissa ja uusien käyttäjien luonnissa ongelmaksi voivat tulla myös kaimat.

Jos Ankkalinna Oy:ssä on jo käyttäjä nimeltä `aku.ankka@ankkalinna.fi` ja taloon tulee toinen Aku Ankka, käyttäjätunnusta tai sähköpostiosoitetta ei voida tehdä samalla tavalla.

Tällöin voidaan tarvita selkeä nimeämiskäytäntö.

Esimerkiksi:

- `etunimi.sukunimi`
- `etunimi.sukunimi1`
- `etunimi.toisennimenalkukirjain.sukunimi`
- `etunimi.sukunimi.osasto`

Tärkeintä on, että käytäntö on johdonmukainen eikä jokainen tapaus ole oma villi poikkeuksensa.

**Elikkäs:**  
Kaimat eivät ole vain nimiongelma. Ne ovat identiteetinhallinnan ongelma, jos nimeämiskäytäntöä ei ole mietitty.

---

## Access review ei saa olla pelkkä klikkausharjoitus

Access review on tärkeä osa JML-riskien hallintaa.

Sen tarkoitus on tarkistaa, tarvitseeko käyttäjä edelleen hänellä olevia oikeuksia.

Mutta access review voi epäonnistua, jos se tehdään liian mekaanisesti.

Esimerkiksi Roope Ankka saa listan käyttäjistä, joilla on pääsy taloushallinnon järjestelmään. Hänellä on kiire, eikä hän tunne kaikkia käyttäjiä tai oikeuksien merkitystä.

Hän klikkaa kaikki hyväksytyksi.

Paperilla review on tehty.

Todellisuudessa mitään ei tarkistettu kunnolla.

**Riski:**  
Review antaa väärän turvallisuuden tunteen. Näyttää siltä, että oikeudet on tarkistettu, vaikka kukaan ei oikeasti ymmärtänyt mitä hyväksyi.

**Elikkäs:**  
Access review ei ole hyödyllinen, jos se on vain “approve all ja kahville”. Jonkun pitää oikeasti ymmärtää mitä oikeuksia tarkistetaan.

---

## Mitä hyvässä JML-prosessissa pitäisi miettiä?

Hyvä JML-prosessi ei perustu pelkkään oletukseen tai muistiin.

Siinä pitäisi miettiä ainakin:

- kuka omistaa käyttäjän tiedot
- mistä järjestelmästä käyttäjän perustiedot tulevat
- kuka hyväksyy oikeudet
- kuka omistaa järjestelmän
- kuka poistaa vanhat oikeudet
- miten roolimuutokset huomataan
- miten väliaikaiset oikeudet päättyvät
- miten leaver-prosessi varmistetaan
- miten automaatiovirheet huomataan
- miten audit trail säilyy
- miten käyttäjälle kerrotaan muutoksista
- miten Service Desk tietää mitä tehdä

---

## Oma tämänhetkinen ajatus

Minusta JML-prosessin suurin haaste ei ole pelkkä tekniikka.

Suurin haaste on se, että vastuut ovat usein hajallaan.

HR omistaa työsuhdetiedon. Esihenkilö tietää työn tarpeen. Järjestelmän omistaja tietää sovelluksen oikeudet. IT toteuttaa muutoksen. Käyttäjä näkee lopputuloksen. Service Desk korjaa kiireessä sen, mikä meni pieleen.

Jos nämä eivät keskustele keskenään, käyttöoikeuksista tulee helposti sekava kerros vanhoja päätöksiä, oletuksia ja unohtuneita poikkeuksia.

Hyvä IAM vaatii tekniikkaa, mutta se vaatii myös selkeitä prosesseja, omistajuutta ja ymmärrystä siitä, miksi oikeuksia ei anneta tai poisteta kevyesti.

**Elikkäs:**  
JML on paljon enemmän kuin “tee tunnus” ja “sulje tunnus”. Se on prosessi, jossa käyttäjän oikeuksien pitäisi muuttua samaa tahtia kuin hänen oikea työnsä muuttuu.
