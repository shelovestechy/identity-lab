# 06 - Conditional Access

Tämä sivu kokoaa Microsoft Entra ID:n Conditional Access -ajatteluun liittyviä käsitteitä.

Tavoite on ymmärtää, että pääsynhallinta ei ole vain kysymys:

> “Onko käyttäjällä oikea salasana?”

Modernissa ympäristössä pitää kysyä paljon enemmän:

- kuka käyttäjä on?
- mihin sovellukseen hän yrittää päästä?
- mistä sijainnista kirjautuminen tulee?
- millä laitteella käyttäjä kirjautuu?
- onko laite hallittu?
- onko laite compliant?
- onko kirjautuminen riskialtis?
- tarvitaanko MFA?
- pitääkö pääsy estää kokonaan?
- voiko pääsyn sallia vain rajoitettuna?

Conditional Access on yksi Microsoft Entra ID:n tärkeimmistä suojausominaisuuksista, koska se tekee kirjautumisesta tilannekohtaista.

Kaikkia kirjautumisia ei kohdella samalla tavalla. Ja hyvä niin.

---

## Contents

- [Conditional Access](#conditional-access)
- [Conditional Access Policy](#conditional-access-policy)
- [Assignments](#assignments)
- [Users and Groups](#users-and-groups)
- [Target Resources](#target-resources)
- [Cloud Apps](#cloud-apps)
- [Conditions](#conditions)
- [Named Location](#named-location)
- [Trusted Location](#trusted-location)
- [Device Platform](#device-platform)
- [Client Apps](#client-apps)
- [Sign-in Risk](#sign-in-risk)
- [User Risk](#user-risk)
- [Grant Controls](#grant-controls)
- [Block Access](#block-access)
- [Require MFA](#require-mfa)
- [Require Compliant Device](#require-compliant-device)
- [Require Hybrid Joined Device](#require-hybrid-joined-device)
- [Session Controls](#session-controls)
- [Report-only Mode](#report-only-mode)
- [Exclude Users](#exclude-users)
- [Break Glass Account](#break-glass-account)
- [Policy Gap](#policy-gap)
- [Policy Conflict](#policy-conflict)
- [What If Tool](#what-if-tool)
- [Sign-in Logs](#sign-in-logs)

---

## Conditional Access

**Conditional Access** - Ehdollinen pääsynhallinta. Sen avulla Microsoft Entra ID voi sallia, estää tai rajoittaa pääsyä tilanteen perusteella.

Conditional Access vastaa kysymykseen:

> Millä ehdoilla käyttäjä saa pääsyn?

Ehdot voivat liittyä esimerkiksi käyttäjään, sovellukseen, sijaintiin, laitteeseen, riskiin tai kirjautumistapaan.

Conditional Access ei ole pelkkä MFA-asetus. MFA on vain yksi mahdollinen kontrolli.

Conditional Accessilla voidaan esimerkiksi:

- vaatia MFA tietyissä tilanteissa
- estää kirjautuminen tietyistä maista
- sallia pääsy vain hallituilta laitteilta
- estää legacy authentication
- vaatia compliant device
- rajoittaa istuntoa selainkäytössä
- vaatia vahvempaa tunnistautumista korkean riskin kirjautumisissa
- estää pääsy tietyille käyttäjäryhmille tai sovelluksiin

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa suojata talousraportit.

Pelkkä salasana ei riitä, koska raportit sisältävät arkaluontoista tietoa.

Ankkalinna Oy tekee Conditional Access -säännön:

- kohde: `Finance Reports` -sovellus
- käyttäjät: taloushallinnon käyttäjät
- ehto: pääsy ulkoverkosta
- vaatimus: MFA ja compliant device

Kun Roope Ankka kirjautuu työläppäriltään, joka on compliant, ja hyväksyy MFA:n, pääsy sallitaan.

Kun Roope yrittää kirjautua samalle sovellukselle vanhalta kotikoneelta, pääsy estetään tai rajoitetaan.

**Tekninen huomio:**  
Conditional Access toimii päätöksentekokerroksena kirjautumisen yhteydessä. Se ei korvaa sovelluksen omia oikeuksia, ryhmäjäsenyyksiä tai lisenssejä, vaan toimii niiden rinnalla.

**Riski:**  
Huonosti suunniteltu Conditional Access voi joko päästää liikaa läpi tai lukita oikeat käyttäjät ulos. Molemmat ovat huonoja. Toinen on tietoturvariski, toinen on maanantaiaamun tukitikettitulva.

**Elikkäs:**  
Conditional Access tarkoittaa, että pääsy riippuu tilanteesta. Oikea käyttäjä ei yksin riitä, jos sijainti, laite tai riski näyttää väärältä.

---

## Conditional Access Policy

**Conditional Access Policy** - Sääntö, joka määrittää milloin pääsy sallitaan, estetään tai vaatii lisäehtoja.

Policy koostuu yleensä kolmesta pääajatuksesta:

1. **Kenelle sääntö koskee**
2. **Mihin sovellukseen tai resurssiin sääntö koskee**
3. **Mitä pääsyn ehtoja tai vaatimuksia käytetään**

Conditional Access Policy voi esimerkiksi sanoa:

> Jos käyttäjä kuuluu taloushallintoon ja yrittää käyttää talousraportteja hallitsemattomalta laitteelta, estä pääsy.

Tai:

> Jos käyttäjä kirjautuu ulkomailta, vaadi MFA.

**Esimerkkitilanne:**  
Ankkalinna Oy tekee Conditional Access Policyn nimeltä:

`CA - Require MFA for Admin Roles`

Sääntö koskee käyttäjiä, joilla on admin-rooleja.

Kun admin yrittää kirjautua Microsoft Admin Centeriin, hänen pitää suorittaa MFA.

Jos MFA ei onnistu, pääsyä ei anneta.

**Tekninen huomio:**  
Policyjen nimeämiskäytäntö on tärkeä. Hyvä nimi kertoo heti, mitä sääntö tekee. Esimerkiksi `CA - Block Legacy Authentication` on paljon parempi kuin `Policy 7`.

**Riski:**  
Jos policyjä on paljon ja nimet ovat sekavia, kukaan ei enää tiedä mikä sääntö tekee mitä. Sitten pelätään koskea mihinkään ja ympäristö alkaa muistuttaa johtosotkua telkkarin takana.

**Elikkäs:**  
Conditional Access Policy on pääsyn ehtosääntö. Se kertoo: kenelle, mihin, milloin ja millä vaatimuksilla.

---

## Assignments

**Assignments** - Conditional Access -säännön kohdistukset. Ne määrittävät, ketkä ja mitkä resurssit kuuluvat säännön piiriin.

Assignments-kohdassa voidaan määritellä esimerkiksi:

- käyttäjät
- ryhmät
- roolit
- guest-käyttäjät
- cloud apps
- käyttäjän toiminto
- authentication context

Ilman oikeaa kohdistusta policy ei tee sitä mitä sen pitäisi.

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa vaatia MFA:n kaikilta admin-rooleilta.

Policy kohdistetaan admin-rooleihin, ei vain yksittäisiin käyttäjiin.

Tämä on parempi, koska jos uusi henkilö saa admin-roolin myöhemmin, hän kuuluu automaattisesti säännön piiriin.

**Tekninen huomio:**  
Assignments on yksi yleisimmistä paikoista, jossa Conditional Access -virheitä tehdään. Jos kohdistus on väärä, sääntö voi osua vääriin käyttäjiin tai jättää tärkeät käyttäjät suojaamatta.

**Riski:**  
Jos adminit unohdetaan pois MFA-policyltä, juuri tärkeimmät tunnukset voivat jäädä heikommin suojatuiksi.

**Elikkäs:**  
Assignments kertoo, keihin ja mihin sääntö osuu. Jos kohdistus menee pieleen, koko policy voi olla joko hyödytön tai vaarallinen.

---

## Users and Groups

**Users and Groups** - Conditional Access -kohdistus, jolla määritetään, ketkä käyttäjät tai ryhmät kuuluvat sääntöön.

Policy voidaan kohdistaa esimerkiksi:

- kaikkiin käyttäjiin
- tiettyihin käyttäjiin
- tiettyihin ryhmiin
- tiettyihin admin-rooleihin
- guest- tai external users -käyttäjiin

Usein policyjä kannattaa kohdistaa ryhmiin tai rooleihin yksittäisten käyttäjien sijaan, koska se on hallittavampaa.

**Esimerkkitilanne:**  
Ankkalinna Oy tekee policy-säännön, joka vaatii MFA:n kaikilta ulkoisilta käyttäjiltä.

Kohdistus tehdään guest-käyttäjiin.

Kun Kopla Turva Oy:n konsultti Taikaviitta kirjautuu Ankkalinnan SharePointiin, häneltä vaaditaan MFA.

**Tekninen huomio:**  
Kaikki käyttäjät -kohdistus on tehokas mutta vaarallinen, jos excludeja ei ole mietitty. Erityisesti break glass -tilit pitää huomioida.

**Riski:**  
Jos policy kohdistetaan vahingossa kaikkiin käyttäjiin ilman poikkeuksia ja se estää kirjautumisen, organisaatio voi lukita itsensä ulos.

**Elikkäs:**  
Users and Groups määrittää, ketä sääntö koskee. Tässä kohtaa ei arvata, vaan suunnitellaan.

---

## Target Resources

**Target Resources** - Resurssit tai sovellukset, joihin Conditional Access -sääntö kohdistuu.

Aiemmin tästä puhuttiin usein Cloud Apps -kohdistuksena, mutta ajatus on sama: mihin käyttäjä yrittää päästä?

Target resource voi olla esimerkiksi:

- Microsoft 365
- Exchange Online
- SharePoint Online
- Teams
- Azure portal
- Enterprise Application
- Microsoft Graph
- tietty sovellus
- kaikki cloud apps

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa suojata vain HR-sovelluksen vahvemmalla ehdolla.

Policy kohdistetaan HR-sovellukseen, ei kaikkiin Microsoft-palveluihin.

Kun Iines kirjautuu HR-sovellukseen, häneltä vaaditaan compliant device.

Kun Iines kirjautuu tavalliseen Teams-keskusteluun, sama policy ei välttämättä koske sitä.

**Tekninen huomio:**  
Target resources kannattaa valita tarkasti. Kaikki cloud apps -kohdistus voi olla hyvä joissain perusturvapolicyissä, mutta se pitää testata huolellisesti.

**Riski:**  
Jos kriittinen sovellus unohtuu policyjen ulkopuolelle, käyttäjät voivat päästä siihen heikommilla ehdoilla kuin oli tarkoitus.

**Elikkäs:**  
Target resources vastaa kysymykseen: mihin sovellukseen tai palveluun pääsyä kontrolloidaan?

---

## Cloud Apps

**Cloud Apps** - Pilvisovellukset, joihin Conditional Access -sääntö voi kohdistua. Tämä voi tarkoittaa Microsoftin omia palveluita tai Entra ID:hen liitettyjä Enterprise Applicationeja.

Cloud app voi olla esimerkiksi:

- Office 365
- Microsoft Admin Portals
- SharePoint Online
- Exchange Online
- Teams
- Salesforce
- ServiceNow
- HR-järjestelmä
- raportointisovellus

**Esimerkkitilanne:**  
Ankkalinna Oy ottaa käyttöön ServiceNow’n SSO:n Microsoft Entra ID:n kautta.

Conditional Access -policy voidaan kohdistaa ServiceNow Enterprise Applicationiin.

Jos käyttäjä yrittää kirjautua ServiceNow’hun tuntemattomasta sijainnista, vaaditaan MFA.

**Tekninen huomio:**  
Jos sovellus ei käytä Entra ID:tä kirjautumiseen, Conditional Access ei välttämättä pysty kontrolloimaan sitä samalla tavalla.

**Riski:**  
Organisaatiolla voi olla sovelluksia, jotka ovat käytössä, mutta eivät ole kunnolla Entra ID:n tai SSO:n takana. Silloin niiden pääsynhallinta voi olla erillinen ja heikommin valvottu.

**Elikkäs:**  
Cloud Apps tarkoittaa sovelluksia, joiden käyttöön Conditional Access voidaan liittää. Jos sovellus ei kulje Entran kautta, Entra ei voi taikoa siihen kontrollia tyhjästä.

---

## Conditions

**Conditions** - Ehdot, joiden perusteella Conditional Access -sääntö arvioi kirjautumistilannetta.

Conditions voivat liittyä esimerkiksi:

- käyttäjän riskiin
- kirjautumisriskiin
- sijaintiin
- laitealustaan
- client appiin
- laitteen tilaan
- käyttäjän toimintaan

Conditionit auttavat tekemään pääsystä tilannekohtaista.

**Esimerkkitilanne:**  
Aku kirjautuu Microsoft 365:een tavalliselta työläppäriltään Joensuusta.

Tilanne näyttää normaalilta.

Myöhemmin Akun tunnuksella yritetään kirjautua toisesta maasta, oudolla selaimella ja ilman hallittua laitetta.

Conditional Access voi kohdella jälkimmäistä kirjautumista eri tavalla.

Se voi esimerkiksi vaatia MFA:n tai estää pääsyn kokonaan.

**Tekninen huomio:**  
Conditionit ovat hyödyllisiä, mutta liian monimutkainen ehtorakenne voi olla vaikea ylläpitää ja vianmäärittää.

**Riski:**  
Jos ehtoja ei ymmärretä, policy voi toimia eri tavalla kuin oli tarkoitus.

**Elikkäs:**  
Conditions ovat sääntöjen “jos tämä tapahtuu” -osa. Ne kertovat, millaisessa tilanteessa pääsyä arvioidaan tiukemmin.

---

## Named Location

**Named Location** - Microsoft Entra ID:ssä määritelty sijainti, kuten IP-osoitealue, maa tai alue.

Named locationia voidaan käyttää Conditional Access -säännöissä.

Named location voi olla esimerkiksi:

- toimiston julkinen IP-osoite
- VPN:n IP-alue
- luotettu verkko
- maa tai alue, josta kirjautumisia sallitaan
- maa tai alue, josta kirjautumisia estetään

**Esimerkkitilanne:**  
Ankkalinna Oy määrittää Joensuun toimiston IP-osoitteen named locationiksi nimellä:

`Office - Joensuu`

Conditional Access -policy voi sanoa:

- jos kirjautuminen tulee Joensuun toimistolta, vaadi normaali MFA
- jos kirjautuminen tulee tuntemattomasta sijainnista, vaadi vahvempi kontrolli
- jos kirjautuminen tulee maasta, jossa organisaatiolla ei ole toimintaa, estä pääsy

**Tekninen huomio:**  
IP-pohjainen sijainti ei ole täydellinen totuus. VPN:t, mobiiliverkot ja pilvipalvelut voivat tehdä sijainnin tulkinnasta sotkuista.

**Riski:**  
Jos named location määritellään väärin, organisaatio voi luottaa väärään verkkoon tai estää oikeita käyttäjiä.

**Elikkäs:**  
Named location on nimetty sijainti, jota voidaan käyttää pääsysäännöissä. Se auttaa sanomaan: tämä verkko tunnetaan, tuo toinen ei.

---

## Trusted Location

**Trusted Location** - Sijainti, jota organisaatio pitää luotettavampana kuin tuntematonta sijaintia.

Trusted location voi olla esimerkiksi organisaation oma toimistoverkko tai VPN.

Trusted locationia voidaan käyttää Conditional Access -säännöissä keventämään tai tarkentamaan vaatimuksia.

**Esimerkkitilanne:**  
Ankkalinna Oy pitää omaa toimiston IP-osoitetta trusted locationina.

Kun käyttäjä kirjautuu toimistolta, kirjautuminen voidaan katsoa pienemmän riskin tilanteeksi kuin tuntemattomasta verkosta.

Tämä ei tarkoita, että toimistolta kirjautuva käyttäjä olisi automaattisesti turvallinen.

Se tarkoittaa vain, että sijainti on yksi luottamusta lisäävä signaali.

**Tekninen huomio:**  
Zero Trust -ajattelussa edes trusted location ei tarkoita “luota aina”. Se on vain yksi signaali muiden joukossa.

**Riski:**  
Jos trusted locationiin luotetaan liikaa, hyökkääjä voi saada etua, jos hän pääsee samaan verkkoon tai käyttää väärin VPN-yhteyttä.

**Elikkäs:**  
Trusted location on hieman luotetumpi sijainti, ei maaginen turvakupla.

---

## Device Platform

**Device Platform** - Laitteen käyttöjärjestelmä tai alustatyyppi, jota Conditional Access voi käyttää ehtona.

Device platform voi olla esimerkiksi:

- Windows
- macOS
- iOS
- Android
- Linux

Tämän avulla voidaan tehdä erilaisia sääntöjä eri laitteille.

**Esimerkkitilanne:**  
Ankkalinna Oy sallii sähköpostin mobiilikäytön vain iOS- ja Android-laitteilla, jotka käyttävät hyväksyttyä Outlook-sovellusta.

Windows-laitteille taas voidaan vaatia compliant device.

**Tekninen huomio:**  
Device platform -tieto voi riippua siitä, miten kirjautuminen tapahtuu ja mitä tietoa Entra saa laitteesta.

**Riski:**  
Jos sääntö perustuu pelkkään device platformiin, se ei yksin kerro onko laite turvallinen.

**Elikkäs:**  
Device platform kertoo, millaiselta laitteelta käyttäjä kirjautuu. Windows, iPhone ja Android eivät ole sama asia pääsynhallinnan näkökulmasta.

---

## Client Apps

**Client Apps** - Sovellustyyppi tai kirjautumistapa, jolla käyttäjä yrittää käyttää palvelua.

Client app voi liittyä esimerkiksi siihen, käyttääkö käyttäjä modernia kirjautumista vai vanhaa legacy authentication -mallia.

Client app -ehdoilla voidaan hallita esimerkiksi:

- browser-kirjautumisia
- mobile apps and desktop clients -käyttöä
- legacy authenticationia
- vanhoja sähköpostiprotokollia

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa estää vanhat kirjautumistavat, jotka eivät tue MFA:ta.

Conditional Access -policy estää legacy authentication -kirjautumiset.

Tämä voi suojata esimerkiksi vanhoilta sähköpostisovelluksilta, jotka käyttävät turvattomampia kirjautumistapoja.

**Tekninen huomio:**  
Legacy authentication on ollut monessa ympäristössä iso riski, koska se voi ohittaa modernit suojaukset kuten MFA:n.

**Riski:**  
Jos legacy authentication sallitaan, hyökkääjä voi yrittää kirjautua vanhalla protokollalla ilman samoja suojausvaatimuksia.

**Elikkäs:**  
Client Apps kertoo, millä tavalla käyttäjä yrittää kirjautua. Vanha kirjautumistapa voi olla kuin takaovi, jota kukaan ei muistanut lukita.

---

## Sign-in Risk

**Sign-in Risk** - Arvio siitä, näyttääkö yksittäinen kirjautumisyritys epäilyttävältä.

Sign-in risk voi nousta esimerkiksi, jos kirjautumisessa näkyy outoja merkkejä.

Riskisignaaleja voivat olla esimerkiksi:

- mahdoton matkustaminen
- tuntematon sijainti
- epäilyttävä IP-osoite
- poikkeava kirjautumiskäyttäytyminen
- anonymisoiva palvelu
- epäilyttävä selain tai asiakasohjelma

**Esimerkkitilanne:**  
Aku kirjautuu aamulla Joensuusta.

Viisi minuuttia myöhemmin Akun tunnuksella yritetään kirjautua toiselta puolelta maailmaa.

Entra ID voi arvioida kirjautumisen riskialttiiksi.

Conditional Access voi vaatia MFA:n tai estää kirjautumisen.

**Tekninen huomio:**  
Sign-in risk liittyy yksittäiseen kirjautumistapahtumaan. Se ei välttämättä tarkoita, että käyttäjän koko tili on varmasti vaarantunut, mutta tilanne näyttää epäilyttävältä.

**Riski:**  
Jos riskipohjaisia kirjautumisia ei huomioida, epäilyttävä kirjautuminen voi päästä läpi samalla tavalla kuin tavallinen kirjautuminen.

**Elikkäs:**  
Sign-in risk kysyy: näyttääkö tämä kirjautuminen oudolta juuri nyt?

---

## User Risk

**User Risk** - Arvio siitä, onko käyttäjän identiteetti mahdollisesti vaarantunut.

User risk liittyy käyttäjätiliin kokonaisuutena, ei vain yhteen kirjautumiseen.

User risk voi nousta esimerkiksi, jos:

- käyttäjän tunnus löytyy vuotaneista tunnuksista
- tilillä havaitaan epäilyttävää toimintaa
- kirjautumiset näyttävät poikkeavilta
- käyttäjän identiteetti voi olla kaapattu

**Esimerkkitilanne:**  
Ankkalinna Oy:n järjestelmä havaitsee, että Hannu Hanhen tunnus liittyy epäilyttävään toimintaan.

User risk nousee korkeaksi.

Conditional Access voi vaatia Hannua vaihtamaan salasanan tai estää pääsyn, kunnes riski on käsitelty.

**Tekninen huomio:**  
User risk vaatii yleensä Microsoft Entra ID Protection -ominaisuuksia ja sopivia lisenssejä.

**Riski:**  
Jos user risk -signaaleihin ei reagoida, mahdollisesti kaapattu käyttäjätili voi jatkaa toimintaansa.

**Elikkäs:**  
User risk kysyy: voiko tämä käyttäjätili olla vaarantunut?

---

## Grant Controls

**Grant Controls** - Toiminnot, joilla Conditional Access määrittää, mitä pitää tapahtua ennen kuin pääsy sallitaan.

Grant controls voivat esimerkiksi:

- estää pääsyn
- vaatia MFA:n
- vaatia compliant device -tilan
- vaatia hybrid joined device -tilan
- vaatia hyväksytyn client appin
- vaatia app protection policyn
- vaatia salasanan vaihdon

**Esimerkkitilanne:**  
Ankkalinna Oy tekee policy-säännön HR-järjestelmälle.

Grant controls:

- require MFA
- require compliant device

Tämä tarkoittaa, että käyttäjän pitää sekä suorittaa MFA että käyttää compliant-laitetta.

**Tekninen huomio:**  
Grant controls -asetuksissa voi olla valinta, pitääkö kaikkien ehtojen täyttyä vai riittääkö yksi valituista kontrollista. Tämä pitää tarkistaa huolellisesti.

**Riski:**  
Jos “require one of the selected controls” ja “require all selected controls” menevät sekaisin, sääntö voi olla paljon löysempi tai tiukempi kuin tarkoitus.

**Elikkäs:**  
Grant controls kertoo, mitä käyttäjältä vaaditaan ennen kuin ovi aukeaa.

---

## Block Access

**Block Access** - Conditional Access -kontrolli, jolla pääsy estetään kokonaan.

Block access on voimakas sääntö, jota pitää käyttää huolellisesti.

Sitä voidaan käyttää esimerkiksi:

- estämään legacy authentication
- estämään kirjautumiset tietyistä maista
- estämään pääsy hallitsemattomilta laitteilta
- estämään korkean riskin kirjautumiset
- estämään guest-käyttäjien pääsy tiettyihin sovelluksiin

**Esimerkkitilanne:**  
Ankkalinna Oy:llä ei ole liiketoimintaa tietyissä maissa.

Conditional Access -policy estää kirjautumiset näistä maista.

Jos Akun tunnuksella yritetään kirjautua estetyltä alueelta, pääsy blokataan.

**Tekninen huomio:**  
Block access -säännöt pitää testata report-only-tilassa ennen käyttöönottoa, jos vaikutus voi olla laaja.

**Riski:**  
Väärin kohdistettu block-policy voi lukita käyttäjiä ulos kriittisistä palveluista.

**Elikkäs:**  
Block access tarkoittaa, että ovi ei aukea. Tehokas kontrolli, mutta älä ammu sillä omaa jalkaa.

---

## Require MFA

**Require MFA** - Conditional Access -kontrolli, joka vaatii käyttäjältä monivaiheisen tunnistautumisen.

MFA tarkoittaa, että pelkkä salasana ei riitä.

Käyttäjän pitää todistaa henkilöllisyytensä toisella tavalla, esimerkiksi:

- Microsoft Authenticatorilla
- passkeyllä
- FIDO2-avaimella
- tekstiviestillä
- puhelulla
- muulla hyväksytyllä menetelmällä

**Esimerkkitilanne:**  
Ankkalinna Oy vaatii MFA:n kaikilta admin-rooleilta.

Kun Iines yrittää avata Microsoft Entra admin centerin, hänen pitää hyväksyä kirjautuminen Authenticatorilla.

Jos hyökkääjä tietää Iineksen salasanan mutta ei voi läpäistä MFA:ta, kirjautuminen estyy.

**Tekninen huomio:**  
Kaikki MFA-menetelmät eivät ole yhtä vahvoja. Esimerkiksi SMS on parempi kuin ei mitään, mutta vahvemmat menetelmät kuten Authenticator, number matching, passkeys tai FIDO2 voivat olla turvallisempia.

**Riski:**  
MFA ei ole hopealuoti. MFA fatigue, väärät hyväksynnät ja heikot menetelmät voivat edelleen olla riskejä.

**Elikkäs:**  
Require MFA tarkoittaa, että salasana ei yksin riitä. Käyttäjän pitää todistaa olevansa oikea henkilö toisella tavalla.

---

## Require Compliant Device

**Require Compliant Device** - Conditional Access -kontrolli, joka sallii pääsyn vain laitteelta, joka täyttää organisaation määrittelemät compliance-vaatimukset.

Compliant device -tila tulee yleensä Intunesta.

Laite voi olla compliant, jos esimerkiksi:

- levy on salattu
- käyttöjärjestelmä on ajan tasalla
- PIN tai salasana on käytössä
- suojausohjelma toimii
- laite ei ole rooted tai jailbroken
- laite on organisaation hallinnassa

**Esimerkkitilanne:**  
Ankkalinna Oy:n HR SharePoint sisältää arkaluontoisia henkilöstötietoja.

Conditional Access -policy vaatii compliant device -tilan.

Iines pääsee HR SharePointiin työläppäriltään, joka on Intune-hallittu ja compliant.

Iines ei pääse samaan sivustoon vanhalta kotikoneelta, joka ei ole organisaation hallinnassa.

**Tekninen huomio:**  
Require compliant device vaatii toimivan laitehallinnan ja compliance-policyt. Conditional Access ei voi vaatia kunnolla compliancea, jos laitteiden hallinta on retuperällä.

**Riski:**  
Jos compliance-säännöt ovat liian löysät, compliant-tila ei tarkoita paljon mitään. Jos ne ovat liian tiukat, käyttäjät voivat jäädä turhaan jumiin.

**Elikkäs:**  
Require compliant device tarkoittaa, että laitteen pitää olla organisaation mielestä kunnossa ennen kuin pääsy sallitaan.

---

## Require Hybrid Joined Device

**Require Hybrid Joined Device** - Conditional Access -kontrolli, joka vaatii, että laite on liitetty sekä paikalliseen Active Directoryyn että Microsoft Entra ID:hen.

Tätä voidaan käyttää hybrid-ympäristöissä, joissa halutaan sallia pääsy vain organisaation domain-liitetyiltä työasemilta.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on vanhempi hybrid-ympäristö.

Kriittiseen tuotantojärjestelmään halutaan sallia pääsy vain organisaation työasemilta, jotka ovat hybrid joined.

Aku yrittää kirjautua tuotantojärjestelmään työläppäriltään. Laite on paikallisessa AD:ssä ja näkyy myös Entra ID:ssä hybrid joined -laitteena.

Pääsy sallitaan.

Jos Aku yrittää kirjautua omalta kotikoneelta, pääsy estetään.

**Tekninen huomio:**  
Tämä kontrolli sopii erityisesti ympäristöihin, joissa hybrid join on hallittu ja luotettava osa laitemallia.

**Riski:**  
Jos hybrid join ei toimi kunnolla tai laiteobjektit ovat sotkuisia, policy voi aiheuttaa hankalia kirjautumisongelmia.

**Elikkäs:**  
Require hybrid joined device tarkoittaa, että laitteen pitää kuulua sekä AD- että Entra-maailmaan.

---

## Session Controls

**Session Controls** - Conditional Access -kontrollit, joilla voidaan hallita käyttäjän istuntoa pääsyn sallimisen jälkeen.

Session controls eivät aina estä kirjautumista kokonaan. Sen sijaan ne voivat rajoittaa, mitä käyttäjä voi tehdä istunnon aikana.

Session controls voivat liittyä esimerkiksi:

- selaimen rajoitettuun käyttöön
- lataamisen estämiseen
- sovelluksen hallintaan
- kirjautumisistunnon pituuteen
- sign-in frequencyyn
- persistent browser session -asetuksiin

**Esimerkkitilanne:**  
Hannu käyttää Ankkalinna Oy:n SharePointia henkilökohtaiselta laitteelta.

Ankkalinna Oy ei halua estää kaikkea käyttöä, mutta ei myöskään halua, että tiedostoja ladataan hallitsemattomalle laitteelle.

Session control voi sallia SharePointin käytön selaimessa, mutta estää tiedostojen lataamisen.

**Tekninen huomio:**  
Session controls voivat olla hyvä kompromissi tilanteissa, joissa täysi esto olisi liian tiukka mutta vapaa pääsy liian riskialtis.

**Riski:**  
Jos käyttäjille annetaan hallitsemattomilta laitteilta täydet latausoikeudet, organisaation data voi päätyä laitteisiin, joita ei pystytä hallitsemaan.

**Elikkäs:**  
Session controls eivät aina estä ovea avautumasta, mutta ne voivat päättää, saatko kantaa tavarat ulos.

---

## Report-only Mode

**Report-only Mode** - Tila, jossa Conditional Access -policyä testataan ilman, että se oikeasti vaikuttaa käyttäjän kirjautumiseen.

Report-only näyttää, mitä olisi tapahtunut, jos policy olisi ollut käytössä.

Tämä on erittäin tärkeä ennen laajojen policyjen käyttöönottoa.

**Esimerkkitilanne:**  
Ankkalinna Oy suunnittelee policyä, joka estää legacy authenticationin.

Ennen kuin sääntö otetaan käyttöön, se laitetaan report-only-tilaan.

IT seuraa lokeista:

- keihin policy olisi osunut
- mitä kirjautumisia olisi estetty
- onko käytössä vielä vanhoja sovelluksia
- tuleeko vaikutuksia kriittisiin käyttäjiin
- pitääkö tehdä poikkeuksia tai korjauksia

Kun vaikutukset ymmärretään, policy voidaan ottaa käyttöön turvallisemmin.

**Tekninen huomio:**  
Report-only ei suojaa vielä mitään. Se on testaus- ja suunnittelutyökalu.

**Riski:**  
Jos policy otetaan suoraan käyttöön ilman testausta, käyttäjiä tai integraatioita voi mennä rikki kerralla.

**Elikkäs:**  
Report-only on harjoitusajo. Se kertoo mitä olisi tapahtunut ilman että käyttäjiä vielä paiskataan lukkojen taakse.

---

## Exclude Users

**Exclude Users** - Käyttäjät, ryhmät tai roolit, jotka jätetään Conditional Access -policyn ulkopuolelle.

Excludeja tarvitaan joskus, mutta niitä pitää käyttää varoen.

Tyypillisiä excludeja voivat olla esimerkiksi:

- break glass -tilit
- tietyt palvelutilit
- testikäyttäjät
- poikkeustilanteen käyttäjät
- erikseen hyväksytyt tekniset tilit

**Esimerkkitilanne:**  
Ankkalinna Oy tekee policy-säännön, joka vaatii MFA:n kaikilta käyttäjiltä.

Break glass -tilit jätetään policyn ulkopuolelle, jotta organisaatiolla on hätätilanteessa tapa päästä tenanttiin, jos MFA- tai Conditional Access -asetukset menevät rikki.

**Tekninen huomio:**  
Exclude-käyttäjät pitää dokumentoida ja tarkistaa säännöllisesti. Jokaiselle poikkeukselle pitää olla perustelu.

**Riski:**  
Poikkeuksista tulee helposti pysyviä takaportteja. “Väliaikainen exclude” on IT-maailmassa usein sama kuin “löytyi viiden vuoden päästä auditissa”.

**Elikkäs:**  
Exclude Users tarkoittaa, että joku jätetään säännön ulkopuolelle. Tarpeellinen joskus, vaarallinen jos unohtuu.

---

## Break Glass Account

**Break Glass Account** - Hätätili, jota käytetään vain poikkeustilanteessa, jos normaali admin-kirjautuminen ei toimi.

Break glass -tili on tarkoitettu tilanteisiin, joissa organisaatio muuten lukitsisi itsensä ulos.

Break glass -tilin pitäisi olla:

- hyvin suojattu
- harvojen tiedossa
- valvottu
- normaalikäytön ulkopuolella
- dokumentoitu
- testattu
- Conditional Access -poikkeuksissa harkitusti
- hälytysten piirissä

**Esimerkkitilanne:**  
Ankkalinna Oy ottaa käyttöön uuden Conditional Access -policyn, mutta sääntö estää vahingossa adminien kirjautumisen.

Normaalit adminit eivät pääse korjaamaan asetusta.

Break glass -tilillä päästään kirjautumaan ja korjaamaan virheellinen policy.

**Tekninen huomio:**  
Break glass -tiliä ei pidä käyttää päivittäiseen ylläpitoon. Jokaisesta käytöstä pitäisi tulla hälytys.

**Riski:**  
Jos break glass -tili on huonosti suojattu, se voi olla hyökkääjälle unelmien takaovi.

**Elikkäs:**  
Break glass -tili on hätäuloskäynti. Ei arkikäyttöön, ei laiskuuteen, ei “no kirjaudunpa tällä kun muulla ei jaksa”.

---

## Policy Gap

**Policy Gap** - Aukko Conditional Access -säännöissä. Tarkoittaa tilannetta, jossa jokin käyttäjä, sovellus, laite tai kirjautumistapa jää suojaamatta.

Policy gap voi syntyä esimerkiksi, jos:

- tärkeä sovellus unohtuu policyn ulkopuolelle
- guest-käyttäjiä ei huomioida
- admin-roolit eivät kuulu MFA-policyyn
- legacy authentication jää sallituksi
- unmanaged devices pääsevät arkaluontoisiin tietoihin
- poikkeuksia on liikaa
- uutta sovellusta ei lisätä sääntöihin

**Esimerkkitilanne:**  
Ankkalinna Oy suojaa SharePointin ja Exchange Onlinen MFA:lla, mutta unohtaa erillisen raportointisovelluksen.

Raportointisovellus sisältää arkaluontoisia tietoja, mutta siihen pääsee pelkällä salasanalla.

Tämä on policy gap.

**Tekninen huomio:**  
Policy gapit löytyvät usein vasta, kun ympäristöä tarkastellaan kokonaisuutena. Yksittäinen policy voi näyttää hyvältä, vaikka kokonaisuus vuotaa.

**Riski:**  
Hyökkääjä etsii yleensä heikoimman kohdan, ei vahvinta. Yksi suojaamaton sovellus voi riittää.

**Elikkäs:**  
Policy gap on aukko säännöissä. Kaikki näyttää hienolta, kunnes huomataan että yksi ovi jäi auki takapihalle.

---

## Policy Conflict

**Policy Conflict** - Tilanne, jossa useampi Conditional Access -policy vaikuttaa samaan kirjautumiseen tavalla, joka aiheuttaa epäselvyyttä tai odottamattoman lopputuloksen.

Conditional Accessissa useampi policy voi osua samaan käyttäjään ja sovellukseen.

Tämä ei ole automaattisesti väärin, mutta se pitää ymmärtää.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on kaksi policyä:

1. Kaikille käyttäjille vaaditaan MFA Microsoft 365:een.
2. Hallitsemattomilta laitteilta estetään pääsy SharePointiin.

Hannu yrittää kirjautua SharePointiin omalta kotikoneelta.

Ensimmäinen policy vaatii MFA:n.

Toinen policy estää pääsyn, koska laite ei ole hallittu.

Käyttäjä voi ajatella: “Mutta minähän tein MFA:n!”

Silti pääsy estyy, koska toinen policy estää kirjautumisen.

**Tekninen huomio:**  
Block access voittaa käytännössä pääsyn sallivat kontrollit. Jos yksi soveltuva policy estää pääsyn, käyttäjä ei pääse sisään, vaikka toinen policy vain vaatisi MFA:n.

**Riski:**  
Jos policyjen yhteisvaikutusta ei ymmärretä, vianhaku on hidasta ja käyttäjäviestintä sekavaa.

**Elikkäs:**  
Policy conflict tarkoittaa, että useampi sääntö vaikuttaa samaan tilanteeseen. Käyttäjän näkökulmasta se voi näyttää oudolta, mutta lokit kertovat mikä sääntö iski.

---

## What If Tool

**What If Tool** - Conditional Accessin testityökalu, jolla voidaan arvioida, mitkä policyt osuisivat tiettyyn käyttäjään ja kirjautumistilanteeseen.

What If Tool auttaa ymmärtämään policyjen vaikutusta ennen muutoksia tai vianhaun aikana.

Sillä voidaan testata esimerkiksi:

- käyttäjä
- sovellus
- sijainti
- laitealusta
- client app
- riski
- kirjautumisen ehdot

**Esimerkkitilanne:**  
Aku ei pääse kirjautumaan ServiceNow’hun.

Service Desk tai IAM-tiimi käyttää What If Toolia ja tarkistaa:

- mikä policy osuu Akuun
- miksi pääsy estyy
- vaikuttaako sijainti
- vaikuttaako laite
- vaaditaanko MFA
- onko käyttäjä exclude-listalla tai ei

Tooli näyttää, että `CA - Block Unmanaged Devices` estää pääsyn, koska Akun laite ei ole compliant.

**Tekninen huomio:**  
What If Tool on hyvä apu, mutta sign-in logs ovat usein lopullinen totuus siitä, mitä oikeassa kirjautumisessa tapahtui.

**Riski:**  
Ilman What If -testausta policyjä voidaan muuttaa sokkona ja toivoa parasta. Ja kuten tiedämme, “toivotaan parasta” ei ole arkkitehtuuri.

**Elikkäs:**  
What If Tool on Conditional Accessin testipenkki. Sillä voi katsoa etukäteen, mikä sääntö osuisi ja miksi.

---

## Sign-in Logs

**Sign-in Logs** - Kirjautumislokit, joista näkyy käyttäjän kirjautumisyritykset ja Conditional Access -päätökset.

Sign-in logs ovat todella tärkeitä Conditional Access -vianhaussa.

Niistä voidaan nähdä esimerkiksi:

- kuka kirjautui
- milloin kirjautuminen tapahtui
- mistä sijainnista kirjautuminen tuli
- millä sovelluksella kirjauduttiin
- onnistuiko vai epäonnistuiko kirjautuminen
- mikä Conditional Access -policy osui
- mikä grant control vaadittiin
- estettiinkö pääsy
- oliko sign-in risk mukana
- millä laitteella kirjautuminen tehtiin

**Esimerkkitilanne:**  
Iines ei pääse HR-sovellukseen.

Hän sanoo Service Deskille:

> “Kirjautuminen ei vaan toimi.”

Sign-in logs näyttää, että kirjautuminen estyi Conditional Access -policyn takia.

Policy vaati compliant device -tilan, mutta Iineksen laite oli non-compliant, koska päivitykset olivat asentamatta.

Tällöin ongelma ei ole salasana eikä käyttäjätili, vaan laitteen compliance-tila.

**Tekninen huomio:**  
Sign-in logs auttaa erottamaan, onko ongelma salasanassa, MFA:ssa, Conditional Accessissa, sovelluksessa, laitteessa vai riskisignaalissa.

**Riski:**  
Ilman lokien lukemista vianhaku muuttuu arvailuksi. Ja arvailu tuotantoympäristössä on se kuuluisa “ei näin” -osasto.

**Elikkäs:**  
Sign-in logs kertoo, mitä kirjautumisessa oikeasti tapahtui. Jos Conditional Access on portinvartija, sign-in logs on valvontakameran nauha.

---

## Yhteenveto

Conditional Access on yksi Microsoft Entra ID:n tärkeimmistä pääsynhallinnan työkaluista.

Se auttaa suojaamaan ympäristöä tilanteen mukaan.

Hyvä Conditional Access -ajattelu ei ole vain:

> “Laitetaan MFA kaikille.”

Vaan enemmän:

- mitkä sovellukset ovat kriittisiä?
- ketkä käyttäjät ovat korkean riskin käyttäjiä?
- miten admin-roolit suojataan?
- mitä tehdään guest-käyttäjille?
- mitä laitteita luotetaan?
- mitä sijainteja sallitaan?
- estetäänkö legacy authentication?
- mitä tehdään riskikirjautumisille?
- miten poikkeukset dokumentoidaan?
- miten policyt testataan ennen käyttöönottoa?
- miten vianhaku tehdään lokien perusteella?

**Elikkäs:**  
Conditional Access on tilannekohtainen pääsynhallinta. Se ei vain kysy “onko salasana oikein”, vaan “onko koko tilanne tarpeeksi turvallinen pääsyn antamiseen”.
