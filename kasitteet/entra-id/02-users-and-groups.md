# 02 - Users and Groups

Tämä sivu kokoaa Microsoft Entra ID:n käyttäjiin, ulkoisiin identiteetteihin, ryhmiin ja hallinnollisiin rajauksiin liittyviä käsitteitä.

Tavoite on ymmärtää, miten käyttäjiä ja ryhmiä käytetään käyttöoikeuksien, yhteistyön, automaation ja hallinnan perustana.

IAM-näkökulmasta käyttäjä ei ole vain “tunnus järjestelmässä”. Käyttäjään liittyy identiteetti, attribuutit, ryhmäjäsenyydet, käyttöoikeudet, lisenssit, kirjautuminen, roolit ja elinkaari.

---

## Contents

- [User](#user)
- [Member User](#member-user)
- [Guest User](#guest-user)
- [External Identity](#external-identity)
- [Group](#group)
- [Security Group](#security-group)
- [Microsoft 365 Group](#microsoft-365-group)
- [Dynamic Group](#dynamic-group)
- [Assigned Group](#assigned-group)
- [Group Owner](#group-owner)
- [Group Membership](#group-membership)
- [Nested Group](#nested-group)
- [Administrative Unit](#administrative-unit)

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

**Tekninen huomio:**  
Käyttäjän attribuutit ovat todella tärkeitä, koska niitä voidaan käyttää esimerkiksi dynaamisissa ryhmissä, käyttöoikeusmalleissa, automaatiossa, raportoinnissa ja access revieweissä.

Jos käyttäjän department, jobTitle tai manager on väärin, sen päälle rakennettu käyttöoikeuslogiikka voi myös mennä väärin.

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

**Tekninen huomio:**  
Member user ei tarkoita automaattisesti “turvallinen käyttäjä”. Sisäinen käyttäjäkin tarvitsee least privilege -periaatteen, MFA:n, oikeat ryhmät, selkeän elinkaaren ja säännölliset käyttöoikeustarkistukset.

**Elikkäs:**  
Member user on talon oma käyttäjä. Yleensä työntekijä tai sisäinen käyttäjä, jonka identiteettiä organisaatio hallitsee suoraan.

---

## Guest User

**Guest User** - Ulkopuolinen käyttäjä, joka näkyy organisaation Microsoft Entra ID:ssä vieraskäyttäjänä. Guest user ei ole organisaation oma sisäinen työntekijä, mutta hänelle voidaan antaa rajattu pääsy esimerkiksi Teamsiin, SharePointiin, sovellukseen tai projektiresurssiin.

Guest-käyttäjä liittyy usein Microsoft Entra B2B -yhteistyöhön. Hän voi käyttää omaa kotiorganisaationsa tunnusta, mutta hänestä syntyy vierasobjekti kutsuvan organisaation tenanttiin.

Teknisesti guest-käyttäjällä voi olla Ankkalinna Oy:n tenantissa oma käyttäjäobjekti, jonka user type on `Guest`. Hänen varsinainen tunnistautumisensa voi kuitenkin tapahtua hänen oman organisaationsa kautta.

Guest-käyttäjiä pitää hallita tarkasti, koska ulkopuolisten pääsyt unohtuvat helposti projektin päätyttyä.

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

**Riski:**  
Guest-käyttäjä voi jäädä roikkumaan tenanttiin projektin jälkeen. Jos ulkoisia käyttäjiä ei tarkisteta säännöllisesti, ympäristöön kertyy pääsyjä henkilöille, joilla ei ole enää työperusteista tarvetta.

**Elikkäs:**  
Guest user on ulkopuolinen käyttäjä, joka on kutsuttu organisaation ympäristöön yhteistyötä varten. Hän ei ole talon oma käyttäjä, mutta hänelle voidaan antaa rajattu ja valvottu pääsy tiettyihin resursseihin.

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

**Tekninen huomio:**  
External identity ei ole vain “kutsutaan joku Teamsiin”. Se on osa pääsynhallintaa, riskienhallintaa ja yhteistyön kontrollointia.

**Elikkäs:**  
External identity tarkoittaa ulkopuolisen käyttäjän identiteettiä ja sen hallintaa. Guest user on yksi konkreettinen muoto, mutta external identity on koko ajattelumalli ulkopuolisten pääsyn hallintaan.

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

**Tekninen huomio:**  
Ryhmä on yksi yleisimmistä tavoista antaa oikeuksia. Siksi ryhmien nimeämiskäytäntö, omistajuus, dokumentointi ja tarkistaminen ovat tärkeitä.

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

**Riski:**  
Jos security groupin merkitystä ei ymmärretä, käyttäjä voidaan lisätä väärään ryhmään ja hän saa liian laajat oikeudet.

**Elikkäs:**  
Security group on käyttöoikeuksien jakamiseen tarkoitettu ryhmä. Se on tekninen pääsylippulista resurssiin.

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

**Riski:**  
Microsoft 365 Group voi näyttää “vain Teams-tiimiltä”, mutta taustalla se voi sisältää SharePointin, tiedostoja, sähköpostia ja ulkoisia käyttäjiä. Ei siis mikään ihan harmiton pikku ryhmä.

**Elikkäs:**  
Microsoft 365 Group ei ole vain ryhmä. Se on usein kokonainen yhteistyötila. Siksi sen luominen, nimeäminen, omistajuus ja poistaminen pitää miettiä kunnolla.

---

## Dynamic Group

**Dynamic Group** - Dynaaminen ryhmä, jonka jäsenyys määräytyy sääntöjen perusteella. Käyttäjiä lisätään tai poistetaan automaattisesti käyttäjän tai laitteen attribuuttien mukaan.

Dynamic group käyttää sääntöjä, jotka perustuvat esimerkiksi käyttäjän tietoihin.

Sääntö voi perustua esimerkiksi:

- department
- jobTitle
- country
- city
- companyName
- employeeType
- userType
- manager-tietoon
- laitteen ominaisuuksiin

Dynaamiset ryhmät ovat hyödyllisiä, jos attribuuttidata on laadukasta. Jos HR- tai AD-data on väärin, dynaaminen ryhmä tekee väärän päätöksen automaattisesti.

Automaatio ei ole taikuutta. Se on vain nopea tapa tehdä oikein tai väärin.

**Esimerkkitilanne 1: HR-ryhmä attribuutin perusteella**  
Ankkalinna Oy luo dynaamisen ryhmän kaikille HR-osaston käyttäjille.

Ajatustasolla sääntö voisi olla:

- käyttäjän department on HR
- käyttäjän account on enabled
- käyttäjän userType on Member

Kun uuden työntekijän department-attribuutiksi tulee `HR`, hän liittyy ryhmään automaattisesti.

Jos Iines siirtyy HR:stä tuotantoon ja department vaihtuu muotoon `Production`, hänen pitäisi poistua HR-ryhmästä automaattisesti.

Mutta jos department-attribuuttia ei päivitetä, Iines voi jäädä HR-ryhmään turhaan.

**Esimerkkitilanne 2: esihenkilöiden pyyntösivusto**  
Ankkalinna Oy haluaa tehdä esihenkilöille oman sisäisen sivuston, jonka kautta he voivat pyytää työntekijöilleen käyttöoikeuksia, lisenssejä tai kulkulupia.

Sivusto ei saa näkyä kaikille työntekijöille, vaan vain henkilöille, jotka ovat oikeasti esihenkilöitä.

Ankkalinna Oy luo dynaamisen ryhmän nimeltä `Managers`.

Ryhmän jäsenyys voi perustua esimerkiksi HR-järjestelmästä tulevaan tietoon:

- käyttäjän työnimike on esihenkilö
- käyttäjällä on alaisia
- käyttäjän employeeType on manager
- käyttäjän account on aktiivinen

Kun Roope Ankka on merkitty HR-järjestelmässä esihenkilöksi, hän kuuluu automaattisesti `Managers`-ryhmään ja pääsee esihenkilöiden käyttöoikeuspyyntösivustolle.

Sivustolla Roope voi tehdä pyynnön esimerkiksi:

- “Tilaa työntekijälle Microsoft 365 -lisenssi”
- “Pyydä pääsy raportointijärjestelmään”
- “Pyydä kulkulupa tuotantotiloihin”
- “Pyydä käyttäjälle pääsy tiettyyn sovellukseen”

Kun pyyntö tehdään, se ei anna oikeutta automaattisesti suoraan käyttäjälle. Sen sijaan pyyntö lähtee määritellyn prosessin mukaisesti oikealle taholle, esimerkiksi:

- järjestelmän pääkäyttäjälle
- lisenssien hallinnasta vastaavalle tiimille
- Service Deskiin
- tietoturvatiimille
- HR:lle
- fyysisen kulunhallinnan vastuuhenkilölle

Näin dynamic group auttaa rajaamaan, kuka saa aloittaa tällaisen pyynnön.

Se ei kuitenkaan yksin ole koko hyväksyntäprosessi. Se toimii osana hallittua mallia, jossa näkyvyys, pyynnön tekijä, hyväksyntä, toteutus ja dokumentointi on mietitty erikseen.

**Riski:**  
Jos dynamic group perustuu väärään tai vanhentuneeseen HR-dataan, väärä henkilö voi päästä esihenkilöiden pyyntösivustolle.

Esimerkiksi jos käyttäjä ei ole enää esihenkilö, mutta hänen tietonsa eivät ole päivittyneet, hän voi edelleen kuulua `Managers`-ryhmään.

**Tekninen huomio:**  
Dynamic group on rajausmekanismi, ei koko käyttöoikeusprosessi. Varsinainen luvitus syntyy vasta, kun siihen yhdistetään workflow, hyväksyntä, omistajat, audit trail ja toteutusprosessi.

**Elikkäs:**  
Dynamic group voi rajata automaattisesti, ketkä kuuluvat tiettyyn käyttäjäjoukkoon. Sitä voidaan käyttää esimerkiksi siihen, että vain esihenkilöt pääsevät tekemään tiettyjä käyttöoikeuspyyntöjä. Varsinainen hyväksyntä ja oikeuksien antaminen pitää silti hoitaa erillisellä prosessilla.

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

**Riski:**  
Assigned group on altis access driftille, jos poistot ja tarkistukset unohtuvat.

**Elikkäs:**  
Assigned group on manuaalisempi ryhmä. Se on ihan ok, kun prosessi on kunnossa. Ilman tarkistuksia siitä tulee helposti access drift -kone.

---

## Group Owner

**Group Owner** - Ryhmän omistaja. Henkilö tai taho, joka vastaa ryhmästä, sen tarkoituksesta ja usein myös jäsenyyksien oikeellisuudesta.

Group owner ei ole pelkkä koristekenttä. Omistajuus on tärkeää, koska jonkun pitää tietää:

- miksi ryhmä on olemassa
- mihin oikeuksiin ryhmä vaikuttaa
- ketkä ryhmään kuuluvat
- kuka saa hyväksyä uudet jäsenet
- milloin ryhmän jäsenyydet pitää tarkistaa
- voiko ryhmän poistaa tai arkistoida

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on ryhmä `Finance-Reports-Read`.

Ryhmän owner on taloushallinnon pääkäyttäjä, koska hän ymmärtää, ketkä tarvitsevat pääsyn talousraportteihin.

Jos Service Desk saa pyynnön lisätä Hannu ryhmään, pyyntö ei mene vain “IT päättää” -mallilla, vaan omistajalta pyydetään hyväksyntä.

**Riski:**  
Jos ryhmällä ei ole omistajaa, kukaan ei välttämättä uskalla poistaa jäseniä tai päättää, tarvitseeko ryhmää enää. Sitten ryhmä jää roikkumaan vuosiksi.

**Elikkäs:**  
Group owner on ryhmän vastuuhenkilö. Jos ryhmällä ei ole omistajaa, se on käyttöoikeuksien villi länsi.

---

## Group Membership

**Group Membership** - Ryhmän jäsenyys. Tarkoittaa sitä, että käyttäjä, laite tai muu objekti kuuluu tiettyyn ryhmään.

Group membership voi tuoda käyttäjälle pääsyn johonkin resurssiin, sovellukseen tai palveluun.

Ryhmäjäsenyys voi olla:

- manuaalisesti lisätty
- dynaamisen säännön perusteella tullut
- access packagen kautta tullut
- synkronoitu paikallisesta AD:stä
- väliaikainen
- pysyvä

**Esimerkkitilanne:**  
Iines kuuluu ryhmään `HR-Users`.

Tämä jäsenyys antaa hänelle pääsyn HR-tiimin SharePointiin ja HR-sovellukseen.

Kun Iines siirtyy tuotantoon, hänen pitäisi poistua `HR-Users`-ryhmästä.

Jos tätä ei tehdä, Iines voi edelleen päästä HR-tietoihin, vaikka hänen nykyinen työnsä ei sitä vaadi.

**Tekninen huomio:**  
Kun selvitetään käyttäjän oikeuksia, pitää tarkistaa mistä ryhmäjäsenyys tulee. Onko se manuaalinen, dynaaminen, access packagen kautta tullut vai AD:stä synkronoitu?

**Elikkäs:**  
Group membership on se kohta, jossa ryhmä alkaa oikeasti vaikuttaa käyttäjän pääsyihin.

---

## Nested Group

**Nested Group** - Ryhmä ryhmän sisällä. Tarkoittaa sitä, että yksi ryhmä lisätään toisen ryhmän jäseneksi.

Nested group voi helpottaa hallintaa joissain ympäristöissä, mutta se voi myös tehdä oikeuksien selvittämisestä hankalaa.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on ryhmä `Finance-All`.

Sen sisällä voi olla muita ryhmiä:

- `Finance-Reports-Read`
- `Finance-Reports-Edit`
- `Finance-Managers`

Jos Roope kuuluu ryhmään `Finance-Managers`, ja tämä ryhmä kuuluu ryhmään `Finance-All`, Roope voi saada oikeuksia epäsuorasti.

Kun Service Desk tutkii, miksi Roope pääsee tiettyyn raporttiin, oikeus ei välttämättä näy suoraan yksittäisenä käyttäjäkohtaisena oikeutena. Se voi tulla ryhmäketjun kautta.

**Riski:**  
Nested group voi piilottaa oikeuden alkuperän. Jos ryhmiä on monta tasoa sisäkkäin, voi olla vaikea ymmärtää, miksi käyttäjällä on tietty pääsy.

**Tekninen huomio:**  
Kaikki Microsoft 365- ja Entra-skenaariot eivät tue nested group -jäsenyyksiä samalla tavalla. Siksi pitää aina tarkistaa, toimiiko sisäkkäinen ryhmä juuri siinä käyttökohteessa, johon sitä ollaan käyttämässä.

**Elikkäs:**  
Nested group on ryhmä ryhmän sisällä. Se voi helpottaa rakennetta tai tehdä siitä sekavan sipulin, jota kukaan ei halua kuoria.

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

**Riski:**  
Jos hallintaoikeudet annetaan koko tenanttiin, vaikka tarve koskee vain yhtä toimipistettä tai osastoa, oikeudet ovat turhan laajat.

**Elikkäs:**  
Administrative Unit rajaa hallintaoikeuden tiettyyn osaan ympäristöstä. Se on tapa sanoa: “saat hallita näitä käyttäjiä, et koko valtakuntaa.”
