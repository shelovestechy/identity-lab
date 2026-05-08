# 01 - Basic Structure

Tämä sivu kokoaa Microsoft Entra ID:n perusrakenteen käsitteitä.

Tavoite on ymmärtää ensin **mikä Entra ID on**, miten se eroaa perinteisestä Active Directorysta ja mitä tarkoittavat käsitteet kuten **tenant**, **directory** ja **identity object**.

Nämä ovat niitä peruspalikoita, joiden päälle kaikki muu rakentuu: käyttäjät, ryhmät, roolit, sovellukset, laitteet, kirjautuminen ja käyttöoikeudet.

---

## Contents

- [Microsoft Entra ID](#microsoft-entra-id)
- [Azure AD](#azure-ad)
- [AD, AAD and Entra](#ad-aad-and-entra)
- [Tenant](#tenant)
- [Directory](#directory)
- [Identity Object](#identity-object)
- [Object ID](#object-id)
- [Domain](#domain)
- [Verified Domain](#verified-domain)
- [Default Domain](#default-domain)
- [Cloud-only Identity](#cloud-only-identity)
- [Hybrid Identity](#hybrid-identity)
- [Source of Authority](#source-of-authority)

---

## Microsoft Entra ID

**Microsoft Entra ID** - Microsoftin pilvipohjainen identiteetti- ja pääsynhallintapalvelu. Sen avulla hallitaan käyttäjiä, ryhmiä, kirjautumista, sovelluksia, MFA:ta, Conditional Accessia, rooleja, laitteita ja muita identiteettiin liittyviä asioita.

Microsoft Entra ID toimii modernissa Microsoft-ympäristössä usein keskeisenä identiteettikerroksena. Se ei ole vain paikka, josta katsotaan käyttäjätunnuksia. Se osallistuu siihen, kuka saa kirjautua, mistä saa kirjautua, millä laitteella saa kirjautua ja mihin käyttäjällä on pääsy.

Entra ID:tä käytetään esimerkiksi Microsoft 365:n, Teamsin, SharePointin, Exchange Onlinen, Azuren, SaaS-sovellusten ja SSO-kirjautumisten kanssa.

**Esimerkkitilanne:**  
Ankkalinna Oy käyttää Microsoft 365 -palveluita.

Kun Aku Ankka kirjautuu Teamsiin, Microsoft Entra ID tarkistaa esimerkiksi:

- onko Akun käyttäjätili olemassa
- onko tunnus aktiivinen
- onko salasana oikein
- pitääkö Akulta vaatia MFA
- mistä sijainnista kirjautuminen tulee
- millä laitteella Aku kirjautuu
- onko Akulla pääsy Teamsiin ja oikeaan tiimiin

Jos kaikki ehdot täyttyvät, kirjautuminen onnistuu.

Jos kirjautuminen näyttää oudolta tai laite ei täytä vaatimuksia, pääsy voidaan estää tai vaatia lisävahvistusta.

**Tekninen huomio:**  
Microsoft Entra ID ei ole sama asia kuin perinteinen paikallinen Active Directory. Niillä voi olla yhteys toisiinsa, mutta ne ovat eri palveluita ja toimivat eri tavalla.

**Elikkäs:**  
Microsoft Entra ID on Microsoftin pilvi-identiteetin keskus. Se auttaa tunnistamaan käyttäjän ja päättämään, mihin hän saa päästä.

---

## Azure AD

**Azure AD** - Microsoft Entra ID:n vanha nimi. Azure Active Directory tunnettiin pitkään nimellä Azure AD tai AAD, mutta Microsoft nimesi palvelun myöhemmin Microsoft Entra ID:ksi.

Moni käyttää edelleen vanhaa nimeä, koska se on ollut käytössä pitkään. Työpaikoilla, dokumenteissa, tiketeissä, skripteissä ja vanhoissa ohjeissa voi näkyä edelleen termejä kuten Azure AD, AAD tai Azure Active Directory.

**Esimerkkitilanne:**  
Service Deskissä joku sanoo:

> “Katso löytyykö käyttäjä AAD:lta.”

Todennäköisesti hän tarkoittaa Microsoft Entra ID:tä.

Toinen henkilö voi sanoa:

> “Tarkista AD:lta.”

Tässä pitää olla tarkkana, koska hän voi tarkoittaa joko paikallista Active Directorya tai puhekielessä Entra ID:tä / Azure AD:tä.

**Tekninen huomio:**  
Nimenmuutos ei tarkoita, että kaikki vanhat termit olisivat kadonneet teknisistä ympäristöistä. Vanha nimi voi näkyä vielä esimerkiksi moduuleissa, ohjeissa, dokumenteissa tai ihmisten puheessa.

**Elikkäs:**  
Azure AD ja Microsoft Entra ID tarkoittavat käytännössä samaa pilvipalvelua, mutta Entra ID on nykyinen nimi.

---

## AD, AAD and Entra

**AD, AAD and Entra** - Näitä termejä käytetään helposti sekaisin, mutta ne eivät tarkoita samaa asiaa.

**AD** tarkoittaa yleensä paikallista **Active Directorya**. Se on perinteinen on-premises-hakemisto, jota käytetään esimerkiksi Windows-toimialueissa, käyttäjähallinnassa, palvelinympäristöissä ja ryhmäkäytännöissä.

**AAD** tarkoittaa yleensä **Azure Active Directorya**, eli Microsoft Entra ID:n vanhaa nimeä.

**Entra** tarkoittaa nykyistä **Microsoft Entra ID:tä**, eli Microsoftin pilvipohjaista identiteettipalvelua.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on paikallinen Active Directory ja Microsoft 365 käytössä.

Aku Ankan käyttäjä luodaan ensin paikalliseen AD:hen. Sieltä tiedot synkronoidaan Microsoft Entra ID:hen.

Tällöin Aku löytyy sekä AD:stä että Entrasta, mutta hänen tietojensa virallinen lähde voi olla paikallinen AD.

Jos Akun nimi muutetaan suoraan Entrassa, muutos voi palautua vanhaksi seuraavassa synkronoinnissa, koska AD jyrää tiedon takaisin.

**Tekninen huomio:**  
Tämä on todella tärkeä ymmärtää ennen kuin muokkaa käyttäjätietoja. Ensin pitää tietää, mistä tieto tulee ja mikä järjestelmä on käyttäjätiedon lähde.

**Elikkäs:**  
AD on yleensä paikallinen käyttäjähakemisto. AAD ja Entra tarkoittavat pilvi-identiteettiä. Ne voivat olla yhteydessä toisiinsa, mutta ne eivät ole sama asia.

---

## Tenant

**Tenant** - Organisaation oma Microsoft-pilviympäristö. Tenant sisältää organisaation käyttäjät, ryhmät, sovellukset, lisenssit, laitteet, roolit, asetukset ja identiteettiin liittyvät määritykset.

Tenant on looginen ympäristö Microsoftin pilvessä. Se ei tarkoita yhtä palvelinta tai yhtä konetta, vaan organisaation omaa hallintaympäristöä.

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

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on oma Microsoft 365 tenant.

Tenantin oletusdomain voisi olla:

`ankkalinna.onmicrosoft.com`

Lisäksi tenanttiin voidaan liittää yrityksen oma domain:

`ankkalinna.fi`

Kun Aku Ankka kirjautuu tunnuksella `aku.ankka@ankkalinna.fi`, kirjautuminen tapahtuu Ankkalinna Oy:n tenanttiin.

Jos Aku kutsutaan Kopla Turva Oy:n Teamsiin, hän voi näkyä Kopla Turva Oy:n tenantissa guest-käyttäjänä.

**Tekninen huomio:**  
Tenant on raja, jonka sisällä organisaation Microsoft-pilvi-identiteettejä ja asetuksia hallitaan. Eri organisaatioilla on omat tenanttinsa, vaikka ne käyttäisivät samoja Microsoft-palveluita.

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
Service Desk etsii Aku Ankan käyttäjätiliä Microsoft Entra admin centeristä.

Aku löytyy directoryn käyttäjäobjekteista.

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

**Tekninen huomio:**  
Directory on tenantin sisällä oleva hakemisto. Tenant on laajempi organisaation pilviympäristö, directory taas identiteettiobjektien hakemisto sen sisällä.

**Elikkäs:**  
Directory on Entran tekninen hakemisto. Se ei ole vain lista käyttäjistä, vaan kokoelma identiteettiobjekteja ja niiden tietoja.

---

## Identity Object

**Identity Object** - Identiteettiin liittyvä objekti hakemistossa. Objekti voi olla esimerkiksi käyttäjä, ryhmä, laite, sovellus tai service principal.

Microsoft Entra ID:ssä monet asiat ovat objekteja. Jokaisella objektilla on oma tunniste ja attribuutteja.

Identity object voi olla esimerkiksi:

- user
- group
- device
- application
- service principal
- managed identity

**Esimerkkitilanne:**  
Ankkalinna Oy:n ympäristössä voi olla seuraavia identiteettiobjekteja:

- Aku Ankka käyttäjäobjektina
- `HR-Users` ryhmäobjektina
- Akun työläppäri laiteobjektina
- raportointisovellus application-objektina
- automaation käyttämä service principal

Nämä kaikki ovat eri objekteja, vaikka ne liittyvät samaan ympäristöön.

**Tekninen huomio:**  
Objekteja kannattaa ajatella erillisinä teknisinä asioina. Käyttäjä ei ole sama asia kuin laite. Sovellus ei ole sama asia kuin service principal. Ryhmä ei ole sama asia kuin rooli.

**Elikkäs:**  
Identity object on Entran hallittava identiteettiin liittyvä asia. Käyttäjä on yksi objekti, mutta ei ainoa.

---

## Object ID

**Object ID** - Microsoft Entra ID:n objektin yksilöllinen tekninen tunniste. Käyttäjällä, ryhmällä, sovelluksella ja laitteella voi olla oma Object ID.

Object ID on tärkeä, koska nimet, sähköpostiosoitteet ja UPN:t voivat muuttua, mutta Object ID pysyy yleensä samana objektin elinkaaren ajan.

**Esimerkkitilanne:**  
Iines Ankan nimi muuttuu Iines Hanhiksi.

Hänen UPN:nsä tai sähköpostiosoitteensa voi muuttua, mutta hänen käyttäjäobjektinsa Object ID pysyy samana.

Jos integraatio tai raportointi perustuu Object ID:hen, se tunnistaa edelleen saman käyttäjän.

Jos integraatio perustuu vain sähköpostiosoitteeseen, nimenmuutos voi rikkoa yhteyden.

**Tekninen huomio:**  
Object ID on usein turvallisempi tapa tunnistaa objekti teknisissä integraatioissa kuin nimi tai sähköpostiosoite.

**Elikkäs:**  
Object ID on objektin pysyvämpi tekninen henkilötunnus Entrassa.

---

## Domain

**Domain** - Verkkotunnus, jota käytetään organisaation Microsoft-ympäristössä esimerkiksi käyttäjätunnuksissa ja sähköpostiosoitteissa.

Domain voi näkyä esimerkiksi käyttäjän UPN:ssä tai sähköpostiosoitteessa.

**Esimerkkitilanne:**  
Ankkalinna Oy käyttää domainia:

`ankkalinna.fi`

Aku Ankan UPN voi olla:

`aku.ankka@ankkalinna.fi`

Hänen sähköpostiosoitteensa voi olla sama:

`aku.ankka@ankkalinna.fi`

Mutta teknisesti UPN ja sähköpostiosoite eivät ole automaattisesti sama asia, vaikka ne usein näyttävät samalta.

**Tekninen huomio:**  
Tenantilla on aina oletusdomain, kuten `ankkalinna.onmicrosoft.com`. Organisaation oma domain, kuten `ankkalinna.fi`, pitää lisätä ja vahvistaa erikseen.

**Elikkäs:**  
Domain on organisaation nimialue, jota käytetään esimerkiksi kirjautumistunnuksissa ja sähköpostissa.

---

## Verified Domain

**Verified Domain** - Domain, jonka organisaatio on todistanut omistavansa Microsoftille.

Domain pitää vahvistaa, ennen kuin sitä voidaan käyttää kunnolla Microsoft 365- ja Entra ID -ympäristössä.

Vahvistaminen tehdään yleensä DNS-tietueiden avulla.

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa käyttää käyttäjätunnuksissa ja sähköpostissa domainia:

`ankkalinna.fi`

Jotta Microsoft tietää, että Ankkalinna Oy oikeasti omistaa domainin, domain pitää vahvistaa DNS-tietueella.

Kun domain on verified, käyttäjille voidaan luoda tunnuksia kuten:

`aku.ankka@ankkalinna.fi`

**Tekninen huomio:**  
Jos domainia ei ole vahvistettu, sitä ei voi käyttää normaalisti organisaation Microsoft-palveluissa.

**Elikkäs:**  
Verified domain tarkoittaa, että Microsoftille on todistettu: “kyllä, tämä domain kuuluu meille”.

---

## Default Domain

**Default Domain** - Tenantin oletusdomain. Microsoft luo tenantille yleensä oletusdomainin muodossa `organisaatio.onmicrosoft.com`.

Tätä domainia voidaan käyttää, vaikka organisaation omaa domainia ei olisi vielä lisätty.

**Esimerkkitilanne:**  
Kun Ankkalinna Oy:n tenant luodaan, sille syntyy oletusdomain:

`ankkalinna.onmicrosoft.com`

Alussa käyttäjän tunnus voisi olla:

`aku.ankka@ankkalinna.onmicrosoft.com`

Kun yrityksen oma domain `ankkalinna.fi` lisätään ja vahvistetaan, käyttäjien UPN:t voidaan muuttaa muotoon:

`aku.ankka@ankkalinna.fi`

**Tekninen huomio:**  
`onmicrosoft.com`-domain jää yleensä tenanttiin taustalle, vaikka organisaatio käyttäisi omaa domainiaan.

**Elikkäs:**  
Default domain on tenantin alkuperäinen Microsoft-domain. Oma yritysdomain lisätään yleensä myöhemmin rinnalle.

---

## Cloud-only Identity

**Cloud-only Identity** - Identiteetti, joka luodaan ja hallitaan suoraan Microsoft Entra ID:ssä. Sitä ei synkronoida paikallisesta Active Directorysta.

Cloud-only käyttäjän tiedot ovat pilvessä. Tällöin Entra ID on yleensä käyttäjätiedon ensisijainen hallintapaikka.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä ei ole paikallista AD:tä. Kaikki käyttäjät luodaan suoraan Microsoft 365 admin centerissä tai Entra admin centerissä.

Aku Ankka on cloud-only-käyttäjä.

Jos Akun nimi tai UPN pitää muuttaa, muutos tehdään pilven hallintatyökaluissa.

**Tekninen huomio:**  
Cloud-only-ympäristö voi olla yksinkertaisempi kuin hybrid-ympäristö, mutta se vaatii silti hyvää hallintaa. Esimerkiksi lisenssit, ryhmät, MFA, roolit ja Conditional Access pitää suunnitella kunnolla.

**Elikkäs:**  
Cloud-only identity elää vain pilvessä. Sitä ei ohjata paikallisesta AD:stä.

---

## Hybrid Identity

**Hybrid Identity** - Identiteettimalli, jossa paikallinen Active Directory ja Microsoft Entra ID toimivat yhdessä.

Hybrid-ympäristössä käyttäjä voidaan luoda paikalliseen AD:hen ja synkronoida Entra ID:hen esimerkiksi Microsoft Entra Connectin avulla.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on vanha paikallinen AD, mutta käytössä on myös Microsoft 365.

Käyttäjät luodaan paikalliseen AD:hen. Microsoft Entra Connect synkronoi käyttäjät Entra ID:hen.

Aku Ankka kirjautuu työasemalle AD-tunnuksella ja käyttää Microsoft 365 -palveluita samalla identiteetillä.

**Tekninen huomio:**  
Hybrid identity vaatii ymmärrystä siitä, missä käyttäjän tiedot oikeasti hallitaan. Monet attribuutit voivat tulla paikallisesta AD:stä, jolloin niitä ei kannata muuttaa suoraan Entra ID:ssä.

**Elikkäs:**  
Hybrid identity tarkoittaa, että identiteetti elää sekä paikallisessa AD-maailmassa että Microsoftin pilvessä.

---

## Source of Authority

**Source of Authority** - Järjestelmä, joka toimii käyttäjätiedon virallisena lähteenä.

Source of authority kertoo, mistä tieto tulee ja missä sitä pitäisi muuttaa.

Se voi olla esimerkiksi:

- HR-järjestelmä
- paikallinen Active Directory
- Microsoft Entra ID
- IAM- tai IGA-järjestelmä

**Esimerkkitilanne:**  
Iines Ankan nimi muuttuu Iines Hanhiksi.

Ennen muutosta pitää selvittää, mistä Iineksen nimi tulee.

Jos nimi tulee HR-järjestelmästä, muutos pitää tehdä HR-järjestelmässä.

Jos nimi tulee paikallisesta AD:stä, muutos pitää tehdä AD:ssä.

Jos Iines on cloud-only-käyttäjä, muutos voidaan tehdä Entra ID:ssä.

Jos muutos tehdään väärässä paikassa, se voi:

- palautua vanhaksi
- mennä vain osaan järjestelmistä
- rikkoa synkronointia
- aiheuttaa ristiriitaisia käyttäjätietoja

**Tekninen huomio:**  
Source of authority on yksi tärkeimmistä asioista identiteetinhallinnassa. Ennen kuin korjaat käyttäjätietoa, selvitä mikä järjestelmä omistaa tiedon.

**Elikkäs:**  
Source of authority vastaa kysymykseen: “mistä tämä tieto oikeasti tulee?” Älä muuta väärää järjestelmää ja ihmettele sitten miksi Microsoft nauraa sinulle pilvestä.
