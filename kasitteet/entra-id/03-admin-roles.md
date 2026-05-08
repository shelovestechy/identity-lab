# 03 - Admin Roles

Tämä sivu kokoaa Microsoft Entra ID:n admin-rooleihin, roolimäärityksiin, hallintaoikeuksiin ja least privilege -ajatteluun liittyviä käsitteitä.

Tavoite on ymmärtää, että admin-oikeus ei ole vain “annetaan vähän oikeuksia että työ onnistuu”.

Admin-roolit ovat korkean vaikutuksen käyttöoikeuksia. Niillä voidaan hallita käyttäjiä, ryhmiä, sovelluksia, kirjautumista, tunnistautumismenetelmiä, turvallisuusasetuksia ja joskus myös muita admin-oikeuksia.

IAM-näkökulmasta admin-rooleissa tärkeää on:

- kenellä oikeus on
- miksi oikeus on annettu
- kuinka laaja oikeus on
- onko oikeus pysyvä vai määräaikainen
- onko oikeus aktiivinen vai aktivoitava
- mihin scopeen oikeus pätee
- kuka hyväksyi oikeuden
- miten käyttöä valvotaan
- milloin oikeus tarkistetaan

---

## Contents

- [Role](#role)
- [Built-in Role](#built-in-role)
- [Custom Role](#custom-role)
- [Role Assignment](#role-assignment)
- [Scope](#scope)
- [Global Administrator](#global-administrator)
- [User Administrator](#user-administrator)
- [Helpdesk Administrator](#helpdesk-administrator)
- [Groups Administrator](#groups-administrator)
- [Application Administrator](#application-administrator)
- [Cloud Application Administrator](#cloud-application-administrator)
- [Authentication Administrator](#authentication-administrator)
- [Privileged Authentication Administrator](#privileged-authentication-administrator)
- [Privileged Role Administrator](#privileged-role-administrator)
- [Security Reader](#security-reader)
- [Security Administrator](#security-administrator)
- [License Administrator](#license-administrator)
- [Exchange Administrator](#exchange-administrator)
- [SharePoint Administrator](#sharepoint-administrator)
- [Teams Administrator](#teams-administrator)
- [Privileged Role](#privileged-role)
- [Least Privilege in Admin Roles](#least-privilege-in-admin-roles)
- [Admin Role Review](#admin-role-review)

---

## Role

**Role** - Rooli, joka antaa käyttäjälle oikeuden tehdä tiettyjä hallintatoimia Microsoft Entra ID:ssä tai Microsoft 365 -ympäristössä.

Rooli määrittää, mitä käyttäjä saa hallita.

Entra ID:ssä roolit liittyvät usein ylläpitoon ja hallintaan. Esimerkiksi yksi rooli voi antaa oikeuden hallita käyttäjiä, toinen ryhmiä ja kolmas sovelluksia.

Roolit ovat tärkeitä, koska admin-oikeuksia ei pitäisi antaa varmuuden vuoksi. Käyttäjälle pitäisi antaa vain se rooli, jota hän oikeasti tarvitsee työnsä tekemiseen.

**Esimerkkitilanne:**  
Ankkalinna Oy:n Service Desk tarvitsee oikeuden auttaa käyttäjiä perusasioissa.

Kaikille Service Desk -työntekijöille ei anneta Global Administrator -roolia, koska se olisi aivan liian laaja oikeus.

Sen sijaan mietitään tarkemmin:

- tarvitseeko henkilö oikeuden hallita käyttäjiä
- tarvitseeko hän oikeuden resetoida salasanoja
- tarvitseeko hän oikeuden hallita ryhmiä
- tarvitseeko hän oikeuden hallita lisenssejä
- tarvitseeko hän oikeuden nähdä kirjautumislokeja

Näiden perusteella valitaan sopivampi rooli tai roolien yhdistelmä.

**Tekninen huomio:**  
Rooli ei ole sama asia kuin ryhmäjäsenyys, vaikka rooleja voidaan joissain tilanteissa antaa myös ryhmien kautta. Rooli antaa hallintaoikeutta. Ryhmä antaa yleensä pääsyn resurssiin tai toimii hallinnan välineenä.

**Riski:**  
Jos rooleja annetaan liian laajasti, käyttäjä voi saada oikeuksia, joita hän ei tarvitse. Tämä kasvattaa vahinkojen, väärinkäytösten ja tilikaappausten vaikutusta.

**Elikkäs:**  
Role kertoo mitä käyttäjä saa hallita. Hyvä IAM-ajattelu ei kysy “mikä admin-rooli olisi helpoin antaa”, vaan “mikä on pienin riittävä oikeus”.

---

## Built-in Role

**Built-in Role** - Microsoftin valmiiksi luoma hallintarooli. Näitä ovat esimerkiksi Global Administrator, User Administrator, Groups Administrator, Application Administrator ja monet muut.

Built-in role on valmis rooli tiettyyn hallintatarpeeseen.

Microsoft on määritellyt näille rooleille tietyt oikeudet valmiiksi. Tämä helpottaa ylläpitoa, mutta vaatii silti ymmärrystä siitä, mitä rooli oikeasti antaa.

**Esimerkkitilanne:**  
Ankkalinna Oy:n Service Desk -tiimin vetäjä tarvitsee oikeuden hallita käyttäjätilejä.

Hänelle voidaan antaa User Administrator -rooli, jos hänen tehtäviinsä kuuluu käyttäjien ylläpito.

Mutta jos hänen ei tarvitse hallita sovelluksia, Conditional Access -sääntöjä tai admin-rooleja, hänelle ei pidä antaa laajempaa roolia vain mukavuuden vuoksi.

**Tekninen huomio:**  
Built-in role voi joskus sisältää enemmän oikeuksia kuin nimi antaa ymmärtää. Roolin sisältö pitää tarkistaa ennen käyttöönottoa.

**Riski:**  
Jos rooli valitaan vain nimen perusteella, käyttäjälle voidaan antaa vahingossa liian laajat oikeudet.

**Elikkäs:**  
Built-in role on Microsoftin valmis admin-rooli. Kätevä, mutta ei automaattisesti turvallinen joka tilanteeseen.

---

## Custom Role

**Custom Role** - Organisaation itse määrittelemä hallintarooli, jossa voidaan rajata tarkemmin mitä toimintoja käyttäjä saa tehdä.

Custom role voi olla hyödyllinen, jos valmis built-in role on liian laaja tai ei sovi organisaation tarpeeseen.

Custom role -ajattelussa rakennetaan tarkempi rooli tiettyä tehtävää varten.

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa antaa Service Deskille oikeuden päivittää käyttäjien yhteystietoja, kuten puhelinnumeroa ja toimipistettä.

Samalla Service Deskille ei haluta antaa oikeutta:

- muuttaa admin-rooleja
- muuttaa Conditional Access -sääntöjä
- poistaa käyttäjiä
- hallita sovellusten API-oikeuksia

Tällöin custom role voisi olla parempi vaihtoehto, jos ympäristö ja lisenssit tukevat sitä.

**Tekninen huomio:**  
Custom role ei tarkoita “tee ihan mitä huvittaa” -roolia. Se pitää suunnitella ja dokumentoida kunnolla, jotta tiedetään mitä oikeuksia se sisältää ja miksi se on olemassa.

**Riski:**  
Huonosti suunniteltu custom role voi olla yhtä vaarallinen kuin liian laaja built-in role. Räätälöinti ei tee roolista automaattisesti turvallista.

**Elikkäs:**  
Custom role on räätälöity admin-rooli. Se on hyödyllinen, kun valmis rooli on liian leveä kuin mummon vanha villatakki.

---

## Role Assignment

**Role Assignment** - Roolimääritys. Tarkoittaa sitä, että tietty rooli annetaan tietylle käyttäjälle, ryhmälle tai palveluidentiteetille.

Rooli itsessään on vain määritelmä. Role assignment on se hetki, kun oikeus oikeasti annetaan jollekin.

Role assignmentissä pitää miettiä ainakin:

- kenelle rooli annetaan
- miksi rooli annetaan
- onko rooli pysyvä vai määräaikainen
- onko rooli aktiivinen vai eligible PIM:n kautta
- koskeeko rooli koko tenanttia vai rajattua kohdetta
- kuka hyväksyi roolin
- miten roolin käyttöä valvotaan

**Esimerkkitilanne:**  
Ankkalinna Oy antaa Iinekselle Groups Administrator -roolin.

Tämä roolimääritys tarkoittaa, että Iines saa oikeuden hallita ryhmiä määritellyssä laajuudessa.

Jos rooli annetaan koko tenanttiin pysyvästi, se on paljon laajempi asia kuin jos Iines saa roolin vain määräajaksi PIM:n kautta tai vain tietyn administrative unitin sisällä.

**Tekninen huomio:**  
Role assignment voi kohdistua eri laajuuksiin. Sama rooli voi olla paljon turvallisempi rajattuna kuin koko tenanttiin annettuna.

**Riski:**  
Vanhat roolimääritykset voivat jäädä voimaan, vaikka käyttäjän työtehtävä muuttuu. Tämä on admin-roolien oma versio access driftistä.

**Elikkäs:**  
Role assignment on kohta, jossa rooli muuttuu teoriasta oikeaksi käyttöoikeudeksi.

---

## Scope

**Scope** - Laajuus tai rajaus, jossa rooli tai oikeus on voimassa.

Scope kertoo, missä oikeus pätee.

Rooli voi koskea esimerkiksi:

- koko tenanttia
- tiettyä administrative unitia
- tiettyä sovellusta
- tiettyä resurssia
- tiettyä ryhmää

Scope on tärkeä, koska sama rooli voi olla paljon vaarallisempi koko tenantissa kuin rajatussa kohteessa.

**Esimerkkitilanne:**  
Ankkalinna Oy antaa Joensuun IT-vastaavalle User Administrator -roolin vain `Joensuu Users` -administrative unitin sisällä.

Tällöin scope on rajattu Joensuun käyttäjiin.

Jos sama rooli annettaisiin koko tenanttiin, hän voisi hallita kaikkien toimipisteiden käyttäjiä.

**Tekninen huomio:**  
Scope on yksi tärkeimmistä tavoista toteuttaa least privilege -periaatetta käytännössä.

**Riski:**  
Jos scopea ei rajata, pieneltä kuulostava rooli voi antaa paljon enemmän valtaa kuin käyttäjän tehtävä vaatii.

**Elikkäs:**  
Scope kertoo, missä oikeus toimii. Sama rooli voi olla järkevä rajattuna ja liian vaarallinen koko ympäristöön annettuna.

---

## Global Administrator

**Global Administrator** - Erittäin laaja admin-rooli Microsoft Entra ID:ssä ja Microsoft 365 -ympäristössä. Tällä roolilla on hyvin paljon valtaa tenantissa.

Global Administrator voi tehdä monia kriittisiä muutoksia koko ympäristössä.

Tämä rooli voi vaikuttaa esimerkiksi:

- käyttäjiin
- ryhmiin
- rooleihin
- sovelluksiin
- tenantin asetuksiin
- Microsoft 365 -palveluihin
- turvallisuusasetuksiin
- admin-roolien jakamiseen
- hätätilanteiden korjaamiseen

Global Administrator -roolia ei pitäisi käyttää arjen perusylläpitoon, jos pienempi rooli riittää.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä vain kahdella tai kolmella luotetulla henkilöllä on Global Administrator -rooli.

Rooli ei ole jatkuvasti aktiivisena kaikilla. Sen käyttöä voidaan hallita PIM:n avulla, jolloin henkilö aktivoi roolin vain tarvittaessa ja antaa perustelun.

Global Administrator -roolin käyttöä valvotaan lokien ja hälytysten avulla.

**Tekninen huomio:**  
Global Administrator -roolia kannattaa suojata vahvasti. Käytössä pitäisi olla MFA, PIM, lokitus, hälytykset ja selkeä prosessi.

**Riski:**  
Jos Global Administrator -tunnus kaapataan, hyökkääjä voi saada erittäin laajan hallinnan koko Microsoft-ympäristöön.

**Elikkäs:**  
Global Administrator on Microsoft-ympäristön yleisavain. Sitä ei pidä käyttää vasarana jokaiseen naulaan.

---

## User Administrator

**User Administrator** - Rooli, jolla voidaan hallita käyttäjiä ja tehdä käyttäjiin liittyviä ylläpitotoimia.

User Administrator voi sopia tilanteisiin, joissa henkilön pitää hallita käyttäjätilejä, mutta ei koko tenantin asetuksia.

Tällä roolilla voidaan tehdä käyttäjähallintaan liittyviä tehtäviä, mutta se ei ole sama asia kuin Global Administrator.

**Esimerkkitilanne:**  
Ankkalinna Oy:n Service Desk tarvitsee oikeuden auttaa käyttäjiä tietyissä käyttäjätiliongelmissa.

User Administrator -rooli voi liittyä esimerkiksi käyttäjien perustietojen hallintaan tai tietyntyyppisiin käyttäjätilitoimiin.

Ennen roolin antamista pitää kuitenkin tarkistaa, mitä oikeuksia rooli organisaation ympäristössä käytännössä antaa ja onko rooli liian laaja Service Deskin tarpeeseen.

**Tekninen huomio:**  
User Administrator voi olla arjessa hyödyllinen rooli, mutta se on silti admin-rooli. Sen antaminen pitää dokumentoida ja perustella.

**Riski:**  
Käyttäjähallinnan oikeuksilla voidaan vaikuttaa käyttäjien pääsyyn. Väärissä käsissä tämä voi aiheuttaa merkittäviä ongelmia.

**Elikkäs:**  
User Administrator hallitsee käyttäjiä. Se on pienempi kuin Global Administrator, mutta ei mikään kevyt “ihan sama” -oikeus.

---

## Helpdesk Administrator

**Helpdesk Administrator** - Rooli, joka liittyy käyttäjien auttamiseen esimerkiksi salasana- tai kirjautumisongelmissa.

Helpdesk Administrator on usein lähempänä Service Desk -työtä kuin monet laajemmat admin-roolit.

Se voi soveltua tilanteisiin, joissa käyttäjiä pitää auttaa kirjautumiseen liittyvissä ongelmissa, mutta ei haluta antaa liian laajoja käyttäjähallinnan oikeuksia.

**Esimerkkitilanne:**  
Ankkalinna Oy:n Service Desk auttaa käyttäjiä, jotka eivät pääse kirjautumaan Microsoft 365:een.

Helpdesk Administrator -rooli voi olla sopivampi kuin User Administrator, jos tehtävä liittyy lähinnä käyttäjien kirjautumisongelmien tukemiseen eikä laajaan käyttäjähallintaan.

**Tekninen huomio:**  
Vaikka rooli kuulostaa tukiroolilta, salasanoihin ja kirjautumiseen liittyvä oikeus on aina herkkä.

**Riski:**  
Jos väärä henkilö saa tämän roolin, hän voi vaikuttaa käyttäjien kirjautumiseen ja pääsyyn.

**Elikkäs:**  
Helpdesk Administrator on tukirooli kirjautumis- ja käyttäjäongelmiin. Se voi olla Service Deskille järkevämpi kuin liian laaja admin-rooli.

---

## Groups Administrator

**Groups Administrator** - Rooli, jolla voidaan hallita ryhmiä ja niiden asetuksia.

Groups Administrator voi hallita esimerkiksi Microsoft Entra ID:n ryhmiä, niiden omistajia, jäsenyyksiä ja asetuksia.

Ryhmäadmin-oikeudet ovat tärkeitä, koska ryhmien kautta voidaan antaa pääsyjä moniin resursseihin.

Jos henkilö voi lisätä käyttäjiä kriittisiin ryhmiin, hän voi käytännössä antaa käyttöoikeuksia järjestelmiin, tiedostoihin tai sovelluksiin.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä IT-tiimin jäsen vastaa ryhmien ylläpidosta.

Hän voi lisätä käyttäjiä ryhmiin kuten:

- `HR-Users`
- `Finance-Reports-Read`
- `Production-Application-Users`
- `Project-Team-External`

Jos hän lisää väärän käyttäjän `Finance-Reports-Read` -ryhmään, käyttäjä voi saada pääsyn talousraportteihin.

**Tekninen huomio:**  
Groups Administrator ei välttämättä näytä yhtä vaaralliselta kuin Global Administrator, mutta ryhmät voivat olla pääsynhallinnan ydin.

**Riski:**  
Ryhmäadmin voi epäsuorasti antaa paljon käyttöoikeuksia, jos ryhmät on kytketty kriittisiin resursseihin.

**Elikkäs:**  
Groups Administrator hallitsee ryhmiä. Ja koska ryhmät usein hallitsevat pääsyä, ryhmäadmin hallitsee epäsuorasti myös monia oikeuksia.

---

## Application Administrator

**Application Administrator** - Rooli, jolla voidaan hallita sovelluksia ja niiden asetuksia Microsoft Entra ID:ssä.

Application Administrator voi liittyä esimerkiksi Enterprise Applicationien, App Registrationien, SSO-asetusten ja sovelluksiin liittyvien määritysten hallintaan.

Sovellusadmin-roolit ovat tärkeitä, koska sovelluksilla voi olla laajoja pääsyjä käyttäjätietoihin, Microsoft Graphiin tai muihin rajapintoihin.

**Esimerkkitilanne:**  
Ankkalinna Oy ottaa käyttöön uuden HR SaaS -sovelluksen.

Application Administrator voi:

- lisätä sovelluksen Entraan
- määrittää SSO-kirjautumisen
- hallita käyttäjien pääsyä sovellukseen
- tarkistaa sovelluksen asetuksia
- käsitellä sovelluksen tunnistautumiseen liittyviä asetuksia

Jos sovellukselle annetaan liikaa oikeuksia, se voi päästä tietoihin, joihin sen ei pitäisi päästä.

**Tekninen huomio:**  
Sovellusten hallinta ei ole vain “appi käyttöön ja valmis”. Siihen liittyy SSO, käyttäjäpääsyt, API-oikeudet, consentit, sertifikaatit, client secretit ja lokitus.

**Riski:**  
Huonosti hallittu sovellus voi olla iso tietoturvariski, erityisesti jos sillä on laajat application permissions -oikeudet.

**Elikkäs:**  
Application Administrator hallitsee sovelluksia. Tämä ei ole vain “lisää appi listaan” -rooli, koska sovellusten kautta voi kulkea paljon identiteetti- ja käyttöoikeusriskiä.

---

## Cloud Application Administrator

**Cloud Application Administrator** - Rooli, jolla voidaan hallita pilvisovelluksia ja sovelluksiin liittyviä asetuksia Microsoft Entra ID:ssä.

Cloud Application Administrator muistuttaa Application Administrator -roolia, mutta roolien tarkka ero ja oikeudet pitää aina tarkistaa organisaation tarpeesta.

Tätä roolia voidaan käyttää sovellusten hallintaan ilman, että käyttäjälle annetaan laajempia koko tenantin admin-oikeuksia.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä IAM-tiimin jäsen vastaa SaaS-sovellusten SSO-määrityksistä.

Hänelle voidaan harkita Cloud Application Administrator -roolia, jos hänen pitää hallita sovelluksia, mutta ei käyttäjiä, ryhmiä tai tenantin muita asetuksia laajasti.

**Tekninen huomio:**  
Sovellusadmin-roolin sisältö pitää tarkistaa ennen jakamista. Nimi ei yksin riitä kertomaan, mitä kaikkea rooli mahdollistaa.

**Riski:**  
Pilvisovellusten kautta voidaan käsitellä käyttäjätietoja, pääsyjä ja kirjautumista. Siksi sovellusadmin-oikeuksia ei pidä jakaa kevyesti.

**Elikkäs:**  
Cloud Application Administrator liittyy pilvisovellusten hallintaan. Hyödyllinen rooli, mutta sen vaikutukset pitää ymmärtää ennen jakamista.

---

## Authentication Administrator

**Authentication Administrator** - Rooli, jolla voidaan hallita käyttäjien tunnistautumismenetelmiä tietyssä laajuudessa.

Tämä rooli liittyy esimerkiksi MFA- ja authentication method -asioihin.

Rooli voi olla hyödyllinen tukitehtävissä, joissa käyttäjällä on ongelma Microsoft Authenticatorin, MFA:n tai kirjautumisen vahvistamisen kanssa.

**Esimerkkitilanne:**  
Aku Ankka vaihtaa puhelinta ja hänen Microsoft Authenticatorinsa ei enää toimi.

Service Desk tai identiteettitiimi voi tarvita oikeuden nollata tai hallita Akun authentication method -asetuksia.

Authentication Administrator -roolin avulla voidaan auttaa käyttäjää palauttamaan pääsy turvallisesti.

**Tekninen huomio:**  
Authentication methods liittyvät käyttäjän kirjautumisen turvallisuuteen. Niiden hallinta pitää tehdä tunnistetun ja hyväksytyn prosessin kautta.

**Riski:**  
Jos hyökkääjä saa tällaisen roolin, hän voi yrittää vaikuttaa siihen, miten käyttäjät todentavat itsensä.

**Elikkäs:**  
Authentication Administrator hallitsee kirjautumisen vahvistamistapoja. Se on hyödyllinen tukirooli, mutta tietoturvan kannalta vakava oikeus.

---

## Privileged Authentication Administrator

**Privileged Authentication Administrator** - Vahvempi rooli tunnistautumismenetelmien hallintaan. Tällä roolilla voi olla laajemmat oikeudet hallita käyttäjien authentication method -asetuksia, myös korkeamman riskin käyttäjillä.

Tämä rooli on herkempi kuin tavallinen Authentication Administrator.

Sitä pitää kohdella korkean riskin roolina, koska sillä voidaan vaikuttaa siihen, miten käyttäjät kirjautuvat ja todistavat henkilöllisyytensä.

**Esimerkkitilanne:**  
Ankkalinna Oy:n identiteettitiimissä vain harvalla henkilöllä on Privileged Authentication Administrator -rooli.

Sitä käytetään esimerkiksi tilanteissa, joissa pitää palauttaa pääsy korkeamman tason käyttäjälle tai admin-käyttäjälle, jonka MFA on mennyt rikki.

Roolin käyttö vaatii vahvan tunnistautumisen, perustelun ja lokituksen.

**Tekninen huomio:**  
Tämä rooli kannattaa pitää PIM:n takana ja käyttöä pitäisi valvoa.

**Riski:**  
Tällä roolilla voidaan vaikuttaa vahvasti käyttäjien tunnistautumiseen. Väärissä käsissä vaikutus voi olla iso.

**Elikkäs:**  
Privileged Authentication Administrator on vahva tunnistautumisen hallintarooli. Tätä ei jaeta kuin karkkia konttorin kahvipöydässä.

---

## Privileged Role Administrator

**Privileged Role Administrator** - Rooli, jolla voidaan hallita roolimäärityksiä ja etuoikeutettuja rooleja. Tämä on erittäin vahva oikeus.

Privileged Role Administrator voi vaikuttaa siihen, kenellä on admin-rooleja.

Tämä tekee roolista erittäin kriittisen, koska sen avulla voidaan antaa tai hallita muita korkeita oikeuksia.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä vain identiteettitiimin vastuuhenkilöillä on Privileged Role Administrator -oikeus.

Jos Roope tarvitsee määräajaksi Global Administrator -roolin, Privileged Role Administrator -oikeudella varustettu henkilö voi hallita roolimääritystä tai PIM-asetuksia organisaation mallin mukaisesti.

**Tekninen huomio:**  
Privileged Role Administrator on yksi niistä rooleista, jotka pitää suojata erityisen tarkasti.

**Riski:**  
Jos Privileged Role Administrator -oikeus joutuu vääriin käsiin, hyökkääjä voi mahdollisesti antaa itselleen tai muille laajoja admin-oikeuksia.

**Elikkäs:**  
Privileged Role Administrator on rooli, jolla voidaan vaikuttaa admin-oikeuksiin. Se on vähän kuin avain kaappiin, jossa säilytetään muut avaimet.

---

## Security Reader

**Security Reader** - Rooli, jolla voidaan lukea tietoturvaan liittyviä tietoja, mutta ei välttämättä tehdä muutoksia.

Security Reader voi olla hyödyllinen analyytikoille, auditoijille tai henkilöille, joiden pitää tarkastella tietoturvatietoja ilman muokkausoikeuksia.

**Esimerkkitilanne:**  
Ankkalinna Oy:n junior IAM-analyytikko tarvitsee näkyvyyden kirjautumisriskeihin ja tietoturvaraportteihin, mutta hänen ei pidä muuttaa asetuksia.

Security Reader -rooli voi antaa tarvittavaa näkyvyyttä ilman täyttä ylläpito-oikeutta.

**Tekninen huomio:**  
Lukuoikeuskin voi olla herkkä, jos sillä nähdään tietoturvatapahtumia, käyttäjätietoja tai organisaation suojaustasoa.

**Riski:**  
Vaikka rooli ei anna muokkausoikeutta, tietojen näkyvyys voi silti olla arkaluontoista.

**Elikkäs:**  
Security Reader saa katsoa, mutta ei säätää. Tämä on usein hyvä analysointiin ja oppimiseen.

---

## Security Administrator

**Security Administrator** - Rooli, jolla voidaan hallita tietoturvaan liittyviä asetuksia ja toimintoja.

Security Administrator on vahvempi kuin Security Reader, koska se voi sisältää muokkausoikeuksia tietoturva-asetuksiin.

**Esimerkkitilanne:**  
Ankkalinna Oy:n tietoturvatiimi hallitsee tietoturva-asetuksia, hälytyksiä ja suojauskäytäntöjä.

Security Administrator -roolia voidaan käyttää henkilölle, jonka tehtävä on oikeasti hallita näitä asetuksia, ei vain katsoa raportteja.

**Tekninen huomio:**  
Tietoturva-asetusten muutokset pitää dokumentoida ja niillä pitää olla muutoksenhallinta. Pieni muutos voi vaikuttaa kirjautumisiin, suojauskäytäntöihin tai hälytyksiin.

**Riski:**  
Tällä roolilla voidaan vaikuttaa turvallisuusasetuksiin. Väärin käytettynä se voi heikentää suojausta.

**Elikkäs:**  
Security Administrator ei vain katso tietoturvaa, vaan voi myös muuttaa siihen liittyviä asetuksia.

---

## License Administrator

**License Administrator** - Rooli, jolla voidaan hallita käyttäjien lisenssejä.

Lisenssi määrittää, mitä Microsoft-palveluita käyttäjä voi käyttää. Siksi lisenssien hallinta liittyy myös käyttöoikeuksiin.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä uusi työntekijä tarvitsee Microsoft 365 -lisenssin, jotta hän saa Outlookin, Teamsin ja muut tarvittavat palvelut käyttöönsä.

License Administrator voi lisätä tai poistaa lisenssejä käyttäjiltä.

Jos lisenssi poistetaan väärältä käyttäjältä, käyttäjän sähköposti, Teams tai muut palvelut voivat lakata toimimasta.

**Tekninen huomio:**  
Lisenssi ei aina tarkoita pääsyä tiettyyn dataan, mutta se voi mahdollistaa palvelun käytön. Siksi lisenssien jakelu pitää ymmärtää osana käyttäjän aloitusta, muutoksia ja poistumista.

**Riski:**  
Väärä lisenssin poisto voi aiheuttaa käyttökatkoja. Väärä lisenssin lisäys voi antaa käyttäjälle palveluita, joita hän ei tarvitse.

**Elikkäs:**  
License Administrator hallitsee lisenssejä. Lisenssi ei ole vain laskutusasia, koska se vaikuttaa suoraan siihen mitä käyttäjä voi käyttää.

---

## Exchange Administrator

**Exchange Administrator** - Rooli, jolla hallitaan Exchange Onlineen liittyviä asetuksia, kuten postilaatikoita, sähköpostiasetuksia, jakelulistoja ja sähköpostin kulkuun liittyviä määrityksiä.

Exchange Administrator liittyy vahvasti sähköpostiin.

**Esimerkkitilanne:**  
Iines Ankan nimi muuttuu Iines Hanhiksi.

Exchange Administrator voi olla mukana varmistamassa, että:

- ensisijainen sähköpostiosoite päivittyy oikein
- vanha sähköpostiosoite jää aliakseksi
- postilaatikko toimii edelleen
- sähköposti kulkee oikein
- osoitekirjassa näkyvä tieto päivittyy

**Tekninen huomio:**  
Nimenmuutoksissa pitää ymmärtää ero UPN:n, primary SMTP -osoitteen ja proxyAddresses-attribuuttien välillä.

**Riski:**  
Väärä muutos sähköpostiattribuuteissa voi rikkoa postin kulkua tai aiheuttaa sen, että vanhaan osoitteeseen lähetetyt viestit eivät tule perille.

**Elikkäs:**  
Exchange Administrator hallitsee sähköpostiin liittyviä asioita. Nimenmuutoksissa ja aliaksissa tämä rooli voi olla todella olennainen.

---

## SharePoint Administrator

**SharePoint Administrator** - Rooli, jolla hallitaan SharePoint Onlineen liittyviä asetuksia, sivustoja ja jakamista.

SharePoint liittyy usein tiedostojen, dokumenttien ja tiimityön käyttöoikeuksiin.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on SharePoint-sivusto HR-dokumenteille.

SharePoint Administrator voi hallita sivuston asetuksia ja jakamiseen liittyviä määrityksiä.

Mutta se ei tarkoita, että jokaisen SharePoint Administratorin pitäisi automaattisesti päättää, kuka saa nähdä HR-dokumentit. Data ownerin tai sivuston omistajan pitää olla mukana käyttöoikeuspäätöksissä.

**Tekninen huomio:**  
SharePoint-oikeudet voivat tulla useaa kautta, esimerkiksi Microsoft 365 Groupin, SharePoint-ryhmän, suoran jaon tai linkkien kautta.

**Riski:**  
Liian avoimet jakoasetukset voivat levittää tiedostoja väärille käyttäjille tai ulkoisille henkilöille.

**Elikkäs:**  
SharePoint Administrator hallitsee SharePointia, mutta tiedon omistajuus ja käyttöoikeuspäätökset pitää silti miettiä erikseen.

---

## Teams Administrator

**Teams Administrator** - Rooli, jolla hallitaan Microsoft Teamsiin liittyviä asetuksia.

Teams Administrator voi vaikuttaa esimerkiksi Teams-käytäntöihin, kokousasetuksiin, viestintäasetuksiin ja Teams-ympäristön hallintaan.

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa rajoittaa, ketkä saavat luoda uusia Teams-tiimejä ja miten ulkoisia käyttäjiä voidaan kutsua mukaan.

Teams Administrator voi olla mukana määrittämässä Teamsin hallintakäytäntöjä.

**Tekninen huomio:**  
Teams ei ole vain keskustelusovellus. Teams-tiimeihin liittyy usein Microsoft 365 Group, SharePoint-sivusto, tiedostot ja mahdollisesti guest-käyttäjiä.

**Riski:**  
Jos Teamsien luonti ja ulkoinen jakaminen on liian vapaata, ympäristöön voi syntyä paljon hallitsemattomia tiimejä, tiedostoja ja guest-käyttäjiä.

**Elikkäs:**  
Teams Administrator hallitsee Teams-ympäristöä. IAM-näkökulmasta Teams on tärkeä, koska sen kautta voi syntyä pääsyä tiedostoihin, ryhmiin ja ulkoisille käyttäjille.

---

## Privileged Role

**Privileged Role** - Etuoikeutettu rooli, jolla on tavallista suurempi vaikutus ympäristön turvallisuuteen tai hallintaan.

Privileged role voi olla esimerkiksi rooli, jolla voi:

- hallita muita käyttäjiä
- hallita admin-rooleja
- muuttaa turvallisuusasetuksia
- hallita sovelluksia
- muuttaa tunnistautumismenetelmiä
- nähdä tai käsitellä arkaluontoisia asetuksia

**Esimerkkitilanne:**  
Global Administrator, Privileged Role Administrator ja Privileged Authentication Administrator ovat rooleja, joita Ankkalinna Oy pitää korkean riskin rooleina.

Näiden käyttöön vaaditaan:

- MFA
- PIM-aktivointi
- perustelu
- määräaikaisuus
- lokitus
- mahdollisesti hyväksyntä

**Tekninen huomio:**  
Privileged role kannattaa yleensä suojata PIM:llä, vahvalla tunnistautumisella ja säännöllisillä access revieweillä.

**Riski:**  
Jos privileged role kaapataan tai sitä käytetään väärin, vaikutus voi olla todella suuri.

**Elikkäs:**  
Privileged role on tavallista vahvempi oikeus. Sitä pitää kohdella kuin terävää veistä: hyödyllinen oikeissa käsissä, vaarallinen väärissä.

---

## Least Privilege in Admin Roles

**Least Privilege in Admin Roles** - Periaate, jossa ylläpitäjälle annetaan vain ne hallintaoikeudet, joita hän oikeasti tarvitsee tehtävänsä tekemiseen.

Admin-rooleissa least privilege on todella tärkeä, koska liian laajat admin-oikeudet voivat aiheuttaa ison riskin.

Huono malli:

- kaikki IT-henkilöt saavat Global Administrator -roolin
- roolit ovat pysyviä
- käyttöä ei valvota
- ei tiedetä kuka tarvitsee mitäkin roolia
- vanhat admin-oikeudet jäävät voimaan roolimuutosten jälkeen

Parempi malli:

- roolit valitaan tehtävän mukaan
- vahvat roolit ovat PIM:n takana
- oikeudet ovat määräaikaisia
- käyttöä valvotaan
- roolit tarkistetaan säännöllisesti
- admin-tilejä ei käytetä normaaliin arkityöhön

**Esimerkkitilanne:**  
Ankkalinna Oy:n Service Desk tarvitsee apua käyttäjien kirjautumisongelmissa.

Sen sijaan että kaikille annetaan Global Administrator, roolit rajataan tarkemmin:

- Helpdesk Administrator kirjautumisongelmiin
- License Administrator lisenssiasioihin
- Groups Administrator ryhmämuutoksiin, jos se kuuluu työnkuvaan
- Security Reader näkyvyyteen ilman muokkausoikeuksia

**Tekninen huomio:**  
Least privilege ei tarkoita, että työnteko tehdään mahdottomaksi. Se tarkoittaa, että oikeudet mitoitetaan tehtävään eikä mukavuuteen.

**Riski:**  
Liian laajat oikeudet tekevät vahingosta tai tilikaappauksesta pahemman. Kun oikeuksia on vähemmän, myös vahingon vaikutusalue on pienempi.

**Elikkäs:**  
Least privilege admin-rooleissa tarkoittaa: älä anna isompaa avainta kuin tehtävä vaatii.

---

## Admin Role Review

**Admin Role Review** - Admin-roolien säännöllinen tarkistus. Tarkistetaan, kenellä on hallintaoikeuksia, tarvitseeko hän niitä edelleen ja ovatko oikeudet sopivan laajuisia.

Admin role review on tärkeä osa identiteetin ja käyttöoikeuksien hallintaa.

Tarkistuksessa voidaan katsoa esimerkiksi:

- kenellä on Global Administrator -rooli
- kenellä on Privileged Role Administrator -rooli
- kenellä on sovellusadmin-oikeuksia
- kenellä on ryhmäadmin-oikeuksia
- ovatko roolit pysyviä vai PIM:n takana
- onko käyttäjä edelleen samassa tehtävässä
- milloin roolia on viimeksi käytetty
- onko roolille dokumentoitu peruste

**Esimerkkitilanne:**  
Ankkalinna Oy tekee neljännesvuosittain admin-roolien tarkistuksen.

Tarkistuksessa huomataan, että Hannu Hanhella on edelleen Groups Administrator -rooli projektista, joka päättyi kuusi kuukautta sitten.

Hannun nykyinen työ ei enää vaadi ryhmien hallintaa, joten rooli poistetaan.

**Tekninen huomio:**  
Admin-roolit kannattaa tarkistaa erikseen tavallisista käyttäjäoikeuksista, koska niiden vaikutus on suurempi.

**Riski:**  
Jos admin-rooleja ei tarkisteta, organisaatioon kertyy pysyviä korkean riskin oikeuksia, joita kukaan ei enää kyseenalaista.

**Elikkäs:**  
Admin role review on admin-oikeuksien siivouspäivä. Katsotaan kuka pitää avaimet ja tarvitseeko hän niitä enää oikeasti.
