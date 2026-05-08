# 07 - Identity Governance

Tämä sivu kokoaa Microsoft Entra ID:n identity governance -ajatteluun liittyviä käsitteitä.

Tavoite on ymmärtää, että käyttöoikeuksien hallinta ei ole vain sitä, että käyttäjälle annetaan pääsy johonkin.

Vähintään yhtä tärkeää on kysyä:

- miksi käyttäjällä on tämä oikeus?
- kuka sen hyväksyi?
- tarvitseeko käyttäjä sitä edelleen?
- milloin oikeus päättyy?
- kuka omistaa resurssin?
- poistuvatko oikeudet automaattisesti?
- jääkö muutoksesta lokijälki?
- voidaanko oikeudet tarkistaa myöhemmin?
- mitä tapahtuu, kun käyttäjä vaihtaa roolia?
- mitä tapahtuu, kun käyttäjä lähtee organisaatiosta?

Identity Governance liittyy siihen, miten identiteettejä, käyttöoikeuksia, hyväksyntöjä, tarkistuksia ja elinkaaria hallitaan niin, ettei ympäristöön kerry turhaa pääsyä.

---

## Contents

- [Identity Governance](#identity-governance)
- [Entitlement](#entitlement)
- [Entitlement Management](#entitlement-management)
- [Access Package](#access-package)
- [Catalog](#catalog)
- [Resource](#resource)
- [Resource Role](#resource-role)
- [Policy](#policy)
- [Approval Workflow](#approval-workflow)
- [Access Request](#access-request)
- [Access Review](#access-review)
- [Access Certification](#access-certification)
- [Reviewer](#reviewer)
- [Self-Review](#self-review)
- [Manager Review](#manager-review)
- [Resource Owner Review](#resource-owner-review)
- [Access Lifecycle](#access-lifecycle)
- [Temporary Access](#temporary-access)
- [Expiration](#expiration)
- [Access Drift](#access-drift)
- [Role Creep](#role-creep)
- [Orphaned Access](#orphaned-access)
- [Dormant Account](#dormant-account)
- [Orphaned Account](#orphaned-account)
- [Lifecycle Workflows](#lifecycle-workflows)
- [Joiner Workflow](#joiner-workflow)
- [Mover Workflow](#mover-workflow)
- [Leaver Workflow](#leaver-workflow)
- [Separation of Duties](#separation-of-duties)
- [Audit Trail](#audit-trail)

---

## Identity Governance

**Identity Governance** - Identiteettien ja käyttöoikeuksien hallinnan kokonaisuus, jossa keskitytään siihen, että käyttäjillä on oikeat oikeudet, oikeaan aikaan, oikeasta syystä ja oikealla hyväksynnällä.

Identity governance ei ole pelkkä tekninen nappula.

Se on yhdistelmä:

- prosesseja
- hyväksyntöjä
- käyttöoikeuksien tarkistuksia
- automaatiota
- omistajuutta
- dokumentaatiota
- auditointia
- riskienhallintaa

IAMissa voidaan ajatella, että access management antaa käyttäjälle oven auki.

Identity governance kysyy:

> Oliko oven avaamiseen hyvä syy, kuka antoi luvan ja pitääkö oven olla yhä auki?

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä Aku Ankka tarvitsee pääsyn raportointisovellukseen.

Pelkkä tekninen lisäys ryhmään ei riitä hyvään governanceen.

Pitäisi myös tietää:

- miksi Aku tarvitsee pääsyn
- kuka hyväksyi pyynnön
- mihin rooliin tai työtehtävään pääsy liittyy
- onko pääsy pysyvä vai määräaikainen
- kuka tarkistaa oikeuden myöhemmin
- poistetaanko oikeus automaattisesti, jos Aku vaihtaa tehtävää

**Tekninen huomio:**  
Microsoft Entra ID Governance sisältää ominaisuuksia kuten Entitlement Management, Access Reviews, Privileged Identity Management ja Lifecycle Workflows.

**Riski:**  
Ilman governancea käyttöoikeudet muuttuvat helposti “lisää vaan ryhmään” -kaaokseksi. Aluksi se toimii nopeasti, myöhemmin kukaan ei enää tiedä miksi kenelläkin on pääsy mihinkin.

**Elikkäs:**  
Identity Governance on käyttöoikeuksien järjenpito. Ei vain anneta pääsyjä, vaan hallitaan miksi ne annetaan, kuka ne hyväksyy ja milloin ne poistetaan.

---

## Entitlement

**Entitlement** - Käyttöoikeus, pääsy tai etuus johonkin järjestelmään, rooliin, ryhmään, sovellukseen tai resurssiin.

Entitlement voi tarkoittaa esimerkiksi:

- pääsyä sovellukseen
- ryhmäjäsenyyttä
- roolia sovelluksessa
- pääsyä SharePoint-sivustoon
- oikeutta raportteihin
- lisenssiä
- käyttöoikeutta tiettyyn toimintoon

Entitlement on siis laajempi käsite kuin pelkkä “ryhmä”.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä Iines tarvitsee pääsyn HR-järjestelmään.

Hänen entitlementtinsä voi koostua esimerkiksi:

- pääsy HR-sovellukseen
- `HR-Users` -ryhmäjäsenyys
- HR Specialist -rooli sovelluksessa
- Microsoft 365 -lisenssi
- pääsy HR SharePoint -sivustoon

Nämä kaikki ovat eri asioita, mutta käyttäjän näkökulmasta ne näyttävät vain siltä, että “pääsen HR-järjestelmään”.

**Tekninen huomio:**  
IGA- ja IAM-maailmassa entitlement on tärkeä käsite, koska oikeuksia voidaan tarkistaa, hyväksyä ja poistaa entitlement-tasolla.

**Riski:**  
Jos ei tiedetä, mistä käyttäjän entitlement koostuu, pääsyä on vaikea hallita tai poistaa kokonaan.

**Elikkäs:**  
Entitlement on käyttöoikeuden palanen tai kokonaisuus. Se voi olla ryhmä, rooli, lisenssi, sovelluspääsy tai muu oikeus.

---

## Entitlement Management

**Entitlement Management** - Microsoft Entra ID Governance -ominaisuus, jolla hallitaan pääsyjä access packagejen, hyväksyntöjen, omistajuuden ja elinkaaren avulla.

Entitlement Management auttaa tekemään käyttöoikeuksien pyytämisestä ja myöntämisestä hallitumpaa.

Sen avulla voidaan määritellä esimerkiksi:

- mitä oikeuksia käyttäjä voi pyytää
- kuka voi pyytää niitä
- kuka hyväksyy pyynnön
- kuinka pitkäksi aikaa pääsy annetaan
- pitääkö pääsy tarkistaa myöhemmin
- poistuvatko oikeudet automaattisesti
- mitä resursseja access package sisältää

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä on uusi projekti nimeltä `Raportointi 2026`.

Projektin jäsenet tarvitsevat:

- Teams-tiimin
- SharePoint-sivuston
- raportointisovelluksen
- tietyn ryhmän jäsenyyden

Sen sijaan että jokaisesta oikeudesta tehdään erillinen tiketti, nämä kootaan access packageksi.

Käyttäjä pyytää access packagea, esihenkilö tai resurssin omistaja hyväksyy pyynnön ja oikeudet annetaan hallitusti.

**Tekninen huomio:**  
Entitlement Management on erityisen hyödyllinen, kun käyttöoikeuksia halutaan antaa paketteina, määräajaksi ja hyväksyntöjen kautta.

**Riski:**  
Jos access package suunnitellaan huonosti, se voi antaa liian paljon oikeuksia kerralla. Paketti ei tee pääsystä automaattisesti turvallista.

**Elikkäs:**  
Entitlement Management on tapa paketoida ja hallita käyttöoikeuksia järkevämmin kuin yksittäisillä “lisää tämä ryhmään” -tiketeillä.

---

## Access Package

**Access Package** - Oikeuspaketti, joka voi sisältää useita resursseja ja niihin liittyviä rooleja.

Access package voi sisältää esimerkiksi:

- ryhmiä
- Teams-tiimejä
- SharePoint-sivustoja
- Enterprise Applicationeja
- sovellusrooleja

Access package on hyödyllinen, kun tiettyyn tehtävään, projektiin tai rooliin kuuluu useampi oikeus.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on kesäprojekti, johon osallistuvat Tupu, Hupu ja Lupu.

Projektiin tarvitaan:

- Teams-tiimi
- SharePoint-kansio
- Planner
- raportointisovelluksen Reader-rooli

Näistä tehdään access package nimeltä `Summer Project - Basic Access`.

Kun käyttäjä saa access packagen, hän saa samalla tarvittavat projektioikeudet.

Pääsy voidaan asettaa päättymään automaattisesti projektin lopussa.

**Tekninen huomio:**  
Access packageen kannattaa sisällyttää vain tarpeelliset oikeudet. Jos pakettiin laitetaan liikaa, jokainen paketin saaja saa liikaa.

**Riski:**  
Huono access package voi levittää laajoja oikeuksia tehokkaasti väärään paikkaan. Automaatio ei pelasta huonoa suunnittelua.

**Elikkäs:**  
Access package on käyttöoikeuksien valmis paketti. Hyvä paketti nopeuttaa työtä, huono paketti nopeuttaa sotkua.

---

## Catalog

**Catalog** - Kokoelma resursseja ja access packageja Entitlement Managementissa.

Catalog auttaa järjestämään käyttöoikeuksia hallittaviin kokonaisuuksiin.

Catalog voi liittyä esimerkiksi:

- tiettyyn osastoon
- tiettyyn projektiin
- tiettyyn järjestelmään
- ulkoisten käyttäjien pääsyihin
- HR-resursseihin
- taloushallinnon resursseihin

**Esimerkkitilanne:**  
Ankkalinna Oy tekee catalogin nimeltä `Finance Resources`.

Sen sisällä on access packageja kuten:

- `Finance Reports - Reader`
- `Finance Reports - Approver`
- `Budget Planning - Project Access`
- `External Auditor - Limited Access`

Catalogilla on omistajat, jotka vastaavat siitä, mitä resursseja catalogissa on ja kuka niitä voi pyytää.

**Tekninen huomio:**  
Catalog kannattaa ajatella hallittuna käyttöoikeuksien kirjastona. Sillä pitää olla omistaja ja tarkoitus.

**Riski:**  
Jos catalogiin lisätään resursseja ilman rakennetta, siitä tulee sekava varasto, josta kukaan ei tiedä mitä siellä jaetaan.

**Elikkäs:**  
Catalog on access packagejen ja resurssien kokoelma. Se on kuin käyttöoikeuksien hylly, mutta jonkun pitää pitää hylly järjestyksessä.

---

## Resource

**Resource** - Resurssi, johon käyttäjä tarvitsee pääsyn.

Resource voi olla esimerkiksi:

- sovellus
- ryhmä
- SharePoint-sivusto
- Teams-tiimi
- tietokanta
- raportti
- tiedostokansio
- järjestelmä
- palvelu

Identity governancessa resurssi ei ole vain tekninen kohde. Sillä pitäisi olla myös omistaja ja pääsynhallinnan logiikka.

**Esimerkkitilanne:**  
Ankkalinna Oy:n HR SharePoint -sivusto on resource.

Sivusto sisältää henkilöstöön liittyvää tietoa, joten kaikki eivät saa päästä sinne.

Resurssille pitää määritellä:

- kuka omistaa sen
- kuka saa hyväksyä pääsyn
- ketkä tarvitsevat pääsyn
- mitä rooleja on olemassa
- milloin oikeudet tarkistetaan
- saavatko guest-käyttäjät päästä sinne

**Tekninen huomio:**  
Resurssin omistajuus on tärkeä, koska IT ei aina voi tietää, kuka liiketoiminnan näkökulmasta saa nähdä tietyn datan.

**Riski:**  
Jos resurssilla ei ole omistajaa, kukaan ei oikeasti vastaa siitä, kenellä on pääsy.

**Elikkäs:**  
Resource on kohde, johon pääsy annetaan. Jos resurssilla ei ole omistajaa, käyttöoikeuksista tulee helposti arvailua.

---

## Resource Role

**Resource Role** - Resurssiin liittyvä rooli tai käyttöoikeustaso.

Sama resurssi voi sisältää useita eri rooleja.

Esimerkiksi:

- Reader
- Contributor
- Editor
- Approver
- Owner
- Administrator

Resource role kertoo, mitä käyttäjä saa tehdä kyseisessä resurssissa.

**Esimerkkitilanne:**  
Ankkalinna Oy:n raportointisovelluksessa on kolme roolia:

- Reader voi katsoa raportteja
- Editor voi muokata raportteja
- Admin voi hallita sovelluksen asetuksia ja käyttäjiä

Aku tarvitsee vain raporttien lukemisen.

Hänelle annetaan Reader-rooli, ei Admin-roolia.

**Tekninen huomio:**  
Pääsy resurssiin ja rooli resurssissa ovat eri asioita. Käyttäjä voi päästä sovellukseen, mutta hänen oikeustasonsa sovelluksen sisällä pitää määritellä erikseen.

**Riski:**  
Jos kaikille annetaan korkein rooli varmuuden vuoksi, least privilege menee roskiin ja kohta ihmetellään miksi kaikki voivat muokata kaikkea.

**Elikkäs:**  
Resource role kertoo, mitä käyttäjä saa tehdä resurssissa. Pääsy sisään ei tarkoita automaattisesti pääsyä hallita kaikkea.

---

## Policy

**Policy** - Sääntö tai käytäntö, joka määrittää miten käyttöoikeutta voidaan pyytää, hyväksyä, antaa, tarkistaa tai poistaa.

Identity governance -yhteydessä policy voi määritellä esimerkiksi:

- kuka voi pyytää access packagea
- kuka hyväksyy pyynnön
- kuinka pitkäksi aikaa pääsy annetaan
- vaaditaanko perustelu
- sallitaanko ulkoiset käyttäjät
- tarvitaanko access review
- mitä tapahtuu päättymispäivänä

**Esimerkkitilanne:**  
Ankkalinna Oy tekee access packagen ulkoisille auditoijille.

Policy määrittää:

- vain guest-käyttäjät voivat pyytää pakettia
- pyynnön hyväksyy Finance Data Owner
- pääsy on voimassa 30 päivää
- käyttäjän pitää antaa perustelu
- pääsy tarkistetaan ennen uusimista
- pääsy poistuu automaattisesti päättymispäivänä

**Tekninen huomio:**  
Policy on se kohta, jossa tekninen ratkaisu ja organisaation prosessi kohtaavat.

**Riski:**  
Jos policy on liian löysä, pääsyjä annetaan liikaa. Jos policy on liian tiukka, käyttäjät kiertävät prosessia epävirallisilla tavoilla.

**Elikkäs:**  
Policy on käyttöoikeuksien sääntökirja. Se kertoo, kuka saa pyytää mitä, kuka hyväksyy ja kuinka kauan oikeus kestää.

---

## Approval Workflow

**Approval Workflow** - Hyväksyntäprosessi, joka määrittää kuka hyväksyy käyttöoikeuspyynnön ennen kuin oikeus annetaan.

Hyvä approval workflow voi sisältää esimerkiksi:

- esihenkilön hyväksynnän
- järjestelmän omistajan hyväksynnän
- data ownerin hyväksynnän
- tietoturvan hyväksynnän
- useamman tason hyväksynnän
- automaattisen hyväksynnän matalan riskin oikeuksille

**Esimerkkitilanne:**  
Hupu Ankka tarvitsee pääsyn palkkaraportteihin.

Tämä ei ole tavallinen perusoikeus, joten pelkkä käyttäjän oma pyyntö ei riitä.

Approval workflow voisi olla:

1. Hupun esihenkilö hyväksyy, että työtehtävä vaatii pääsyn.
2. HR Data Owner hyväksyy, että Hupu saa nähdä palkkatietoa.
3. IT toteuttaa tai automaatio antaa pääsyn.
4. Pääsy kirjautuu lokiin ja tarkistetaan myöhemmin access reviewissä.

**Tekninen huomio:**  
Hyväksyjän pitää ymmärtää mitä hän hyväksyy. Jos hyväksyjä painaa vain “approve” miettimättä, workflow on koriste.

**Riski:**  
Väärä hyväksyjä tai heikko hyväksyntäprosessi voi antaa käyttäjälle pääsyn tietoihin, joihin hänen ei pitäisi päästä.

**Elikkäs:**  
Approval workflow on hyväksyntäketju. Oikea ihminen antaa luvan ennen kuin pääsy annetaan.

---

## Access Request

**Access Request** - Käyttöoikeuspyyntö. Pyyntö saada pääsy johonkin järjestelmään, resurssiin, sovellukseen, ryhmään tai rooliin.

Hyvä access request ei ole vain “tarvitsen oikeudet”.

Hyvä pyyntö kertoo:

- kuka tarvitsee pääsyn
- mihin pääsyä tarvitaan
- miksi pääsyä tarvitaan
- kuinka pitkäksi aikaa pääsy tarvitaan
- mikä rooli tai oikeustaso tarvitaan
- kuka hyväksyy pyynnön
- liittyykö pyyntö työsuhteen, roolin tai projektin muutokseen

**Esimerkkitilanne:**  
Aku Ankan esihenkilö pyytää Akulle pääsyä tuotannon raportointisovellukseen.

Pyyntöön kirjataan:

- käyttäjä: Aku Ankka
- järjestelmä: Production Reporting
- oikeustaso: Reader
- peruste: Aku seuraa tuotantovuoron raportteja
- kesto: toistaiseksi nykyisen roolin ajan
- hyväksyjä: tuotannon esihenkilö
- toteutus: access package tai ryhmäjäsenyys

Tämä on parempi kuin pyyntö:

> “Antakaa Akulle samat oikeudet kuin Iineksellä.”

**Tekninen huomio:**  
Access request voidaan toteuttaa tikettinä, access package -pyyntönä, automaationa tai organisaation IAM/IGA-järjestelmässä.

**Riski:**  
Jos käyttäjät voivat pyytää itselleen mitä tahansa ilman oikeaa hyväksyntää, käyttöoikeuksista voi tulla villi länsi. Yeehaw, mutta ei hyvä auditissa.

**Elikkäs:**  
Access request on käyttöoikeuden pyyntö. Hyvä pyyntö kertoo mitä tarvitaan, miksi tarvitaan ja kuka sen hyväksyy.

---

## Access Review

**Access Review** - Käyttöoikeuksien tarkistus. Tarkistetaan, tarvitseeko käyttäjä edelleen hänellä olevia oikeuksia.

Access review voi koskea esimerkiksi:

- ryhmäjäsenyyksiä
- sovelluspääsyjä
- access packageja
- admin-rooleja
- guest-käyttäjiä
- privileged access -oikeuksia

Access review on tärkeä, koska käyttäjän työtilanne muuttuu.

Käyttäjä voi:

- vaihtaa roolia
- vaihtaa osastoa
- siirtyä projektiin
- poistua projektista
- tuurata esihenkilöä
- palata vanhaan tehtävään
- lähteä organisaatiosta

Kaikissa näissä tilanteissa oikeudet eivät välttämättä poistu automaattisesti.

**Esimerkkitilanne:**  
Ankkalinna Oy tarkistaa neljännesvuosittain, ketkä kuuluvat ryhmään `Finance-Reports-Read`.

Reviewer näkee listan käyttäjistä.

Hän hyväksyy ne, jotka tarvitsevat pääsyn edelleen, ja poistaa ne, joilla ei ole enää tarvetta.

Tarkistuksessa huomataan, että Hannu Hanhi sai pääsyn viime kesän projektia varten, mutta projekti päättyi jo kuukausia sitten.

Hannun pääsy poistetaan.

**Tekninen huomio:**  
Access review on hyvä vain, jos revieweri ymmärtää mitä hän tarkistaa. Pelkkä listan hyväksyminen silmät kiinni ei ole governancea.

**Riski:**  
Jos access reviewitä ei tehdä, access drift ja role creep kasvavat hiljaa taustalla.

**Elikkäs:**  
Access review on käyttöoikeuksien siivouspäivä. Katsotaan kuka tarvitsee oikeuden vielä oikeasti.

---

## Access Certification

**Access Certification** - Virallisempi käyttöoikeuksien tarkastus ja vahvistus. Usein osa auditointia, compliancea tai governance-prosessia.

Access certification voi olla muodollisempi kuin tavallinen access review.

Siinä vastuuhenkilö vahvistaa, että käyttäjien oikeudet ovat edelleen hyväksyttäviä.

**Esimerkkitilanne:**  
Ankkalinna Oy valmistautuu auditointiin.

Finance Data Ownerin pitää vahvistaa, että talousjärjestelmän käyttäjillä on oikeat käyttöoikeudet.

Hän käy läpi käyttäjälistan, roolit ja poikkeukset.

Lopuksi hän certifioi, että oikeudet on tarkistettu.

**Tekninen huomio:**  
Certificationissa tärkeää on todistettavuus. Pitää jäädä jälki siitä, kuka tarkisti, milloin tarkisti ja mitä päätettiin.

**Riski:**  
Jos certification tehdään vain muodollisesti ilman todellista tarkistusta, se antaa väärän turvallisuuden tunteen.

**Elikkäs:**  
Access certification on virallisempi käyttöoikeuksien vahvistus. Se on audit trailin kannalta tärkeä.

---

## Reviewer

**Reviewer** - Henkilö, joka tarkistaa käyttöoikeudet access reviewissä tai certification-prosessissa.

Reviewer voi olla esimerkiksi:

- esihenkilö
- järjestelmän omistaja
- data owner
- ryhmän omistaja
- projektin omistaja
- tietoturvatiimin jäsen

Hyvä reviewer on henkilö, joka oikeasti ymmärtää, tarvitseeko käyttäjä kyseisen oikeuden.

**Esimerkkitilanne:**  
Ankkalinna Oy tekee access reviewn HR SharePoint -sivuston käyttäjistä.

Paras reviewer ei välttämättä ole IT-tuki, koska IT ei tiedä kuka saa nähdä HR-dataa.

Parempi reviewer voi olla HR Data Owner tai HR-tiimin vastuuhenkilö.

**Tekninen huomio:**  
Reviewer kannattaa valita resurssin ja riskin perusteella. Kaikki reviewt eivät kuulu samalle ihmiselle.

**Riski:**  
Jos väärä henkilö tarkistaa oikeuksia, hän voi hyväksyä oikeuksia ymmärtämättä niiden merkitystä.

**Elikkäs:**  
Reviewer on käyttöoikeuksien tarkistaja. Tarkistajan pitää tietää, mitä hän tarkistaa.

---

## Self-Review

**Self-Review** - Käyttäjä tarkistaa itse omat oikeutensa.

Self-review voi olla hyödyllinen joissain tilanteissa, mutta se ei sovi kaikkiin oikeuksiin.

Käyttäjä voi tietää, mitä hän käyttää arjessa, mutta hän ei välttämättä ymmärrä oikeuksiensa riskiä kokonaisuutena.

**Esimerkkitilanne:**  
Aku saa listan omista sovelluspääsyistään ja häntä pyydetään kertomaan, tarvitseeko hän niitä edelleen.

Aku voi sanoa, ettei hän enää käytä vanhaa projektisovellusta.

Tämän perusteella oikeus voidaan poistaa.

Mutta jos kyse on palkkatietojen tai admin-roolien tarkistuksesta, pelkkä self-review ei todennäköisesti riitä.

**Tekninen huomio:**  
Self-review voi täydentää muuta tarkistusta, mutta korkean riskin oikeudet kannattaa tarkistaa omistajan tai esihenkilön toimesta.

**Riski:**  
Käyttäjä voi hyväksyä omat oikeutensa varmuuden vuoksi, vaikka ei oikeasti tarvitse niitä.

**Elikkäs:**  
Self-reviewssä käyttäjä katsoo omat oikeutensa. Hyödyllinen apu, mutta ei aina riittävä kontrolli.

---

## Manager Review

**Manager Review** - Esihenkilö tarkistaa työntekijän käyttöoikeudet.

Manager review perustuu siihen, että esihenkilön pitäisi tietää, mitä työntekijä tarvitsee työssään.

Käytännössä tämä on välillä hankalaa, koska esihenkilö ei aina ymmärrä järjestelmien oikeustasoja tai teknisiä rooleja.

**Esimerkkitilanne:**  
Ankkalinna Oy pyytää esihenkilöitä tarkistamaan alaistensa käyttöoikeudet.

Esihenkilö näkee, että Hupu kuuluu ryhmiin:

- `Production-Users`
- `Finance-Reports-Read`
- `Project-X-Admin`

Jos esihenkilö ei tiedä, mitä nämä ryhmät tarkoittavat, hän voi hyväksyä ne vain varmuuden vuoksi.

Parempi review näyttää myös selkokielisen kuvauksen:

- tuotannon peruskäyttö
- lukuoikeus talousraportteihin
- admin-oikeus vanhaan projektiin

Nyt esihenkilö voi oikeasti arvioida tarvetta.

**Tekninen huomio:**  
Manager review toimii paremmin, jos oikeudet on nimetty ja kuvattu selkeästi.

**Riski:**  
Esihenkilö voi hyväksyä liikaa, jos hän ei ymmärrä oikeuksien merkitystä tai pelkää estävänsä työntekoa.

**Elikkäs:**  
Manager review on hyvä, jos esihenkilö ymmärtää mitä hyväksyy. Muuten se on vain “joo joo hyväksyn kaikki” -näytelmä.

---

## Resource Owner Review

**Resource Owner Review** - Resurssin omistaja tarkistaa, ketkä saavat käyttää tiettyä resurssia.

Tämä on usein parempi malli kuin pelkkä manager review silloin, kun resurssi sisältää arkaluontoista dataa tai erityisiä käyttöoikeuksia.

Resource owner voi ymmärtää paremmin:

- mitä dataa resurssi sisältää
- mitkä roolit ovat riskialttiita
- ketkä tarvitsevat oikeasti pääsyn
- mitä poikkeuksia voidaan hyväksyä
- kuka ei enää kuulu käyttäjäjoukkoon

**Esimerkkitilanne:**  
Ankkalinna Oy:n palkkaraportteja hallinnoi HR Data Owner.

Kun palkkaraporttien käyttöoikeuksia tarkistetaan, HR Data Owner arvioi, kenellä pitää olla pääsy.

Hän huomaa, että yksi vanha projektikäyttäjä on edelleen listalla, vaikka projekti on päättynyt.

Oikeus poistetaan.

**Tekninen huomio:**  
Resource owner review sopii hyvin korkeamman riskin resursseille, joissa esihenkilö ei välttämättä tunne datan sisältöä yhtä hyvin.

**Riski:**  
Jos resurssin omistajaa ei ole määritelty, kukaan ei tunne vastuuta oikeuksien tarkistamisesta.

**Elikkäs:**  
Resource owner review tarkoittaa, että resurssin omistaja tarkistaa käyttäjät. Se on usein järkevämpää kuin kysyä IT:ltä, kuka saa nähdä liiketoiminnan dataa.

---

## Access Lifecycle

**Access Lifecycle** - Käyttöoikeuden elinkaari alusta loppuun.

Access lifecycle sisältää esimerkiksi:

- käyttöoikeuden tarpeen
- pyynnön
- hyväksynnän
- myöntämisen
- käytön
- tarkistamisen
- muuttamisen
- vanhenemisen
- poistamisen

Hyvä IAM ei ajattele käyttöoikeutta vain lisäyshetkellä.

Se ajattelee koko elinkaaren.

**Esimerkkitilanne:**  
Iines saa pääsyn projektiin.

Hyvä access lifecycle voisi mennä näin:

1. Iines tarvitsee pääsyn projektiin.
2. Esihenkilö tai projektin omistaja tekee pyynnön.
3. Project Owner hyväksyy pyynnön.
4. Iines saa access packagen.
5. Pääsy on voimassa 90 päivää.
6. Ennen päättymistä pääsy tarkistetaan.
7. Jos tarve jatkuu, pääsy uusitaan.
8. Jos tarve päättyy, oikeudet poistuvat.

**Tekninen huomio:**  
Access lifecycle on helpompi hallita, jos oikeudet annetaan ryhmien, access packagejen ja automaation kautta eikä satunnaisina käsimuutoksina.

**Riski:**  
Jos elinkaarta ei ole, oikeudet jäävät elämään omaa elämäänsä käyttäjän mukana.

**Elikkäs:**  
Access lifecycle tarkoittaa, että oikeudella on alku, keskikohta ja loppu. Oikeuden ei pitäisi jäädä ikuiseksi vain siksi, että se kerran annettiin.

---

## Temporary Access

**Temporary Access** - Määräaikainen käyttöoikeus. Oikeus annetaan vain tiettyä aikaa tai tiettyä tehtävää varten.

Temporary access on tärkeä erityisesti projekteissa, sijaisuuksissa, auditoinneissa ja poikkeustilanteissa.

**Esimerkkitilanne:**  
Hannu Hanhi tuuraa esihenkilöä kahden viikon kesäloman ajan.

Hän tarvitsee pääsyn hyväksyntäraportteihin.

Pääsy annetaan määräajaksi kahdeksi viikoksi.

Kun sijaisuus päättyy, oikeus poistuu automaattisesti tai menee tarkistukseen.

Huono vaihtoehto olisi antaa Hannulle oikeus käsin ja unohtaa se puoleksi vuodeksi.

**Tekninen huomio:**  
Temporary access kannattaa toteuttaa päättymispäivällä, PIM:llä, access packagella tai muulla hallitulla mallilla.

**Riski:**  
Väliaikainen oikeus muuttuu helposti pysyväksi, jos sillä ei ole päättymispäivää.

**Elikkäs:**  
Temporary access on “saat tämän siksi aikaa kun tarvitset”. Ei “saat tämän ja katsotaan joskus vuonna nakki”.

---

## Expiration

**Expiration** - Käyttöoikeuden päättymisaika. Määrittää, milloin oikeus vanhenee tai poistuu.

Expiration auttaa estämään oikeuksien unohtumista.

Sitä voidaan käyttää esimerkiksi:

- access packageissa
- guest-käyttäjien pääsyissä
- projektioikeuksissa
- väliaikaisissa rooleissa
- PIM-aktivoinneissa

**Esimerkkitilanne:**  
Ankkalinna Oy antaa ulkoiselle auditoijalle pääsyn talousmateriaaleihin 30 päiväksi.

Pääsylle asetetaan expiration.

Kun 30 päivää päättyy, oikeus poistuu tai vaatii uuden hyväksynnän.

**Tekninen huomio:**  
Expiration ei poista tarvetta tarkistaa oikeuksia, mutta se auttaa vähentämään unohtuneita pääsyjä.

**Riski:**  
Jos oikeuksilla ei ole päättymistä, ne voivat jäädä voimaan kauan sen jälkeen kun tarve loppui.

**Elikkäs:**  
Expiration on käyttöoikeuden viimeinen voimassaolopäivä. Ilman sitä oikeus voi jäädä kummittelemaan.

---

## Access Drift

**Access Drift** - Tilanne, jossa käyttäjälle kertyy ajan mittaan oikeuksia, joita hän ei enää tarvitse.

Access drift syntyy usein hiljaa.

Käyttäjälle lisätään oikeuksia uusien tehtävien, projektien tai sijaisuuksien vuoksi, mutta vanhoja ei poisteta.

**Esimerkkitilanne:**  
Aku Ankka on ollut Ankkalinna Oy:ssä kymmenen vuotta.

Hän on ollut:

- tuotannossa
- hallinnossa
- projektissa
- esihenkilön sijaisena
- takaisin tuotannossa

Jokaisesta vaiheesta on jäänyt joitain oikeuksia.

Kun kukaan ei ole siivonnut niitä, Akulla on paljon enemmän pääsyjä kuin nykyinen työ vaatii.

**Tekninen huomio:**  
Access reviewt, mover-prosessit ja expiration auttavat vähentämään access driftia.

**Riski:**  
Access drift kasvattaa väärinkäytön, vahingon ja tietovuodon riskiä.

**Elikkäs:**  
Access drift tarkoittaa, että oikeudet ajelehtivat käyttäjän mukana, vaikka työtehtävä on jo muuttunut.

---

## Role Creep

**Role Creep** - Tilanne, jossa käyttäjälle kertyy vähitellen liikaa rooleja tai käyttöoikeuksia.

Role creep on hyvin lähellä access driftia.

Ero on lähinnä siinä, että role creep korostaa roolien ja oikeuksien kertymistä ajan mukana.

**Esimerkkitilanne:**  
Iines saa ensin HR Reader -roolin.

Myöhemmin hän saa HR Editor -roolin projektia varten.

Sitten hän saa Approver-roolin sijaisuutta varten.

Projektit päättyvät, mutta roolit jäävät.

Vuoden päästä Iineksellä on edelleen useita HR-rooleja, vaikka hän tarvitsee vain yhden.

**Tekninen huomio:**  
Role creep on erityisen hankala, jos roolit ovat huonosti nimettyjä tai niiden sisältöä ei ymmärretä.

**Riski:**  
Liialliset roolit rikkovat least privilege -periaatetta.

**Elikkäs:**  
Role creep on oikeuksien hiipivä lihominen. Ensin vähän, sitten vähän lisää ja kohta käyttäjällä on koko buffet-lautanen.

---

## Orphaned Access

**Orphaned Access** - Käyttöoikeus, jolla ei ole enää selkeää perustetta, omistajaa tai aktiivista tarvetta.

Orphaned access voi liittyä esimerkiksi:

- vanhaan projektiin
- poistuneeseen esihenkilöön
- omistajattomaan ryhmään
- käyttämättömään sovellukseen
- vanhaan access packageen
- manuaalisesti annettuun oikeuteen, jota kukaan ei enää muista

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä on ryhmä `Project-X-Admins`.

Projektia X ei ole ollut olemassa kolmeen vuoteen.

Ryhmällä on silti pääsy SharePoint-sivustoon ja sovellukseen.

Kukaan ei tiedä, kuka ryhmän omistaa tai miksi käyttäjät ovat siellä.

**Tekninen huomio:**  
Orphaned access löytyy usein access reviewiden, omistajuustarkistusten ja ryhmäsiivouksen kautta.

**Riski:**  
Omistajaton oikeus voi jäädä voimaan ilman valvontaa.

**Elikkäs:**  
Orphaned access on käyttöoikeus ilman selkeää kotia, omistajaa tai syytä. Se pitää selvittää tai poistaa.

---

## Dormant Account

**Dormant Account** - Käyttämätön tili. Tili, jota ei ole käytetty pitkään aikaan, mutta joka voi silti olla aktiivinen.

Dormant account voi olla esimerkiksi:

- vanha käyttäjätili
- testitili
- palvelutili
- projektitili
- guest-käyttäjä
- entisen työntekijän tili, joka ei mennyt kiinni oikein

**Esimerkkitilanne:**  
Ankkalinna Oy:n lokit näyttävät, että erästä guest-käyttäjätiliä ei ole käytetty 180 päivään.

Tili on silti aktiivinen ja sillä on pääsy vanhaan projektin SharePointiin.

Tämä pitää tarkistaa.

**Tekninen huomio:**  
Dormant account ei aina tarkoita, että tili pitää heti poistaa. Mutta se pitää arvioida.

**Riski:**  
Käyttämätön aktiivinen tili voi olla hyökkääjälle hiljainen sisäänkäynti.

**Elikkäs:**  
Dormant account on tili, joka nukkuu mutta ei ole kuollut. Ja se on juuri se ongelma.

---

## Orphaned Account

**Orphaned Account** - Orpo tili. Käyttäjätili, jolla ei ole enää selvää omistajaa, aktiivista käyttäjää tai perusteltua tarvetta.

Orphaned account voi syntyä esimerkiksi, kun:

- työntekijä lähtee mutta tili jää aktiiviseksi
- palvelutilin omistaja vaihtaa työpaikkaa
- projekti päättyy mutta tili jää
- guest-käyttäjän yhteistyö loppuu
- HR- tai IAM-prosessi epäonnistuu

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä on tili `project.automation@ankkalinna.fi`.

Tiliä käytettiin vanhassa integraatiossa.

Integraation omistaja on lähtenyt talosta, eikä kukaan tiedä käyttääkö tiliä enää mikään.

Tili on edelleen aktiivinen.

**Tekninen huomio:**  
Orphaned accountit kannattaa yhdistää omistajuuden, kirjautumishistorian ja käyttöoikeuksien tarkistukseen.

**Riski:**  
Orpo tili voi sisältää oikeuksia, joita kukaan ei enää valvo.

**Elikkäs:**  
Orphaned account on tili ilman selvää vastuuhenkilöä. Jos kukaan ei omista sitä, kukaan ei myöskään huomaa jos sitä käytetään väärin.

---

## Lifecycle Workflows

**Lifecycle Workflows** - Microsoft Entra ID Governance -ominaisuus, jolla voidaan automatisoida käyttäjän elinkaaren vaiheita.

Lifecycle Workflows voi auttaa joiner-, mover- ja leaver-prosesseissa.

Niiden avulla voidaan käynnistää tehtäviä esimerkiksi silloin, kun:

- uusi työntekijä aloittaa
- käyttäjän rooli muuttuu
- käyttäjän osasto muuttuu
- työntekijän viimeinen työpäivä lähestyy
- käyttäjä lähtee organisaatiosta

**Esimerkkitilanne:**  
Ankkalinna Oy käyttää HR-järjestelmän tietoa työntekijän aloitus- ja lopetuspäivistä.

Kun uusi työntekijä aloittaa, workflow voi käynnistää aloitukseen liittyviä tehtäviä.

Kun työntekijä lähtee, workflow voi käynnistää pääsyn poistamiseen liittyviä tehtäviä.

**Tekninen huomio:**  
Workflow on vain niin hyvä kuin sen käyttämä data. Jos HR-data on väärin, workflow voi tehdä väärän asian oikeaan aikaan. Eli teknisesti hienoa, käytännössä katastrofi.

**Riski:**  
Automaatio voi nopeuttaa virheitä, jos prosessin logiikka tai lähdedata on huono.

**Elikkäs:**  
Lifecycle Workflows automatisoi käyttäjän elinkaaren tehtäviä. Hyvä data sisään, hyvä automaatio ulos. Roska sisään, roihu ulos.

---

## Joiner Workflow

**Joiner Workflow** - Työnkulku, joka liittyy uuden käyttäjän aloittamiseen organisaatiossa.

Joiner-prosessissa voidaan hallita esimerkiksi:

- käyttäjätilin luonti
- perustietojen täydennys
- lisenssit
- perusoikeudet
- aloitusviestit
- esihenkilön ilmoitukset
- access package -ohjaus
- ensimmäiset tarkistukset

**Esimerkkitilanne:**  
Tupu Ankka aloittaa Ankkalinna Oy:ssä tuotannon työntekijänä.

Joiner workflow voi auttaa varmistamaan, että Tupulle annetaan tuotannon perusoikeudet, ei vahingossa hallinnon tai talouspuolen oikeuksia.

Pääsyjen pitäisi perustua esimerkiksi Tupun rooliin, osastoon ja toimipisteeseen.

**Tekninen huomio:**  
Joiner-prosessissa on iso riski siinä, että oikeudet kopioidaan toiselta käyttäjältä tarkistamatta.

**Riski:**  
Jos uudelle käyttäjälle annetaan “samat oikeudet kuin Akulla”, hän voi saada Akun vanhat ja turhat oikeudet mukana.

**Elikkäs:**  
Joiner workflow auttaa uuden käyttäjän aloituksessa. Tärkeintä ei ole antaa paljon oikeuksia nopeasti, vaan oikeat oikeudet hallitusti.

---

## Mover Workflow

**Mover Workflow** - Työnkulku, joka liittyy käyttäjän roolin, osaston, tiimin tai tehtävän muutokseen.

Mover on usein vaikeampi kuin joiner tai leaver, koska käyttäjä ei poistu organisaatiosta.

Hän vain vaihtaa paikkaa talon sisällä.

Mover-prosessissa pitäisi hoitaa sekä:

- uusien oikeuksien lisääminen
- vanhojen oikeuksien poistaminen

**Esimerkkitilanne:**  
Iines siirtyy hallinnosta tuotantoon.

Hän tarvitsee uudet tuotannon järjestelmäoikeudet.

Samalla pitää tarkistaa, tarvitseeko hän enää hallinnon SharePoint-pääsyjä, raportteja tai HR-järjestelmän oikeuksia.

Jos vain uudet oikeudet lisätään, mutta vanhoja ei poisteta, Iinekselle kertyy liikaa pääsyjä.

**Tekninen huomio:**  
Mover-prosessi vaatii hyvää HR-dataa ja selkeää mallia siitä, mitkä oikeudet kuuluvat mihinkin rooliin.

**Riski:**  
Mover on access driftin lempikasvualusta. Kaikki lisäävät uutta, kukaan ei poista vanhaa.

**Elikkäs:**  
Mover workflow ei ole vain “lisää uudet oikeudet”. Se on myös “poista vanhat oikeudet”.

---

## Leaver Workflow

**Leaver Workflow** - Työnkulku, joka liittyy käyttäjän poistumiseen organisaatiosta.

Leaver-prosessissa varmistetaan, että käyttäjän pääsyt poistuvat hallitusti.

Leaver-prosessiin voi kuulua esimerkiksi:

- tilin disableointi
- kirjautumisen estäminen
- istuntojen katkaisu
- ryhmäjäsenyyksien poistaminen
- lisenssien poistaminen
- postilaatikon käsittely
- OneDrive- ja tiedosto-omistajuuden käsittely
- laitteiden palautus
- guest-oikeuksien poisto
- admin-roolien poisto
- sovelluspääsyjen poistaminen

**Esimerkkitilanne:**  
Hannu Hanhi lähtee Ankkalinna Oy:stä.

HR-järjestelmässä hänen viimeinen työpäivänsä merkitään oikein.

Leaver workflow käynnistyy ja varmistaa, että Hannun käyttäjätili menee disableen, ryhmäjäsenyydet poistuvat ja pääsy pilvipalveluihin katkeaa.

Jos HR-tieto on väärin tai workflow epäonnistuu, Hannun tili voi jäädä auki.

**Tekninen huomio:**  
Leaver-prosessissa pitää huomioida myös poikkeukset, kuten jatkettu työsuhde, konsultiksi siirtyminen tai tarve säilyttää postilaatikko hallitusti.

**Riski:**  
Lähteneen työntekijän aktiivinen tili on yksi klassisimmista ja typerimmistä riskeistä. Ei glamouria, vain huono prosessi.

**Elikkäs:**  
Leaver workflow varmistaa, että lähtijän pääsyt poistuvat. Käyttäjän lähtö ei saa jäädä pelkän muistin varaan.

---

## Separation of Duties

**Separation of Duties** - Työtehtävien eriyttäminen. Sama henkilö ei saa hallita koko riskialtista prosessia yksin.

Tällä pyritään estämään väärinkäytöksiä ja virheitä.

Separation of Duties voidaan lyhentää SoD.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä sama henkilö ei saisi sekä luoda uutta maksunsaajaa järjestelmään että hyväksyä maksua tälle maksunsaajalle.

Käytännössä tämä tarkoittaa:

- yksi henkilö voi lisätä yrityksen tai henkilön, jolle maksetaan
- toinen henkilö hyväksyy maksun
- sama henkilö ei tee molempia vaiheita yksin

Näin vähennetään riskiä, että joku loisi tekaistun maksunsaajan ja hyväksyisi maksun itse.

**Tekninen huomio:**  
SoD voi olla tekninen kontrolli, prosessikontrolli tai molempia. Järjestelmä voi estää ristiriitaiset roolit, tai prosessi voi vaatia toisen henkilön hyväksynnän.

**Riski:**  
Jos yhdellä henkilöllä on liikaa valtaa, väärinkäytöksen tai virheen riski kasvaa.

**Elikkäs:**  
Separation of Duties tarkoittaa, ettei yksi ihminen saa pitää koko riskiketjua omissa käsissään.

---

## Audit Trail

**Audit Trail** - Lokijälki tai tapahtumaketju siitä, kuka teki mitä, milloin ja missä järjestelmässä.

Audit trail on tärkeä, koska jälkikäteen pitää voida selvittää:

- kuka pyysi oikeutta
- kuka hyväksyi oikeuden
- kuka toteutti muutoksen
- milloin muutos tehtiin
- mitä oikeuksia annettiin
- mitä oikeuksia poistettiin
- mitä käyttäjä teki oikeudella
- milloin oikeus tarkistettiin

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä huomataan, että Hannu Hanhi on saanut pääsyn talousraportteihin.

Audit trailista voidaan tarkistaa:

- milloin pääsy annettiin
- kuka pyysi sitä
- kuka hyväksyi sen
- mitä ryhmää tai access packagea käytettiin
- onko pääsy ollut access reviewissä
- kuka hyväksyi oikeuden jatkumisen

Jos mitään jälkeä ei löydy, käyttöoikeuden perusteltavuus on heikko.

**Tekninen huomio:**  
Audit trail ei ole vain auditointia varten. Se auttaa myös vianhaussa, tietoturvatutkinnassa ja prosessien parantamisessa.

**Riski:**  
Ilman lokijälkeä käyttöoikeuksien hallinta muuttuu “no joku joskus varmaan antoi tämän” -tasoiseksi arvaukseksi.

**Elikkäs:**  
Audit trail on käyttöoikeuksien kuittivihko. Se kertoo, kuka teki mitä ja milloin.
