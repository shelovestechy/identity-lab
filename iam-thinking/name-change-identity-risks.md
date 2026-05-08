# Nimenmuutos ja identiteettiriskit Microsoft-ympäristössä

Nimenmuutos kuulostaa pieneltä asialta, mutta IT-ympäristössä se voi olla yllättävän monimutkainen.

Kyse ei ole aina vain siitä, että käyttäjän nimi vaihdetaan yhteen kenttään. Nimi voi liittyä kirjautumiseen, sähköpostiosoitteeseen, näkyvään nimeen, AD-attribuutteihin, Microsoft Entra ID:hen, Exchangeen, HR-järjestelmään, synkronointiin ja käyttäjän tunnistamiseen eri järjestelmissä.

Jos nimenmuutos tehdään väärästä paikasta tai väärillä attribuuteilla, pieni muutos voi aiheuttaa ison sotkun.

---

## Pikakatsaus

Nimenmuutoksessa pitää miettiä ainakin:

- mistä käyttäjän tiedot tulevat
- onko käyttäjä cloud-only vai AD-synkronoitu
- muuttuuko näkyvä nimi
- muuttuuko kirjautumistunnus eli UPN
- muuttuuko sähköpostiosoite
- jätetäänkö vanha sähköposti aliakseksi
- vaikuttaako muutos integraatioihin tai sovelluksiin
- miten muutos testataan jälkeenpäin

**Elikkäs:**  
Nimenmuutos ei ole vain “vaihda sukunimi”. Se on pieni identiteettimuutos, joka voi vaikuttaa moneen järjestelmään yhtä aikaa.

---

## Esimerkkitilanne

Iines Ankan nimi vaihtuu muotoon Iines Hanhi.

Ankkalinna Oy:ssä Iineksen nimi pitäisi päivittää niin, että:

- käyttäjän näkyvä nimi muuttuu oikein
- sähköpostiosoite päivittyy tarvittaessa
- vanha sähköpostiosoite jää aliakseksi
- kirjautuminen toimii edelleen
- käyttäjän tiedot synkronoituvat oikein
- käyttäjälle ei synny uutta tunnusta vahingossa
- eri järjestelmissä näkyy sama henkilö eikä kaksi eri identiteettiä

Jos muutos tehdään hallitusti, käyttäjälle tämä voi näkyä vain uutena nimenä ja mahdollisesti uutena sähköpostiosoitteena.

Jos muutos tehdään väärin, Service Desk voi saada pian tikettejä tyyliin:

- käyttäjä ei pääse kirjautumaan
- sähköposti ei tule perille
- Outlookissa näkyy vanha nimi
- Teamsissa näkyy eri nimi
- vanhalle osoitteelle lähetetyt viestit katoavat
- käyttäjän tiedot eivät päivity järjestelmissä
- käyttäjälle näyttää syntyneen toinen tili

**Elikkäs:**  
Nimenmuutos ei ole vain kosmeettinen muutos. Se voi vaikuttaa koko käyttäjän digitaaliseen identiteettiin.

---

## Ensin pitää selvittää source of authority

Ennen kuin nimenmuutosta tehdään, pitää selvittää mistä käyttäjän tiedot oikeasti tulevat.

Tätä voidaan ajatella käsitteellä **source of authority**.

Se tarkoittaa järjestelmää, joka on käyttäjätiedon virallinen lähde.

Käyttäjätiedon lähde voi olla esimerkiksi:

- HR-järjestelmä
- paikallinen Active Directory
- Microsoft Entra ID
- jokin IAM- tai IGA-järjestelmä

Jos käyttäjän tiedot tulevat HR-järjestelmästä, nimenmuutos pitäisi usein aloittaa sieltä.

Jos käyttäjä on synkronoitu paikallisesta AD:stä Microsoft Entra ID:hen, muutosta ei yleensä kannata tehdä suoraan Entraan, koska paikallinen AD voi yliajaa muutoksen seuraavassa synkronoinnissa.

Jos käyttäjä on **cloud-only**, eli olemassa vain Microsoft Entra ID:ssä / Microsoft 365:ssä, muutos voidaan yleensä tehdä pilven hallintatyökaluissa.

**Elikkäs:**  
Ennen kuin muutat mitään, selvitä kuka “omistaa” käyttäjän tiedot. Muuten voit korjata väärää järjestelmää ja ihmetellä miksi muutos katoaa tai rikkoo jotain muuta.

---

## Cloud-only käyttäjä

Cloud-only käyttäjä tarkoittaa käyttäjää, jota ei synkronoida paikallisesta AD:stä.

Tällainen käyttäjä elää suoraan Microsoft Entra ID:ssä / Microsoft 365:ssä.

Cloud-only käyttäjän kohdalla nimenmuutosta voidaan yleensä hallita esimerkiksi:

- Microsoft 365 admin centerissä
- Microsoft Entra admin centerissä
- Exchange admin centerissä
- PowerShellillä, jos organisaation käytännöt sen sallivat

Muutettavia asioita voivat olla esimerkiksi:

- näkyvä nimi
- etunimi
- sukunimi
- käyttäjätunnus
- ensisijainen sähköpostiosoite
- sähköpostialias
- käyttäjän yhteystiedot

Tässäkin pitää olla tarkkana. Vaikka käyttäjä olisi cloud-only, ei silti kannata muuttaa kaikkea sokkona.

**Elikkäs:**  
Cloud-only käyttäjän muutokset tehdään yleensä pilvessä, mutta silloinkin pitää ymmärtää mitä kenttää muuttaa ja mihin se vaikuttaa.

---

## Synkronoitu käyttäjä

Synkronoitu käyttäjä tarkoittaa käyttäjää, jonka tiedot tulevat paikallisesta Active Directorysta Microsoft Entra ID:hen.

Tällaisessa ympäristössä käytössä voi olla esimerkiksi Microsoft Entra Connect tai muu synkronointiratkaisu.

Tällöin käyttäjätietojen virallinen lähde voi olla paikallinen AD tai HR-järjestelmä, ei Entra ID.

Jos käyttäjän nimi muutetaan suoraan Entran puolella, muutos ei välttämättä pysy. Se voi palautua takaisin vanhaksi seuraavassa synkronoinnissa.

Synkronoidun käyttäjän kohdalla nimenmuutos pitää yleensä tehdä siellä, mistä attribuutit oikeasti tulevat.

Se voi tarkoittaa esimerkiksi:

- HR-järjestelmää
- paikallista Active Directorya
- Exchange-hallintaa
- identiteetinhallinnan järjestelmää

**Elikkäs:**  
Jos käyttäjä on AD-synkronoitu, Entra ei välttämättä ole oikea paikka muuttaa nimeä. Muutos pitää tehdä lähteessä, muuten synkronointi voi jyrätä sen yli.

---

## Mitä attribuutteja nimenmuutos voi koskea?

Nimenmuutoksessa pitää erottaa eri asiat toisistaan.

Käyttäjällä voi olla:

- näkyvä nimi
- etunimi
- sukunimi
- kirjautumistunnus
- sähköpostiosoite
- sähköpostialiakset
- vanha AD-käyttäjänimi
- Exchange-attribuutit
- HR-järjestelmän henkilötiedot

Nämä eivät ole kaikki sama asia.

| Attribuutti / termi | Mitä se tarkoittaa |
| :--- | :--- |
| **displayName** | Käyttäjän näkyvä nimi esimerkiksi osoitekirjassa, Teamsissa ja Microsoft 365 -palveluissa |
| **givenName** | Käyttäjän etunimi |
| **surname / sn** | Käyttäjän sukunimi |
| **userPrincipalName / UPN** | Käyttäjän kirjautumistunnus, usein sähköpostiosoitteen näköinen |
| **mail** | Käyttäjän sähköpostiosoite-attribuutti |
| **proxyAddresses** | Lista käyttäjän sähköpostiosoitteista ja aliaksista |
| **primary SMTP address** | Käyttäjän ensisijainen sähköpostiosoite |
| **secondary smtp address** | Käyttäjän lisäosoite tai alias |
| **mailNickname** | Exchange-/Microsoft 365 -alias, usein sähköpostiosoitteen alkuosa |
| **sAMAccountName** | Perinteisen AD:n vanhempi kirjautumisnimi |
| **object ID / OID** | Microsoft Entra ID:n muuttumaton käyttäjän tunniste |
| **source of authority** | Järjestelmä, josta käyttäjätieto virallisesti tulee |

**Elikkäs:**  
Nimi ei ole vain yksi kenttä. Käyttäjällä voi olla erikseen näkyvä nimi, kirjautumistunnus, sähköpostiosoite, aliakset ja AD:n vanhat tunnistetiedot.

---

## UPN ei ole aina sama asia kuin sähköposti

Yksi tärkeä asia on ymmärtää ero **UPN:n** ja sähköpostiosoitteen välillä.

**UPN** eli `userPrincipalName` on käyttäjän kirjautumistunnus Microsoft-ympäristössä.

Se näyttää usein sähköpostiosoitteelta, esimerkiksi `iines.hanhi@ankkalinna.fi`.

Mutta UPN ei ole automaattisesti sama asia kuin käyttäjän ensisijainen sähköpostiosoite.

Käyttäjällä voi teoriassa olla esimerkiksi:

- **UPN / kirjautumistunnus:** `iines.ankka@ankkalinna.fi`
- **Primary SMTP / ensisijainen sähköpostiosoite:** `iines.hanhi@ankkalinna.fi`

Tämä voi olla hämmentävää käyttäjälle, jos kirjautuminen tapahtuu yhdellä osoitteella ja sähköpostia lähetetään toisella.

UPN:n muuttamista pitää kuitenkin harkita tarkasti.

UPN voi olla käytössä esimerkiksi:

- kirjautumisessa
- SSO-ratkaisuissa
- sovellusten käyttäjätunnisteena
- integraatioissa
- API-yhteyksissä
- PowerShell-skripteissä
- provisioinnissa
- raportoinnissa
- auditoinnissa
- vanhoissa sovelluksissa, jotka olettavat UPN:n pysyvän samana

Teknisesti parempi tunniste käyttäjälle olisi muuttumaton tunniste, kuten Microsoft Entra ID:n **object ID**, koska UPN ja sähköpostiosoite voivat muuttua.

Kaikki sovellukset ja integraatiot eivät kuitenkaan välttämättä ole rakennettu näin siististi. Siksi UPN:n muutos voi aiheuttaa ongelmia, jos jokin järjestelmä käyttää UPN:ää käyttäjän pysyvänä tunnisteena.

**Elikkäs:**  
UPN on kirjautumistunnus, sähköpostiosoite on postia varten. Ne voivat näyttää samalta, mutta ne eivät ole teknisesti sama asia. UPN:ää ei kannata muuttaa sokkona, koska se voi olla kiinni kirjautumisessa, integraatioissa ja sovellusten käyttäjätunnisteissa.

---

## Sähköpostin huomiointi

Sähköposti on usein nimenmuutoksen näkyvin osa käyttäjälle.

Jos Iines Ankan uusi nimi on Iines Hanhi, uusi sähköpostiosoite voisi olla `iines.hanhi@ankkalinna.fi`.

Mutta vanha osoite kannattaa usein jättää aliakseksi: `iines.ankka@ankkalinna.fi`.

Näin vanhalle nimelle lähetetyt sähköpostit tulevat edelleen perille.

Exchange- ja Microsoft 365 -ympäristöissä tämä liittyy usein käyttäjän sähköpostiosoitteisiin ja `proxyAddresses`-tyyppisiin tietoihin.

Käyttäjällä voi olla esimerkiksi:

- **Primary SMTP / ensisijainen sähköposti:** `SMTP:iines.hanhi@ankkalinna.fi`
- **Secondary smtp / vanha alias:** `smtp:iines.ankka@ankkalinna.fi`

Huomaa ero:

- `SMTP:` = ensisijainen osoite
- `smtp:` = lisäosoite / alias

Tämä pieni kirjainero voi näyttää mitättömältä, mutta sähköpostipuolella sillä voi olla merkitystä.

**Elikkäs:**  
Nimenmuutoksessa sähköpostiosoite voidaan usein päivittää käyttäjän uuteen nimeen, mutta vanha osoite kannattaa säilyttää aliaksena. UPN:n muuttaminen on isompi päätös, koska se voi vaikuttaa kirjautumiseen ja integraatioihin.

---

## Mitä voi mennä pieleen?

Jos nimenmuutos tehdään väärin, seurauksena voi olla esimerkiksi:

- käyttäjän kirjautumistunnus muuttuu väärin
- käyttäjä ei pääse kirjautumaan
- sähköposti ei kulje
- vanhalle osoitteelle tulevat viestit eivät tule perille
- käyttäjän nimi näkyy eri tavalla eri järjestelmissä
- käyttäjän tiedot synkronoituvat väärin
- Teamsissa tai Outlookissa näkyy vanha nimi pitkään
- käyttäjälle syntyy vahingossa uusi tunnus
- vanha tili jää roikkumaan
- integraatio lakkaa tunnistamasta käyttäjää oikein
- raportointi ja auditointi sekoittuvat
- Service Desk joutuu korjaamaan sotkua jälkikäteen

Usein ongelma ei johdu yhdestä kentästä, vaan siitä että useampi järjestelmä käsittelee samaa henkilöä vähän eri tavalla.

**Elikkäs:**  
Nimenmuutos voi näyttää pieneltä, mutta jos järjestelmät eivät ole samaa mieltä siitä kuka käyttäjä on, siitä tulee nopeasti sotku.

---

## Mitä ei kannata tehdä sokkona?

Nimenmuutoksessa ei kannata vain avata käyttäjää ja vaihtaa satunnaisia kenttiä.

Huonoja ideoita ovat esimerkiksi:

- muuttaa UPN ilman että tiedetään vaikutus kirjautumiseen
- muuttaa UPN vain siksi, että nimi muuttui
- poistaa vanha sähköpostiosoite ilman alias-suunnitelmaa
- muuttaa Entran attribuutteja, vaikka käyttäjä on AD-synkronoitu
- muuttaa `mail`, `proxyAddresses` tai `mailNickname` ymmärtämättä Exchange-vaikutusta
- tehdä muutokset eri järjestelmiin eri aikaan ilman tarkistusta
- unohtaa tiedottaa käyttäjälle uudesta kirjautumistavasta tai sähköpostiosoitteesta
- jättää vanha nimi kokonaan pois, vaikka sitä tarvitaan sähköpostin aliaksena
- luoda käyttäjälle uusi tunnus vain siksi, että nimi muuttui

**Elikkäs:**  
Älä arvaa. Selvitä ensin mistä tieto tulee, mitä kenttää pitää muuttaa ja mitä vaikutuksia sillä on.

---

## Hyvä tapa ajatella nimenmuutosta

Nimenmuutosta kannattaa käsitellä pienenä muutospyyntönä, ei vain pikakorjauksena.

Ennen muutosta pitäisi kysyä:

- Mikä nimi muuttuu?
- Muuttuuko pelkkä näkyvä nimi?
- Muuttuuko kirjautumistunnus?
- Muuttuuko sähköpostiosoite?
- Säilytetäänkö vanha sähköposti aliaksena?
- Onko käyttäjä cloud-only vai AD-synkronoitu?
- Tuleeko tieto HR-järjestelmästä?
- Pitääkö muutos tehdä HR:ssä, AD:ssä, Entrassa vai Exchangessa?
- Vaikuttaako muutos käyttäjän sovelluksiin?
- Voiko UPN-muutos vaikuttaa integraatioihin tai API-yhteyksiin?
- Pitääkö käyttäjää tiedottaa muutoksesta?
- Kuka hyväksyy muutoksen?
- Miten muutos dokumentoidaan?

**Elikkäs:**  
Hyvä nimenmuutos ei ole vain tekninen klikkaus. Se on pieni hallittu muutos, jossa tiedetään mitä muutetaan, miksi muutetaan ja mihin se vaikuttaa.

---

## Tarkistuslista ennen muutosta

Ennen nimenmuutosta:

- tarkista käyttäjän source of authority
- tarkista onko käyttäjä cloud-only vai AD-synkronoitu
- tarkista nykyinen näkyvä nimi
- tarkista nykyinen UPN
- tarkista nykyinen ensisijainen sähköpostiosoite
- tarkista nykyiset sähköpostialiakset
- tarkista tuleeko nimi HR-järjestelmästä
- tarkista pitääkö käyttäjän kirjautumistunnus vaihtaa vai kannattaako UPN pitää ennallaan
- tarkista pitääkö sähköpostiosoite vaihtaa
- sovi säilytetäänkö vanha osoite aliaksena
- tarkista onko olemassa kaimoja
- tarkista voiko muutos vaikuttaa sovelluksiin, integraatioihin tai API-yhteyksiin
- tiedota käyttäjälle mitä muuttuu
- dokumentoi pyyntö ja hyväksyntä

---

## Tarkistuslista muutoksen jälkeen

Muutoksen jälkeen:

- tarkista että käyttäjä näkyy oikealla nimellä
- tarkista että kirjautuminen toimii
- tarkista että sähköposti kulkee uuteen osoitteeseen
- tarkista että vanhalle osoitteelle lähetetty posti tulee perille
- tarkista että vanha osoite näkyy aliaksena
- tarkista että Teams, Outlook ja osoitekirja päivittyvät
- tarkista ettei käyttäjälle syntynyt uutta tiliä vahingossa
- tarkista ettei vanha tili jäänyt aktiiviseksi turhaan
- tarkista että synkronointi on mennyt läpi
- tarkista että tärkeät sovellukset ja integraatiot toimivat edelleen
- dokumentoi mitä muutettiin ja miksi

**Elikkäs:**  
Muutos ei ole valmis sillä hetkellä kun kenttä on vaihdettu. Muutos on valmis vasta kun on tarkistettu, että käyttäjä, sähköposti ja järjestelmät toimivat oikein.

---

## Kaimat ja nimeämiskäytännöt

Nimenmuutoksissa ja uusien käyttäjien luonnissa ongelmaksi voivat tulla myös kaimat.

Jos Ankkalinna Oy:ssä on jo käyttäjä nimeltä `aku.ankka@ankkalinna.fi` ja taloon tulee toinen Aku Ankka, käyttäjätunnusta tai sähköpostiosoitetta ei voida tehdä samalla tavalla.

Tällöin tarvitaan selkeä nimeämiskäytäntö.

Esimerkiksi:

- `etunimi.sukunimi`
- `etunimi.sukunimi1`
- `etunimi.toisennimenalkukirjain.sukunimi`
- `etunimi.sukunimi.osasto`

Tärkeintä on, että käytäntö on johdonmukainen.

Jos jokainen tapaus ratkaistaan eri tavalla, ympäristöstä tulee nopeasti sekava.

**Elikkäs:**  
Kaimat eivät ole vain nimiongelma. Ne ovat identiteetinhallinnan ongelma, jos nimeämiskäytäntöä ei ole mietitty.

---

## Ankkalinna-esimerkki: hallittu nimenmuutos

Iines Ankka ilmoittaa, että hänen uusi nimensä on Iines Hanhi.

Ankkalinna Oy:n hyvä prosessi voisi mennä näin:

1. HR päivittää nimen HR-järjestelmään.
2. Tarkistetaan, tuleeko nimi HR-järjestelmästä AD:hen tai Entra ID:hen automaation kautta.
3. Tarkistetaan, onko Iines cloud-only vai AD-synkronoitu käyttäjä.
4. Päätetään muuttuuko vain näkyvä nimi.
5. Päätetään muuttuuko UPN eli kirjautumistunnus vai jätetäänkö se ennalleen.
6. Päätetään muuttuuko ensisijainen sähköpostiosoite.
7. Lisätään vanha sähköpostiosoite aliakseksi.
8. Tarkistetaan, ettei uudelle nimelle tai osoitteelle ole kaimaa.
9. Tarkistetaan, voiko UPN-muutos vaikuttaa sovelluksiin, integraatioihin tai API-yhteyksiin.
10. Tiedotetaan käyttäjälle mahdollisesta uudesta kirjautumistavasta tai sähköpostiosoitteesta.
11. Tehdään muutos oikeassa lähdejärjestelmässä.
12. Tarkistetaan synkronointi.
13. Testataan kirjautuminen ja sähköpostin kulku.
14. Tarkistetaan tärkeimmät sovellukset ja integraatiot.
15. Dokumentoidaan muutos.

Tässä mallissa ei vain vaihdeta nimeä sokkona, vaan varmistetaan koko ketju.

**Elikkäs:**  
Hyvä nimenmuutos kulkee lähdejärjestelmästä hallitusti eteenpäin. Ei niin, että joku vaihtaa kiireessä yhden kentän ja toivoo parasta.

---

## Oma tämänhetkinen ajatus

Nimenmuutos on hyvä esimerkki siitä, miten identiteetinhallinnassa pieneltä näyttävä asia voi koskea montaa järjestelmää yhtä aikaa.

Käyttäjän näkökulmasta kyse on ehkä vain uudesta nimestä.

IT:n näkökulmasta kyse voi olla:

- identiteetistä
- kirjautumisesta
- sähköpostista
- synkronoinnista
- järjestelmien välisestä tiedonkulusta
- tietojen omistajuudesta
- käyttäjäkokemuksesta
- integraatioista
- audit trailista

Siksi nimenmuutosta ei pitäisi käsitellä pelkkänä pikamuokkauksena.

Se pitäisi tehdä hallitusti, oikeasta lähteestä ja niin, että vanha sähköposti, kirjautuminen ja käyttäjän perustiedot säilyvät järkevinä.

UPN:n kohdalla pitää olla erityisen varovainen. Sähköpostiosoite voidaan usein päivittää käyttäjän uuteen nimeen ja vanha osoite jättää aliakseksi, mutta UPN:n muuttaminen voi vaikuttaa kirjautumiseen, sovelluksiin ja integraatioihin.

**Elikkäs:**  
Nimenmuutos näyttää pieneltä, mutta IAM-ajattelussa se on hyvä muistutus siitä, että identiteetti on kokonaisuus eikä vain yksi nimi kentässä.
