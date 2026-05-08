# Microsoft Entra ID - käsitteet

Microsoft Entra ID on Microsoftin pilvipohjainen identiteetti- ja pääsynhallintapalvelu.

Sitä käytetään käyttäjien, ryhmien, sovellusten, kirjautumisen, käyttöoikeuksien, laitteiden ja turvallisuuden hallintaan Microsoft 365- ja pilviympäristöissä.

Vanha nimi oli **Azure Active Directory** tai **Azure AD**. Moni käyttää edelleen arjessa nimeä Azure AD tai AAD, vaikka nykyinen nimi on Microsoft Entra ID.

Microsoft Entra ID ei ole sama asia kuin perinteinen paikallinen Active Directory, vaikka niillä voi olla yhteys toisiinsa.

Entra ID on erityisen tärkeä modernissa Microsoft-ympäristössä, koska se toimii usein keskitettynä identiteettikerroksena esimerkiksi Microsoft 365:lle, Teamsille, SharePointille, Exchange Onlinelle, Azure-resursseille, SaaS-sovelluksille ja SSO-kirjautumisille.

**Elikkäs:**  
Microsoft Entra ID on se paikka, jossa pilviympäristön identiteetit, kirjautumiset, sovelluspääsyt ja monet tietoturvasäännöt kohtaavat.

---

## Microsoft Entra ID

**Microsoft Entra ID** - Microsoftin pilvipohjainen identiteetti- ja pääsynhallintapalvelu. Sen avulla hallitaan käyttäjiä, ryhmiä, kirjautumista, sovelluksia, MFA:ta, Conditional Accessia, rooleja, laitteita, yrityssovelluksia ja identiteettiin liittyviä tietoturvakontrolleja.

Teknisesti Entra ID toimii organisaation pilvipohjaisena hakemistona. Se sisältää objekteja, kuten käyttäjiä, ryhmiä, sovelluksia, palveluidentiteettejä ja laitteita.

Entra ID vastaa esimerkiksi kysymyksiin:

- kuka käyttäjä on
- onko käyttäjä olemassa
- onko käyttäjä aktiivinen
- millä tunnuksella käyttäjä kirjautuu
- kuuluuko käyttäjä johonkin ryhmään
- onko käyttäjällä pääsy sovellukseen
- pitääkö käyttäjältä vaatia MFA
- mistä käyttäjä yrittää kirjautua
- millä laitteella käyttäjä kirjautuu
- onko kirjautumisessa riskiä

**Esimerkkitilanne:**  
Ankkalinna Oy käyttää Microsoft 365 -palveluita. Kun Aku Ankka kirjautuu Outlookiin, Teamsiin tai SharePointiin, Microsoft Entra ID tarkistaa Akun identiteetin.

Entra ID voi tarkistaa esimerkiksi:

- onko Akun käyttäjätili aktiivinen
- onko salasana oikein
- pitääkö Akun hyväksyä kirjautuminen Microsoft Authenticatorilla
- onko kirjautuminen tulossa normaalista sijainnista
- kuuluuko Aku ryhmään, jolla on pääsy tiettyyn SharePoint-sivustoon
- onko Akun laite organisaation hallinnassa

**Elikkäs:**  
Microsoft Entra ID on Microsoftin pilvi-identiteetin keskus. Se ei vain säilytä käyttäjiä, vaan osallistuu kirjautumiseen, pääsynhallintaan ja turvallisuuden arviointiin.

---

## Azure AD

**Azure AD** - Microsoft Entra ID:n vanha nimi. Azure Active Directory tunnettiin pitkään nimellä Azure AD, mutta Microsoft nimesi palvelun uudelleen Microsoft Entra ID:ksi.

Nimenmuutos voi aiheuttaa hämmennystä, koska monissa työpaikoissa, dokumenteissa, skripteissä, koulutusmateriaaleissa ja vanhoissa ohjeissa puhutaan edelleen Azure AD:stä tai AAD:stä.

Teknisesti moni asia viittaa edelleen vanhaan nimeen. Esimerkiksi joissain PowerShell-moduuleissa, vanhoissa portaaleissa, lokiteksteissä tai dokumentaatiossa voi näkyä vielä Azure AD -termejä.

**Esimerkkitilanne:**  
Työpaikalla joku sanoo:

> “Tarkista löytyykö käyttäjä AAD:lta.”

Todennäköisesti hän tarkoittaa Microsoft Entra ID:tä, vaikka käyttää vanhaa nimeä.

Toinen voi sanoa:

> “Katso AD:lta.”

Tässä pitää olla tarkkana. Hän voi tarkoittaa joko paikallista Active Directorya tai puhekielessä Entraa / Azure AD:tä.

**Elikkäs:**  
Azure AD ja Microsoft Entra ID tarkoittavat käytännössä samaa pilvipalvelua, mutta Entra ID on nykyinen nimi. Arjessa vanha nimi elää vielä pitkään, koska IT-maailma ei koskaan päästä termeistä irti nätisti. Tietenkään ei. Sehän olisi liian helppoa.

---

## AD, AAD ja Entra

**AD, AAD ja Entra** - Näitä termejä käytetään usein sekaisin, mutta ne eivät tarkoita täsmälleen samaa asiaa.

**AD** tarkoittaa yleensä paikallista **Active Directorya**. Se on perinteinen on-premises-hakemisto, jota käytetään esimerkiksi Windows-toimialueissa, palvelinympäristöissä, ryhmäkäytännöissä ja paikallisessa käyttäjähallinnassa.

**AAD** tarkoittaa yleensä vanhalla nimellä **Azure Active Directorya**, eli nykyistä Microsoft Entra ID:tä.

**Entra** tarkoittaa Microsoft Entra ID:tä eli pilvipohjaista identiteettipalvelua.

Tekninen ero on tärkeä, koska käyttäjän tietojen lähde voi olla eri paikassa.

Käyttäjä voi olla esimerkiksi:

- vain paikallisessa AD:ssä
- vain Entra ID:ssä
- paikallisessa AD:ssä ja synkronoituna Entra ID:hen
- ulkopuolisena guest-käyttäjänä Entra ID:ssä

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä Aku Ankan käyttäjä luodaan paikalliseen Active Directoryyn. Käyttäjän tiedot synkronoidaan Microsoft Entra ID:hen Microsoft Entra Connectin kautta.

Tällöin Akun nimi, UPN, osasto ja muut attribuutit voivat tulla paikallisesta AD:stä. Jos joku yrittää muuttaa näitä suoraan Entra ID:ssä, muutos voi palautua vanhaksi seuraavassa synkronoinnissa.

**Elikkäs:**  
AD on usein paikallinen käyttäjähakemisto. AAD ja Entra tarkoittavat pilvi-identiteettiä. Ne voivat olla yhteydessä toisiinsa, mutta ne eivät ole sama asia. Tämä pitää ymmärtää ennen kuin menee muuttamaan käyttäjätietoja sokkona.

---

## Tenant

**Tenant** - Organisaation oma Microsoft-pilviympäristö. Tenant sisältää organisaation käyttäjät, ryhmät, sovellukset, asetukset, lisenssit, laitteet, roolit ja identiteettiin liittyvät määritykset.

Tenant on käytännössä organisaation oma looginen ympäristö Microsoftin pilvessä.

Tenantissa voi olla esimerkiksi:

- käyttäjät
- ryhmät
- guest-käyttäjät
- sovellukset
- Enterprise Applications
- App Registrations
- admin-roolit
- Conditional Access -säännöt
- MFA-asetukset
- lisenssit
- laitteet
- audit- ja sign-in-lokit
- domainit, kuten `ankkalinna.fi`

Tenant ei tarkoita yhtä palvelinta tai yhtä konetta. Se on pilvessä oleva organisaatiokohtainen hallintaympäristö.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on oma Microsoft 365 tenant. Sen primary domain voisi olla esimerkiksi `ankkalinna.onmicrosoft.com`, ja siihen on lisätty organisaation oma domain `ankkalinna.fi`.

Kun Aku Ankka kirjautuu tunnuksella `aku.ankka@ankkalinna.fi`, kirjautuminen tapahtuu Ankkalinna Oy:n tenanttiin.

Saman käyttäjän tunnus ei automaattisesti ole olemassa toisen yrityksen tenantissa. Jos Aku kutsutaan Kopla Turva Oy:n Teamsiin, hän voi näkyä siellä guest-käyttäjänä Kopla Turva Oy:n tenantissa.

**Elikkäs:**  
Tenant on organisaation oma Microsoft-pilvikoti. Siellä asuvat käyttäjät, ryhmät, sovellukset, asetukset ja identiteettipolitiikat.

---

## Directory

**Directory** - Hakemisto, jossa käyttäjät, ryhmät, sovellukset, laitteet ja muut identiteettiobjektit ovat. Microsoft Entra ID toimii pilvipohjaisena directoryna.

Directory ei ole vain osoitekirja, vaikka käyttäjät voivat näkyä myös osoitekirjassa. Se on tekninen hakemisto, jossa identiteettiobjekteja hallitaan.

Directoryssa voi olla esimerkiksi:

- käyttäjäobjekteja
- ryhmäobjekteja
- laiteobjekteja
- sovellusobjekteja
- service principaleja
- roolimäärityksiä
- domain-tietoja

Jokaisella objektilla on omia attribuutteja. Käyttäjällä voi olla esimerkiksi nimi, UPN, object ID, sähköposti, osasto, työnimike ja tilin tila.

**Esimerkkitilanne:**  
Service Desk etsii Aku Ankan käyttäjätiliä Microsoft Entra admin centeristä. Aku löytyy directoryn käyttäjäobjekteista.

Akun käyttäjäobjektista voidaan nähdä esimerkiksi:

- display name
- user principal name
- object ID
- user type
- account enabled / disabled
- assigned licenses
- group memberships
- sign-in activity
- authentication methods
- assigned roles

**Elikkäs:**  
Directory on Entran tekninen hakemisto. Se ei ole vain lista käyttäjistä, vaan kokoelma identiteettiobjekteja ja niiden tietoja.

---

## User

**User** - Käyttäjäobjekti Microsoft Entra ID:ssä. Käyttäjä voi olla organisaation sisäinen työntekijä, vieraskäyttäjä, konsultti tai muu henkilö, joka tarvitsee pääsyn palveluihin.

Käyttäjäobjekti sisältää käyttäjään liittyviä attribuutteja ja asetuksia.

Käyttäjäobjektilla voi olla esimerkiksi:

- displayName
- givenName
- surname
- userPrincipalName
- mail
- objectId
- userType
- accountEnabled
- department
- jobTitle
- usageLocation
- assignedLicenses
- manager
- group memberships
- authentication methods
- sign-in activity

Käyttäjän pääsy Microsoft-palveluihin ei perustu vain siihen, että käyttäjä on olemassa. Lisäksi käyttäjä voi tarvita lisenssin, ryhmäjäsenyyden, sovelluspääsyn, Conditional Access -ehtojen täyttymisen ja toimivan kirjautumistavan.

**Esimerkkitilanne:**  
Aku Ankka on Ankkalinna Oy:n työntekijä. Hänellä on Entra ID:ssä käyttäjäobjekti.

Akun tunnuksella voi olla esimerkiksi:

- UPN: `aku.ankka@ankkalinna.fi`
- display name: `Aku Ankka`
- department: `Production`
- job title: `Production Worker`
- usage location: `Finland`
- license: Microsoft 365 Business Premium
- group membership: `Production-Users`
- account status: enabled

Kun Aku yrittää kirjautua Teamsiin, pelkkä käyttäjäobjekti ei vielä riitä. Entra ID tarkistaa myös esimerkiksi salasanan, MFA:n, Conditional Access -säännöt ja lisensoinnin.

**Elikkäs:**  
User on käyttäjän digitaalinen identiteetti Entrassa. Se on enemmän kuin nimi listassa: siihen liittyy attribuutteja, kirjautumista, lisenssejä, ryhmiä ja pääsyoikeuksia.

---

## Member User

**Member User** - Organisaation oma sisäinen käyttäjä. Yleensä työntekijä, jonka tili kuuluu organisaation tenanttiin.

Member user on käyttäjä, jota organisaatio yleensä hallitsee itse. Hänellä voi olla organisaation domainin mukainen UPN, Microsoft 365 -lisenssi, ryhmäjäsenyyksiä ja pääsy sisäisiin resursseihin.

Member-käyttäjällä voi olla laajemmat oletusoikeudet kuin guest-käyttäjällä, riippuen tenantin asetuksista.

**Esimerkkitilanne:**  
Iines Ankka työskentelee Ankkalinna Oy:ssä HR-tiimissä. Hänen käyttäjätilinsä on Ankkalinnan omassa tenantissa member-käyttäjänä.

Iineksellä voi olla:

- UPN: `iines.ankka@ankkalinna.fi`
- user type: `Member`
- Microsoft 365 -lisenssi
- pääsy Teamsiin, Outlookiin ja SharePointiin
- ryhmäjäsenyys `HR-Users`
- Conditional Access -vaatimus MFA:lle

**Elikkäs:**  
Member user on talon oma käyttäjä. Yleensä työntekijä tai sisäinen käyttäjä, jonka identiteettiä organisaatio hallitsee suoraan.

---

## Guest User

**Guest User** - Ulkopuolinen käyttäjä, joka näkyy organisaation Microsoft Entra ID:ssä vieraskäyttäjänä. Guest user ei ole organisaation oma sisäinen työntekijä, mutta hänelle voidaan antaa rajattu pääsy esimerkiksi Teamsiin, SharePointiin, sovellukseen tai projektiresurssiin.

Guest-käyttäjä liittyy usein Microsoft Entra B2B -yhteistyöhön. Hän voi käyttää omaa kotiorganisaationsa tunnusta, mutta hänestä syntyy vierasobjekti kutsuvan organisaation tenanttiin.

Teknisesti guest-käyttäjällä voi olla Ankkalinna Oy:n tenantissa oma käyttäjäobjekti, jonka user type on `Guest`. Hänen varsinainen tunnistautumisensa voi kuitenkin tapahtua hänen oman organisaationsa kautta.

Guest-käyttäjää pitää hallita tarkasti, koska ulkopuolisten pääsyt unohtuvat helposti projektin päätyttyä.

**Esimerkkitilanne:**  
Ankkalinna Oy tekee projektia Kopla Turva Oy:n kanssa. Kopla Turva Oy:n konsultti Taikaviitta kutsutaan Ankkalinnan Teams-tiimiin.

Taikaviitta käyttää kirjautumiseen omaa Kopla Turva Oy:n tunnustaan, mutta hän näkyy Ankkalinna Oy:n Entra ID:ssä guest-käyttäjänä.

Ankkalinnan näkökulmasta Taikaviitalle voidaan määrittää esimerkiksi:

- pääsy vain tiettyyn Teams-tiimiin
- pääsy vain tiettyyn SharePoint-sivustoon
- vaatimus MFA:sta
- käyttöehtojen hyväksyntä
- määräaikainen access package
- access review projektin päättyessä

**Elikkäs:**  
Guest user on ulkopuolinen käyttäjä, joka on kutsuttu organisaation ympäristöön yhteistyötä varten. Hän ei ole “talon oma käyttäjä”, mutta hänelle voidaan antaa rajattu ja valvottu pääsy tiettyihin resursseihin.

---

## External Identity

**External Identity** - Ulkoinen identiteetti. Laajempi käsite, joka tarkoittaa organisaation ulkopuolista käyttäjää tai identiteettiä, jolle annetaan hallittu pääsy organisaation resursseihin.

External identity voi liittyä esimerkiksi:

- guest-käyttäjiin
- kumppaneihin
- konsultteihin
- asiakkaisiin
- toimittajiin
- ulkoisiin projektiryhmiin
- eri tenanttien väliseen yhteistyöhön
- B2B collaboration -malleihin
- cross-tenant access -asetuksiin

Guest user on yksi käytännön tapa, jolla external identity voi näkyä Microsoft Entra ID:ssä.

**Esimerkkitilanne:**  
Ankkalinna Oy tekee yhteistyötä useiden ulkopuolisten toimijoiden kanssa.

Kopla Turva Oy:n konsultti Taikaviitta tarvitsee pääsyn projektin Teamsiin. Tilitoimiston käyttäjä tarvitsee pääsyn tiettyyn talousraporttiin. Ulkoinen auditor tarvitsee määräaikaisen pääsyn compliance-dokumentteihin.

Nämä kaikki ovat external identity -tilanteita, vaikka jokaisen pääsytarve on erilainen.

Teknisesti hallittavia asioita voivat olla esimerkiksi:

- kuka saa kutsua ulkoisia käyttäjiä
- saako käyttäjä hyväksyä itse sovelluksia
- mitä tenantteja luotetaan
- vaaditaanko MFA ulkoisilta käyttäjiltä
- päättyykö pääsy automaattisesti
- tarkistetaanko guest-käyttäjät access reviewissä
- poistetaanko vanhat vieraskäyttäjät projektin jälkeen

**Elikkäs:**  
External identity tarkoittaa ulkopuolisen käyttäjän identiteettiä ja sen hallintaa. Guest user on yksi konkreettinen muoto, mutta external identity on koko ajattelumalli ulkopuolisten pääsyn hallintaan.

External käyttäjätunnus luodaan yleensä ext-etumerkillä esim: taikaviitta@ankkalinna.fi ja tällöin IdentityName voi olla esim 'EXT Taikaviitta'

---

## Group

**Group** - Ryhmä, johon käyttäjiä, laitteita tai muita objekteja voidaan lisätä. Ryhmän avulla voidaan hallita pääsyjä, lisenssejä, sovelluksia ja asetuksia usealle käyttäjälle kerralla.

Ryhmät ovat IAMissa todella tärkeitä, koska ne mahdollistavat oikeuksien hallinnan joukkona.

Sen sijaan, että jokaiselle käyttäjälle annettaisiin oikeuksia yksitellen, oikeus annetaan ryhmälle ja käyttäjä lisätään ryhmään.

Ryhmiä voidaan käyttää esimerkiksi:

- SharePoint-oikeuksiin
- Teams-tiimeihin
- sovelluspääsyihin
- lisenssien jakamiseen
- Conditional Access -kohdistuksiin
- access review -kohteisiin
- roolipohjaiseen pääsynhallintaan
- dynaamiseen jäsenyyteen

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on ryhmä `HR-Users`.

Kun Iines lisätään tähän ryhmään, hän voi saada:

- pääsyn HR-tiimin SharePoint-sivustoon
- pääsyn HR:n Teams-tiimiin
- oikeuden käyttää HR-sovellusta
- mahdollisesti HR-työhön liittyvän lisenssin
- näkyvyyden tiettyihin dokumentteihin

Jos Iines siirtyy pois HR-tiimistä, hänen pitäisi poistua ryhmästä. Muuten HR-oikeudet jäävät hänelle turhaan.

**Elikkäs:**  
Ryhmä on tapa hallita oikeuksia joukkona. Hyvin suunnitellut ryhmät tekevät IAMista hallittavaa. Huonosti nimetyt ja unohtuneet ryhmät tekevät siitä digitaalisen roskakaapin.

---

## Security Group

**Security Group** - Ryhmä, jota käytetään käyttöoikeuksien hallintaan. Sen avulla voidaan antaa pääsy järjestelmiin, tiedostoihin, sovelluksiin, SharePoint-sivustoihin tai muihin resursseihin.

Security group on usein teknisempi käyttöoikeusryhmä. Sitä voidaan käyttää esimerkiksi siihen, että vain tietyn ryhmän jäsenet pääsevät tiettyyn resurssiin.

Security group voi olla:

- assigned eli jäsenet lisätään käsin
- dynamic eli jäsenyys perustuu sääntöön
- cloud-only
- synkronoitu paikallisesta AD:stä
- käytössä sovelluksen pääsynhallinnassa
- käytössä lisenssien jakamisessa

**Esimerkkitilanne:**  
Ankkalinna Oy antaa `Finance-Reports-Read` -security groupille lukuoikeuden talousraportteihin.

Kun Roope lisätään tähän ryhmään, hän saa lukuoikeuden raportteihin.

Jos Roope tarvitsee vain lukuoikeuden, häntä ei pidä lisätä ryhmään `Finance-Reports-Edit` tai `Finance-Reports-Admin`.

Tässä näkyy least privilege -ajattelu: käyttäjälle annetaan vain se oikeus, jota hän oikeasti tarvitsee.

**Elikkäs:**  
Security group on käyttöoikeuksien jakamiseen tarkoitettu ryhmä. Se on tekninen “pääsylippulista” resurssiin.

---

## Microsoft 365 Group

**Microsoft 365 Group** - Ryhmä, joka luo yhteistyötilan Microsoft 365 -palveluihin. Se voi sisältää esimerkiksi sähköpostilaatikon, kalenterin, Teams-tiimin, SharePoint-sivuston, Plannerin ja tiedostot.

Microsoft 365 Group ei ole vain tavallinen käyttöoikeusryhmä. Sen ympärille voi syntyä kokonainen yhteistyöympäristö.

Kun Microsoft 365 Group luodaan, siihen voi liittyä esimerkiksi:

- group mailbox
- shared calendar
- SharePoint site
- Teams team
- Planner plan
- OneNote notebook
- tiedostokirjasto

Tästä syystä Microsoft 365 Groupien hallinta on tärkeää. Jos kuka tahansa saa luoda ryhmiä vapaasti ilman nimeämiskäytäntöä tai omistajuutta, ympäristöön voi syntyä nopeasti sekava määrä tiimejä ja sivustoja.

**Esimerkkitilanne:**  
Ankkalinna Oy perustaa projektitiimin nimeltä `Project Uusi Raportointi`.

Microsoft 365 Groupin mukana voi syntyä:

- Teams-tiimi projektikeskusteluille
- SharePoint-sivusto tiedostoille
- ryhmän sähköpostiosoite
- kalenteri projektin tapahtumille
- Planner tehtävienhallintaan

Jos projekti päättyy, pitäisi miettiä:

- arkistoidaanko ryhmä
- poistetaanko guest-käyttäjät
- kuka omistaa tiedostot
- pitääkö ryhmä säilyttää auditoinnin takia
- jääkö ryhmä roikkumaan ilman omistajaa

**Elikkäs:**  
Microsoft 365 Group ei ole vain ryhmä. Se on usein kokonainen yhteistyötila. Siksi sen luominen, nimeäminen, omistajuus ja poistaminen pitää miettiä kunnolla.

---

## Dynamic Group

**Dynamic Group** - Dynaaminen ryhmä, jonka jäsenyys määräytyy sääntöjen perusteella. Käyttäjiä lisätään tai poistetaan automaattisesti attribuuttien mukaan.

Dynamic group käyttää sääntöjä, jotka perustuvat käyttäjän tai laitteen attribuutteihin.

Sääntö voi perustua esimerkiksi:

- department
- jobTitle
- country
- city
- companyName
- employeeType
- userType
- device ownership
- operating system

Dynaamiset ryhmät ovat hyödyllisiä, jos attribuuttidata on laadukasta. Jos HR- tai AD-data on väärin, dynaaminen ryhmä tekee väärän päätöksen automaattisesti. Automaatio ei ole taikuutta. Se on vain nopea tapa tehdä oikein tai väärin.

**Esimerkkitilanne:**  
Ankkalinna Oy luo dynaamisen ryhmän kaikille HR-osaston käyttäjille.

Ajatustasolla sääntö voisi olla:

- käyttäjän department on HR
- käyttäjän account on enabled
- käyttäjän userType on Member

Kun uuden työntekijän department-attribuutiksi tulee `HR`, hän liittyy ryhmään automaattisesti.

Jos Iines siirtyy HR:stä tuotantoon ja department vaihtuu muotoon `Production`, hänen pitäisi poistua HR-ryhmästä automaattisesti.

Mutta jos department-attribuuttia ei päivitetä, Iines voi jäädä HR-ryhmään turhaan.

**Elikkäs:**  
Dynamic group toimii sääntöjen perusteella. Se on tehokas vain silloin, kun käyttäjätiedot ovat oikein.

---

## Assigned Group

**Assigned Group** - Ryhmä, johon käyttäjät lisätään käsin tai erillisen prosessin kautta. Jäsenyys ei perustu automaattiseen sääntöön.

Assigned group voi olla hyvä silloin, kun jäsenyys vaatii harkintaa, hyväksyntää tai poikkeaa selkeästä attribuuttisäännöstä.

Mutta manuaalisiin ryhmiin liittyy riski: jos kukaan ei poista käyttäjiä, ryhmäjäsenyydet jäävät helposti roikkumaan.

Assigned group vaatii yleensä hyvää prosessia:

- kuka saa pyytää jäsenyyttä
- kuka hyväksyy jäsenyyden
- kuka lisää käyttäjän
- milloin jäsenyys tarkistetaan
- milloin jäsenyys poistetaan
- jääkö muutoksesta audit trail

**Esimerkkitilanne:**  
Service Desk lisää Akun käsin `Reporting-Read` -ryhmään hyväksytyn tiketin perusteella.

Tikettiin pitäisi jäädä tieto:

- kuka pyysi oikeutta
- miksi oikeus tarvittiin
- kuka hyväksyi oikeuden
- mihin ryhmään käyttäjä lisättiin
- oliko oikeus määräaikainen
- kuka teki muutoksen

Jos Aku vaihtaa myöhemmin tehtävää, hänen ryhmäjäsenyytensä pitäisi tarkistaa.

**Elikkäs:**  
Assigned group on manuaalisempi ryhmä. Se on ihan ok, kun prosessi on kunnossa. Ilman tarkistuksia siitä tulee helposti access drift -kone.

---

## Administrative Unit

**Administrative Unit** - Hallinnollinen yksikkö Microsoft Entra ID:ssä. Sen avulla voidaan rajata hallintaoikeuksia tiettyyn käyttäjä- tai ryhmäjoukkoon.

Administrative Unit auttaa delegoimaan ylläpitoa ilman, että käyttäjälle annetaan liian laajoja oikeuksia koko tenanttiin.

Sen avulla voidaan esimerkiksi antaa tietyille ylläpitäjille oikeus hallita vain tietyn osaston, maan, koulun, toimipisteen tai liiketoimintayksikön käyttäjiä.

Administrative Unit voi auttaa least privilege -periaatteessa, koska admin-oikeus voidaan rajata pienempään kohteeseen.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on toimipisteet Joensuussa, Helsingissä ja Tampereella.

Joensuun paikalliselle IT-vastaavalle halutaan antaa oikeus hallita vain Joensuun käyttäjiä, ei koko organisaation käyttäjiä.

Tällöin voidaan luoda administrative unit nimeltä `Joensuu Users`.

Joensuun käyttäjät lisätään tähän administrative unitiin. IT-vastaavalle voidaan antaa esimerkiksi User Administrator -rooli vain tämän administrative unitin sisällä.

Näin hän voi auttaa Joensuun käyttäjiä, mutta ei pääse hallitsemaan koko Ankkalinna Oy:n tenanttia.

**Elikkäs:**  
Administrative Unit rajaa hallintaoikeuden tiettyyn osaan ympäristöstä. Se on tapa sanoa: “saat hallita näitä käyttäjiä, et koko valtakuntaa.”

---

## Administrative Unit

**Administrative Unit** - Hallinnollinen yksikkö Microsoft Entra ID:ssä. Sen avulla voidaan rajata hallintaoikeuksia tiettyyn käyttäjä-, ryhmä- tai laitejoukkoon.

Administrative Unit auttaa delegoimaan ylläpitoa ilman, että käyttäjälle annetaan liian laajoja oikeuksia koko tenanttiin.

Sen avulla voidaan esimerkiksi antaa tietyille ylläpitäjille oikeus hallita vain tietyn osaston, maan, koulun, toimipisteen tai liiketoimintayksikön käyttäjiä.

Administrative Unit tukee least privilege -periaatetta, koska admin-oikeus voidaan rajata pienempään kohteeseen.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on toimipisteet Joensuussa, Helsingissä ja Tampereella.

Joensuun paikalliselle IT-vastaavalle halutaan antaa oikeus hallita vain Joensuun käyttäjiä, ei koko organisaation käyttäjiä.

Ankkalinna Oy luo administrative unitin nimeltä `Joensuu Users`.

Joensuun käyttäjät lisätään tähän administrative unitiin. IT-vastaavalle voidaan antaa esimerkiksi User Administrator -rooli vain tämän administrative unitin sisällä.

Tällöin hän voi auttaa Joensuun käyttäjiä, mutta ei pääse hallitsemaan koko Ankkalinna Oy:n tenanttia.

**Tekninen huomio:**  
Administrative Unit ei ole sama asia kuin ryhmä. Ryhmää käytetään usein oikeuksien antamiseen resursseihin. Administrative Unit taas rajaa hallinnollista vastuualuetta.

**Elikkäs:**  
Administrative Unit rajaa hallintaoikeuden tiettyyn osaan ympäristöstä. Se on tapa sanoa: “saat hallita näitä käyttäjiä, et koko valtakuntaa.”

---

## Role

**Role** - Rooli, joka antaa käyttäjälle oikeuden tehdä tiettyjä hallintatoimia Microsoft Entra ID:ssä tai Microsoft 365 -ympäristössä.

Rooli määrittää, mitä käyttäjä saa hallita.

Entra ID:ssä roolit liittyvät usein ylläpitoon ja hallintaan. Esimerkiksi yksi rooli voi antaa oikeuden hallita käyttäjiä, toinen ryhmiä ja kolmas sovelluksia.

Roolit ovat tärkeitä, koska admin-oikeuksia ei pitäisi antaa “varmuuden vuoksi”. Käyttäjälle pitäisi antaa vain se rooli, jota hän tarvitsee työnsä tekemiseen.

**Esimerkkitilanne:**  
Ankkalinna Oy:n Service Desk tarvitsee oikeuden auttaa käyttäjiä perusasioissa.

Kaikille Service Desk -työntekijöille ei anneta Global Administrator -roolia, koska se olisi aivan liian laaja oikeus.

Sen sijaan voidaan miettiä tarkemmin:

- tarvitseeko henkilö oikeuden hallita käyttäjiä
- tarvitseeko hän oikeuden resetoida salasanoja
- tarvitseeko hän oikeuden hallita ryhmiä
- tarvitseeko hän oikeuden hallita lisenssejä
- tarvitseeko hän oikeuden nähdä kirjautumislokeja

Näiden perusteella valitaan sopivampi rooli tai roolien yhdistelmä.

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
Built-in role voi joskus sisältää enemmän oikeuksia kuin nimi antaa ymmärtää. Siksi roolin sisältö pitää tarkistaa ennen käyttöönottoa.

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

**Riski:**  
Vaikka rooli kuulostaa kevyeltä, salasanoihin ja kirjautumiseen liittyvä rooli on aina herkkä. Jos väärä henkilö saa sen, hän voi vaikuttaa käyttäjien pääsyyn.

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

**Riski:**  
Ryhmäadmin ei välttämättä näytä yhtä pelottavalta kuin Global Admin, mutta ryhmien kautta voi kulkea todella paljon käyttöoikeuksia.

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

**Elikkäs:**  
Application Administrator hallitsee sovelluksia. Tämä ei ole vain “lisää appi listaan” -rooli, koska sovellusten kautta voi kulkea paljon identiteetti- ja käyttöoikeusriskiä.

---

## Cloud Application Administrator

**Cloud Application Administrator** - Rooli, jolla voidaan hallita pilvisovelluksia ja sovelluksiin liittyviä asetuksia Microsoft Entra ID:ssä.

Cloud Application Administrator muistuttaa Application Administrator -roolia, mutta roolien tarkka ero ja oikeudet pitää aina tarkistaa Microsoftin dokumentaatiosta ja organisaation tarpeesta.

Tätä roolia voidaan käyttää sovellusten hallintaan ilman, että käyttäjälle annetaan laajempia koko tenantin admin-oikeuksia.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä IAM-tiimin jäsen vastaa SaaS-sovellusten SSO-määrityksistä.

Hänelle voidaan harkita Cloud Application Administrator -roolia, jos hänen pitää hallita sovelluksia, mutta ei käyttäjiä, ryhmiä tai tenantin muita asetuksia laajasti.

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

**Riski:**  
Tunnistautumismenetelmien hallinta on herkkä oikeus. Jos hyökkääjä saa tällaisen roolin, hän voi yrittää vaikuttaa siihen, miten käyttäjät todentavat itsensä.

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

**Elikkäs:**  
Security Reader saa katsoa, mutta ei säätää. Tämä on usein hyvä analysointiin ja oppimiseen.

---

## Security Administrator

**Security Administrator** - Rooli, jolla voidaan hallita tietoturvaan liittyviä asetuksia ja toimintoja.

Security Administrator on vahvempi kuin Security Reader, koska se voi sisältää muokkausoikeuksia tietoturva-asetuksiin.

**Esimerkkitilanne:**  
Ankkalinna Oy:n tietoturvatiimi hallitsee tietoturva-asetuksia, hälytyksiä ja suojauskäytäntöjä.

Security Administrator -roolia voidaan käyttää henkilölle, jonka tehtävä on oikeasti hallita näitä asetuksia, ei vain katsoa raportteja.

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

**Elikkäs:**  
SharePoint Administrator hallitsee SharePointia, mutta tiedon omistajuus ja käyttöoikeuspäätökset pitää silti miettiä erikseen.

---

## Teams Administrator

**Teams Administrator** - Rooli, jolla hallitaan Microsoft Teamsiin liittyviä asetuksia.

Teams Administrator voi vaikuttaa esimerkiksi Teams-käytäntöihin, kokousasetuksiin, viestintäasetuksiin ja Teams-ympäristön hallintaan.

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa rajoittaa, ketkä saavat luoda uusia Teams-tiimejä ja miten ulkoisia käyttäjiä voidaan kutsua mukaan.

Teams Administrator voi olla mukana määrittämässä Teamsin hallintakäytäntöjä.

**IAM-näkökulma:**  
Teams ei ole vain keskustelusovellus. Teams-tiimeihin liittyy usein Microsoft 365 Group, SharePoint-sivusto, tiedostot ja mahdollisesti guest-käyttäjiä.

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

**Elikkäs:**  
Privileged role on tavallista vahvempi oikeus. Sitä pitää kohdella kuin terävää veistä: hyödyllinen oikeissa käsissä, vaarallinen väärissä.

---

## Least Privilege admin-rooleissa

**Least Privilege admin-rooleissa** - Periaate, jossa ylläpitäjälle annetaan vain ne hallintaoikeudet, joita hän oikeasti tarvitsee tehtävänsä tekemiseen.

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

**Elikkäs:**  
Least privilege admin-rooleissa tarkoittaa: älä anna isompaa avainta kuin tehtävä vaatii.

---

## Device

**Device** - Laiteobjekti Microsoft Entra ID:ssä. Device voi olla esimerkiksi Windows-työasema, kannettava tietokone, puhelin tai tabletti, joka näkyy organisaation identiteetti- ja laitehallinnassa.

Entra ID:ssä laite ei ole vain “kone listassa”. Laiteobjektiin voi liittyä tietoa esimerkiksi siitä:

- mikä laitteen nimi on
- kuka laitteen omistaa tai käyttää
- onko laite Entra joined, hybrid joined vai registered
- onko laite hallittu
- onko laite compliant
- milloin laitetta on viimeksi käytetty kirjautumiseen
- liittyykö laitteeseen käyttäjän kirjautumisia
- voiko Conditional Access käyttää laitteen tilaa pääsyn ehtona

Laite on tärkeä osa modernia pääsynhallintaa, koska kirjautumisessa ei katsota enää vain käyttäjää ja salasanaa.

Nykyään voidaan kysyä myös:

- millä laitteella käyttäjä kirjautuu?
- onko laite organisaation hallinnassa?
- onko laite suojattu?
- onko laite päivitetty?
- onko laite merkitty compliantiksi?
- onko kyseessä käyttäjän oma puhelin vai työlaite?

**Esimerkkitilanne:**  
Aku Ankka yrittää kirjautua Ankkalinna Oy:n SharePointiin työläppärillään.

Microsoft Entra ID tunnistaa Akun käyttäjän ja laitteen.

Conditional Access -sääntö voi tarkistaa esimerkiksi:

- käyttäjä on Aku Ankka
- sovellus on SharePoint Online
- laite on Ankkalinna Oy:n hallitsema työlaite
- laite on compliant
- MFA on suoritettu
- kirjautuminen tulee normaalista sijainnista

Jos kaikki ehdot täyttyvät, pääsy sallitaan.

Jos Aku yrittää kirjautua samaan SharePointiin tuntemattomalta kotikoneelta, pääsy voidaan estää tai vaatia lisävahvistuksia.

**Elikkäs:**  
Device on laitteen digitaalinen identiteetti Entrassa. Se auttaa päättämään, voiko käyttäjä päästä palveluun juuri tällä laitteella.

---

## Device Identity

**Device Identity** - Laitteen identiteetti Microsoft Entra ID:ssä. Samalla tavalla kuin käyttäjällä on digitaalinen identiteetti, myös laitteella voi olla oma tunnistettava identiteetti.

Device identityn avulla organisaatio voi tunnistaa laitteen eikä pelkästään käyttäjää.

Tämä on tärkeää, koska käyttäjän salasana ja MFA eivät yksin kerro, onko laite turvallinen.

Laiteidentiteetti voi auttaa vastaamaan kysymyksiin:

- onko tämä organisaation työlaite?
- onko tämä käyttäjän henkilökohtainen laite?
- onko laite liittynyt Entra ID:hen?
- onko laite rekisteröity?
- onko laite hallinnassa Intunessa?
- voiko laitetta käyttää luottamustekijänä Conditional Accessissa?

**Esimerkkitilanne:**  
Iines kirjautuu Ankkalinna Oy:n Teamsiin kahdella eri laitteella.

Ensimmäinen on Ankkalinnan hallitsema työläppäri. Toinen on Iineksen henkilökohtainen kotikone.

Molemmissa kirjautuja on sama henkilö, mutta laitteet eivät ole samanarvoisia.

Työläppäri voi olla Entra joined ja Intune-hallittu. Kotikone voi olla täysin organisaation hallinnan ulkopuolella.

Ankkalinna Oy voi päättää, että arkaluontoisiin tiedostoihin pääsee vain laitteelta, joka on tunnistettu ja hallittu.

**Elikkäs:**  
Device identity tarkoittaa, että myös laitteella on identiteetti. IAMissa ei katsota vain “kuka kirjautuu”, vaan myös “millä laitteella kirjautuu”.

---

## Entra Joined Device

**Entra Joined Device** - Laite, joka on liitetty suoraan Microsoft Entra ID:hen. Käytetään usein moderneissa pilvipohjaisissa työasemaympäristöissä.

Entra joined -laite ei tarvitse perinteistä paikallista Active Directory -domainia samalla tavalla kuin vanhemmissa ympäristöissä.

Laite kuuluu suoraan Microsoft Entra ID:hen, ja sitä voidaan usein hallita Microsoft Intunen kautta.

Entra joined -laitteeseen voi liittyä esimerkiksi:

- käyttäjä kirjautuu työ- tai koulutilillä
- laite näkyy Entra ID:ssä
- laite voidaan hallita Intunella
- Conditional Access voi käyttää laitteen tilaa
- Windows Hello for Business voi olla käytössä
- laite voi olla osa modernia cloud-first-ympäristöä

**Esimerkkitilanne:**  
Ankkalinna Oy ottaa käyttöön uuden toimintamallin, jossa uudet Windows-läppärit eivät liity enää paikalliseen AD-domainiin.

Kun Tupu Ankka saa uuden työläppärin, hän avaa koneen ja kirjautuu Ankkalinna Oy:n työtilillä.

Laite liittyy suoraan Microsoft Entra ID:hen.

Sen jälkeen laitteelle voidaan tuoda asetuksia ja sovelluksia Intunen kautta.

Tupu voi käyttää Microsoft 365 -palveluita, ja Conditional Access voi tunnistaa laitteen organisaation hallituksi työasemaksi.

**Hyötyjä:**  

- sopii moderniin pilvipohjaiseen työympäristöön
- ei vaadi välttämättä perinteistä AD-domain-liitosta
- toimii hyvin Intunen ja Microsoft 365:n kanssa
- tukee modernia laitehallintaa
- helpottaa etätyölaitteiden käyttöönottoa

**Riski tai huomio:**  
Jos organisaatiolla on paljon vanhoja paikallisia järjestelmiä, pelkkä Entra joined -malli ei välttämättä riitä ilman muuta suunnittelua.

**Elikkäs:**  
Entra joined device on työlaite, joka kuuluu suoraan Microsoftin pilvi-identiteettiin. Se on modernimpi malli kuin perinteinen “kone domainiin ja menoksi”.

---

## Hybrid Joined Device

**Hybrid Joined Device** - Laite, joka on liitetty sekä paikalliseen Active Directoryyn että Microsoft Entra ID:hen.

Hybrid joined -laite elää kahdessa maailmassa:

- paikallisessa Active Directoryssa
- Microsoft Entra ID:ssä

Tämä on yleistä ympäristöissä, joissa organisaatiolla on vielä paikallista infraa, vanhoja sovelluksia tai perinteisiä AD-riippuvuuksia, mutta samalla käytetään Microsoft 365 -pilvipalveluita.

Hybrid joined -laitteeseen voi liittyä esimerkiksi:

- laite on domain joined paikalliseen AD:hen
- laite näkyy myös Entra ID:ssä
- käyttäjä käyttää samaa organisaatiotiliä
- Conditional Access voi tunnistaa laitteen
- Intune-hallinta voi olla mahdollinen co-management- tai hybrid-mallissa
- laite voi käyttää sekä paikallisia että pilvipalveluita

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on vanhempi Windows-ympäristö, jossa työasemat ovat paikallisessa AD-domainissa.

Käyttäjät tarvitsevat edelleen pääsyn paikallisiin tiedostopalvelimiin, tulostimiin ja vanhoihin tuotantojärjestelmiin.

Samalla Ankkalinna käyttää Microsoft 365:tä, Teamsia ja SharePointia.

Työasemat ovat hybrid joined -tilassa, jolloin ne näkyvät sekä paikallisessa AD:ssä että Entra ID:ssä.

Kun Aku kirjautuu työasemalleen, hän käyttää AD-tunnusta. Kun hän käyttää Microsoft 365 -palveluita, Entra ID tunnistaa myös laitteen osana organisaation ympäristöä.

**Hyötyjä:**  

- sopii siirtymävaiheen ympäristöihin
- tukee paikallisia AD-riippuvuuksia
- mahdollistaa Microsoft 365:n ja Conditional Accessin käytön
- auttaa organisaatioita siirtymään asteittain pilvimalliin

**Riski tai huomio:**  
Hybrid-malli voi olla monimutkaisempi ylläpitää. Jos AD:n, Entran, Intunen ja synkronoinnin välistä suhdetta ei ymmärretä, vianhaku voi muuttua aikamoiseksi villasukka-kauhuelokuvaksi.

**Elikkäs:**  
Hybrid joined device on laite, joka kuuluu sekä vanhaan AD-maailmaan että uuteen Entra-maailmaan. Hyvä siirtymävaiheessa, mutta vaatii ymmärrystä.

---

## Registered Device

**Registered Device** - Laite, joka on rekisteröity Microsoft Entra ID:hen, mutta ei välttämättä ole organisaation täysin hallitsema työlaite.

Registered device liittyy usein tilanteisiin, joissa käyttäjä käyttää omaa laitettaan työpalveluihin.

Laite voidaan rekisteröidä Entra ID:hen, jotta organisaatio tunnistaa sen, mutta se ei tarkoita samaa kuin että laite olisi kokonaan organisaation omistama tai hallitsema.

Registered device voi olla esimerkiksi:

- käyttäjän oma puhelin
- käyttäjän oma tabletti
- henkilökohtainen Windows-laite
- laite, jolla käytetään työ- tai koulutiliä

**Esimerkkitilanne:**  
Iines Ankka käyttää omaa puhelintaan työsähköpostin lukemiseen.

Kun hän lisää Ankkalinna Oy:n työtilin Outlook-mobiilisovellukseen, laite voi rekisteröityä Microsoft Entra ID:hen.

Ankkalinna Oy näkee, että Iineksen puhelinta käytetään kirjautumiseen, mutta laite ei välttämättä ole samalla tavalla hallittu kuin työläppäri.

Organisaatio voi silti vaatia esimerkiksi:

- MFA:n
- sovellussuojakäytännöt
- hyväksytyn mobiilisovelluksen
- laitteen rekisteröinnin
- pääsyn rajaamisen vain tiettyihin palveluihin

**Riski tai huomio:**  
Registered device ei automaattisesti tarkoita, että laite on turvallinen tai organisaation täysin hallinnassa.

Jos organisaatio sallii henkilökohtaiset laitteet, pitää miettiä:

- mitä tietoa niille saa avata
- saako tiedostoja ladata laitteelle
- pitääkö käyttää Intune App Protection Policies -sääntöjä
- voidaanko työdata poistaa laitteelta
- estetäänkö pääsy tuntemattomilta laitteilta

**Elikkäs:**  
Registered device on tunnistettu laite, mutta ei välttämättä täysin hallittu työlaite. Se on eri asia kuin Entra joined tai hybrid joined.

---

## Device Compliance

**Device Compliance** - Laitteen vaatimustenmukaisuus. Compliance kertoo, täyttääkö laite organisaation määrittelemät turvallisuusvaatimukset.

Compliance liittyy usein Microsoft Intuneen.

Laite voidaan merkitä compliantiksi, jos se täyttää määritellyt ehdot.

Ehtoja voivat olla esimerkiksi:

- laitteessa on salaus käytössä
- laitteessa on PIN-koodi tai salasana
- käyttöjärjestelmä on tarpeeksi uusi
- laite ei ole jailbroken tai rooted
- Defender tai muu suojaus on kunnossa
- laitteessa ei ole liian suurta riskiä
- laite kuuluu organisaation hallintaan

Conditional Access voi käyttää compliance-tietoa pääsyn ehtona.

**Esimerkkitilanne:**  
Ankkalinna Oy määrittää säännön:

> HR-dokumentteihin pääsee vain compliant-laitteelta.

Iines yrittää avata HR SharePoint -sivuston työläppäriltään.

Intune kertoo, että laite on compliant:

- BitLocker on päällä
- Defender on kunnossa
- Windows on päivitetty
- laite on hallittu

Pääsy sallitaan.

Jos Iines yrittää avata saman sivuston omalta vanhalta kotikoneeltaan, joka ei ole hallinnassa eikä compliant, pääsy voidaan estää.

**Elikkäs:**  
Device compliance kertoo, täyttääkö laite organisaation turvallisuusvaatimukset. Pääsyä ei tarvitse antaa vain käyttäjän perusteella, vaan myös laitteen kunto voidaan tarkistaa.

---

## Managed Device

**Managed Device** - Laite, jota organisaatio hallitsee laitehallintaratkaisun, kuten Microsoft Intunen, kautta.

Managed device voi saada organisaation määrittämiä asetuksia, sovelluksia, suojauskäytäntöjä ja rajoituksia.

Hallittu laite voi olla esimerkiksi:

- Windows-työläppäri
- työpuhelin
- tabletti
- kioskilaite
- jaettu työasema

Managed device -ajattelussa organisaatio ei vain luota siihen, että käyttäjä toimii oikein, vaan laitteelle asetetaan teknisiä hallintakäytäntöjä.

**Esimerkkitilanne:**  
Ankkalinna Oy antaa Akulle työläppärin.

Laite on Microsoft Intunen hallinnassa.

Intune voi määrittää laitteelle esimerkiksi:

- BitLocker-salauksen
- Defender-asetukset
- Windows-päivitykset
- pakolliset sovellukset
- Wi-Fi- tai VPN-profiilit
- selaimen asetukset
- salasanavaatimukset
- rajoitukset paikallisille admin-oikeuksille

Kun Aku kirjautuu Microsoft 365:een, Conditional Access voi tarkistaa, että laite on hallittu ja compliant ennen kuin pääsy sallitaan.

**Elikkäs:**  
Managed device on organisaation hallitsema laite. Sitä ei vain tunnisteta, vaan siihen voidaan oikeasti työntää asetuksia ja vaatimuksia.

---

## Unmanaged Device

**Unmanaged Device** - Laite, jota organisaatio ei hallitse. Se voi olla esimerkiksi käyttäjän henkilökohtainen tietokone tai puhelin.

Unmanaged device voi silti yrittää käyttää organisaation palveluita, jos käyttäjä kirjautuu työtilillä.

Tällöin organisaation pitää päättää, sallitaanko pääsy ja millä ehdoilla.

Mahdollisia ehtoja ovat esimerkiksi:

- vaaditaan MFA
- sallitaan vain selainkäyttö
- estetään tiedostojen lataaminen
- estetään pääsy kokonaan
- sallitaan vain tietyt sovellukset
- käytetään app protection -käytäntöjä mobiilisovelluksissa

**Esimerkkitilanne:**  
Hannu Hanhi yrittää kirjautua Ankkalinna Oy:n SharePointiin omalta kotikoneeltaan.

Kotikone ei ole organisaation hallinnassa.

Ankkalinna Oy:n Conditional Access -sääntö voi sallia selaimessa katselun, mutta estää tiedostojen lataamisen.

Tai jos kyse on arkaluontoisesta materiaalista, pääsy voidaan estää kokonaan.

**Elikkäs:**  
Unmanaged device on laite, johon organisaatio ei oikeasti pysty luottamaan samalla tavalla kuin hallittuun työvälineeseen.

---

## Device-Based Conditional Access

**Device-Based Conditional Access** - Conditional Access -malli, jossa pääsyehtoihin vaikuttaa laitteen tila, tyyppi tai hallinnan taso.

Tässä ei katsota pelkästään käyttäjää, vaan myös laitetta.

Ehtoja voivat olla esimerkiksi:

- vaaditaan compliant device
- vaaditaan hybrid joined device
- estetään tuntemattomat laitteet
- sallitaan vain hallitut laitteet
- rajoitetaan selainkäyttöä hallitsemattomilla laitteilla
- vaaditaan MFA, jos laite ei ole luotettu

**Esimerkkitilanne:**  
Ankkalinna Oy määrittää säännön:

> Talousraportteihin pääsee vain hallitulta ja compliant-laitteelta.

Roope kirjautuu työläppäriltä, joka on Entra joined, Intune-hallittu ja compliant.

Pääsy sallitaan.

Roope yrittää myöhemmin kirjautua samalle sivustolle henkilökohtaiselta kotikoneelta.

Pääsy estetään, vaikka käyttäjätunnus ja salasana olisivat oikein.

**Elikkäs:**  
Device-based Conditional Access tarkoittaa, että pääsy riippuu myös laitteesta. Oikea käyttäjä väärällä laitteella ei välttämättä riitä.

---

## Primary User

**Primary User** - Laitteeseen liitetty ensisijainen käyttäjä. Tämä on usein henkilö, joka käyttää laitetta pääasiallisesti.

Primary user voi näkyä esimerkiksi Intunessa tai laitteen hallintatiedoissa.

Se auttaa ymmärtämään, kenelle laite kuuluu tai kuka sitä käyttää.

**Esimerkkitilanne:**  
Ankkalinna Oy:n työläppäri `ANKKA-LT-102` on annettu Aku Ankalle.

Intunessa laitteen primary user on Aku Ankka.

Jos laitteessa on ongelmia, Service Desk näkee helpommin, keneen laite liittyy.

Jos Aku vaihtaa laitetta tai laite annetaan toiselle käyttäjälle, primary user -tieto pitää päivittää, ettei hallintatieto jää vääräksi.

**Elikkäs:**  
Primary user kertoo, kuka on laitteen pääasiallinen käyttäjä. Tämä auttaa laitehallinnassa ja vianhaussa.

---

## Device Ownership

**Device Ownership** - Tieto siitä, onko laite organisaation omistama vai käyttäjän henkilökohtainen laite.

Laitteen omistajuus vaikuttaa siihen, miten vahvasti organisaatio voi hallita laitetta ja mitä pääsyjä sille kannattaa sallia.

Tyypillisiä omistajuuksia ovat:

- corporate-owned
- personally-owned

Corporate-owned-laite on organisaation omistama työlaite.

Personally-owned-laite on käyttäjän oma laite.

**Esimerkkitilanne:**  
Ankkalinna Oy antaa Iinekselle työpuhelimen. Se on corporate-owned-laite ja sitä voidaan hallita tiukemmin.

Hannu taas käyttää omaa henkilökohtaista puhelintaan työsähköpostin lukemiseen. Se on personally-owned-laite.

Ankkalinna Oy voi päättää, että henkilökohtaisilla laitteilla saa käyttää vain Outlook-mobiilisovellusta app protection -käytännöillä, mutta ei ladata tiedostoja vapaasti laitteelle.

**Elikkäs:**  
Device ownership kertoo, kenen laite on. Työlaite ja oma laite eivät ole sama asia, eikä niitä pitäisi kohdella samalla luottamustasolla.

---

## Stale Device

**Stale Device** - Vanha tai käyttämättömäksi jäänyt laiteobjekti, jota ei ole käytetty pitkään aikaan.

Stale device voi syntyä esimerkiksi, kun:

- käyttäjä saa uuden laitteen
- vanha laite poistetaan käytöstä
- laite asennetaan uudelleen
- käyttäjä lähtee organisaatiosta
- laitetta ei poisteta Entra ID:stä tai Intunesta
- laitteen hallintatieto jää roikkumaan

Stale device -objektit voivat sotkea raportointia, laitehallintaa ja pääsynhallintaa.

**Esimerkkitilanne:**  
Aku Ankka sai uuden työläppärin keväällä.

Vanha laite `ANKKA-LT-044` jäi kuitenkin näkyviin Entra ID:hen, vaikka sitä ei ole käytetty kahdeksaan kuukauteen.

Kun IT tarkistaa laitteita, vanha laite näyttää edelleen olevan olemassa.

Jos ympäristöä ei siivota, laitelistat paisuvat ja on vaikeampi tietää, mitkä laitteet ovat oikeasti käytössä.

**Riski:**  
Jos vanhoja laiteobjekteja ei tarkisteta, organisaatio voi luulla hallitsevansa laitteita paremmin kuin oikeasti hallitsee.

**Elikkäs:**  
Stale device on vanha laiteobjekti, joka on jäänyt roikkumaan. Sama vaiva kuin vanhoissa käyttäjätileissä: jos niitä ei siivota, ympäristö muuttuu epäselväksi.

---

## Device Lifecycle

**Device Lifecycle** - Laitteen elinkaari alusta loppuun. Se kattaa laitteen käyttöönoton, hallinnan, käytön, omistajan vaihdoksen, poistamisen ja tietojen siivouksen.

Laitteen elinkaari liittyy IAMiin, koska laite voi vaikuttaa käyttäjän pääsyyn.

Device lifecycleen voi kuulua esimerkiksi:

- laitteen hankinta
- laitteen rekisteröinti tai join
- käyttäjän määrittäminen laitteelle
- hallintakäytäntöjen asentuminen
- compliance-tilan seuranta
- laitteen vaihto
- laitteen kadottaminen
- käyttäjän työsuhteen päättyminen
- laitteen tyhjennys
- laitteen poistaminen Entra ID:stä ja Intunesta

**Esimerkkitilanne:**  
Tupu Ankka aloittaa Ankkalinna Oy:ssä.

Hänelle annetaan uusi työläppäri.

Hyvä device lifecycle voisi mennä näin:

1. Laite hankitaan ja merkitään organisaation omaisuudeksi.
2. Laite liitetään Entra ID:hen.
3. Laite liitetään Intune-hallintaan.
4. Tarvittavat sovellukset ja asetukset asentuvat.
5. Tupu merkitään laitteen primary useriksi.
6. Laite muuttuu compliantiksi.
7. Tupu saa pääsyn työpalveluihin hallitulta laitteelta.
8. Kun laite vaihdetaan, vanha laite tyhjennetään.
9. Vanha laite poistetaan hallinnasta ja hakemistosta.

**Elikkäs:**  
Device lifecycle tarkoittaa, että myös laitteella on oma elinkaari. Laite pitää ottaa käyttöön, hallita ja poistaa siististi, muuten se jää kummittelemaan ympäristöön.
