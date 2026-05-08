# 05 - Applications

Tämä sivu kokoaa Microsoft Entra ID:n sovelluksiin, sovellusidentiteetteihin, API-oikeuksiin ja consent-ajatteluun liittyviä käsitteitä.

Tavoite on ymmärtää, että Microsoft Entra ID ei hallitse vain käyttäjiä ja ryhmiä. Se hallitsee myös sovelluksia ja sitä, miten sovellukset kirjautuvat, saavat oikeuksia ja käyttävät dataa.

IAM-näkökulmasta sovellukset ovat tärkeitä, koska sovellus voi joskus saada hyvin laajoja oikeuksia.

Käyttäjän pääsy on yksi asia.  
Sovelluksen pääsy on toinen asia.  
Ja pahimmillaan sovelluksen pääsy voi olla paljon laajempi kuin yksittäisen käyttäjän.

---

## Contents

- [Application](#application)
- [App Registration](#app-registration)
- [Enterprise Application](#enterprise-application)
- [Service Principal](#service-principal)
- [Managed Identity](#managed-identity)
- [Client Secret](#client-secret)
- [Certificate Credential](#certificate-credential)
- [API Permission](#api-permission)
- [Microsoft Graph](#microsoft-graph)
- [Delegated Permission](#delegated-permission)
- [Application Permission](#application-permission)
- [Admin Consent](#admin-consent)
- [User Consent](#user-consent)
- [Consent Grant](#consent-grant)
- [Single Sign-On](#single-sign-on)
- [Enterprise App Assignment](#enterprise-app-assignment)
- [App Role](#app-role)
- [OAuth Permission Grant](#oauth-permission-grant)
- [Secret Expiration](#secret-expiration)
- [Application Ownership](#application-ownership)
- [Stale Application](#stale-application)

---

## Application

**Application** - Sovellus, joka käyttää Microsoft Entra ID:tä esimerkiksi kirjautumiseen, käyttäjien tunnistamiseen, kertakirjautumiseen tai rajapintojen käyttöön.

Sovellus voi olla esimerkiksi:

- sisäinen web-sovellus
- SaaS-palvelu
- mobiilisovellus
- raportointityökalu
- automaatioskripti
- integraatio
- taustapalvelu
- PowerShell- tai Graph-pohjainen työkalu

Microsoft Entra ID:n näkökulmasta sovellus voi tarvita identiteetin, oikeuksia ja asetuksia samalla tavalla kuin käyttäjäkin. Erona on se, että sovellus ei välttämättä ole ihminen eikä sillä ole normaalia käyttäjäistuntoa.

**Esimerkkitilanne:**  
Ankkalinna Oy ottaa käyttöön uuden raportointisovelluksen.

Sovelluksen pitää antaa käyttäjien kirjautua Microsoft-tunnuksella. Lisäksi sovelluksen pitää hakea käyttäjien perustietoja Microsoft Graphista.

Tätä varten sovellus liitetään Microsoft Entra ID:hen.

Sovellukselle pitää miettiä ainakin:

- kuka omistaa sovelluksen
- kuka saa käyttää sovellusta
- mitä tietoja sovellus saa lukea
- tarvitseeko sovellus käyttäjän puolesta oikeuksia
- tarvitseeko sovellus omia taustaoikeuksia
- hyväksyykö käyttäjä oikeudet itse vai tarvitaanko admin consent
- miten sovelluksen salaisuudet suojataan

**Tekninen huomio:**  
Sovellukset ovat identiteetinhallinnassa usein iso riskikohta, koska niille voidaan antaa oikeuksia, joita käyttäjät eivät itse edes huomaa.

**Riski:**  
Jos sovellukselle annetaan liian laajat oikeudet, se voi päästä lukemaan tai muuttamaan tietoja laajemmin kuin oli tarkoitus.

**Elikkäs:**  
Application on sovellus, joka käyttää Entra ID:tä kirjautumiseen tai oikeuksiin. Sovelluksia pitää hallita yhtä vakavasti kuin käyttäjiäkin.

---

## App Registration

**App Registration** - Sovelluksen rekisteröinti Microsoft Entra ID:hen. App registration luo sovellukselle teknisen määrittelyn, jonka avulla sovellus voi käyttää Entra ID:tä kirjautumiseen tai API-oikeuksiin.

App registration on kuin sovelluksen “henkilökortti” tai tekninen profiili.

Siinä määritellään esimerkiksi:

- sovelluksen nimi
- application ID eli client ID
- supported account types
- redirect URI
- API permissions
- client secrets
- certificates
- app roles
- ownerit
- authentication-asetukset

**Esimerkkitilanne:**  
Ankkalinna Oy kehittää pienen sisäisen raportointisovelluksen.

Sovellus haluaa käyttää Microsoft-kirjautumista ja hakea käyttäjän perustiedot Microsoft Graphista.

IT luo sovellukselle App Registrationin Microsoft Entra ID:ssä.

Sovellus saa oman client ID:n, ja sille määritellään redirect URI, jotta kirjautuminen palautuu oikeaan sovellukseen.

**Tekninen huomio:**  
App registration ei ole sama asia kuin Enterprise Application, vaikka ne liittyvät toisiinsa. App registration kuvaa sovelluksen teknistä määrittelyä. Enterprise Application taas on sovelluksen käytännön ilmentymä tenantissa.

**Riski:**  
Jos app registrationille lisätään client secret ja laajat API-oikeudet ilman valvontaa, sovellus voi muuttua hiljaiseksi riskiksi.

**Elikkäs:**  
App registration on sovelluksen rekisteröity tekninen identiteetti Entrassa. Ilman sitä sovellus ei kunnolla tiedä, miten se puhuu Entran kanssa.

---

## Enterprise Application

**Enterprise Application** - Sovelluksen organisaatiokohtainen ilmentymä Microsoft Entra ID:ssä. Enterprise Applicationin kautta hallitaan usein käyttäjien pääsyä sovellukseen, SSO-asetuksia ja sovelluksen käyttöä tenantissa.

Enterprise Application liittyy siihen, miten sovellus näkyy ja toimii juuri tässä organisaation tenantissa.

Sen kautta voidaan hallita esimerkiksi:

- käyttäjien ja ryhmien assignment
- SSO-asetukset
- provisioning-asetukset
- conditional access -kohdistus
- käyttäjien pääsy sovellukseen
- sign-in-lokit
- sovelluksen omistajat
- consentit ja oikeudet

**Esimerkkitilanne:**  
Ankkalinna Oy ottaa käyttöön ulkoisen HR SaaS -sovelluksen.

Sovellus lisätään Microsoft Entra ID:hen Enterprise Applicationina.

Tämän jälkeen Ankkalinna voi määrittää:

- ketkä käyttäjät pääsevät sovellukseen
- käytetäänkö SAML- tai OIDC-pohjaista SSO:ta
- provisioidaanko käyttäjät sovellukseen automaattisesti
- tarvitaanko MFA sovellukseen kirjauduttaessa
- näkyykö sovellus käyttäjän My Apps -portaalissa

**Tekninen huomio:**  
Enterprise Application on usein se paikka, josta IAM-analyytikko katsoo käytännön pääsynhallintaa sovellukseen.

**Riski:**  
Jos Enterprise Applicationiin sallitaan pääsy kaikille käyttäjille ilman tarvetta, sovellus voi levitä organisaatiossa hallitsemattomasti.

**Elikkäs:**  
Enterprise Application on sovelluksen käytännön hallintapaikka tenantissa. Siellä päätetään, kuka saa käyttää sovellusta ja miten kirjautuminen toimii.

---

## Service Principal

**Service Principal** - Sovelluksen tai palvelun identiteetti tietyssä tenantissa. App registration on kuin sovelluksen yleinen määrittely, ja service principal on sen paikallinen edustaja organisaation tenantissa.

Service principal mahdollistaa sen, että sovellus voi toimia tenantissa.

Sitä voidaan käyttää esimerkiksi:

- sovelluksen kirjautumiseen
- API-oikeuksien käyttöön
- automaation ajamiseen
- taustaprosessien suorittamiseen
- resurssien hallintaan ilman ihmiskäyttäjää

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on automaatio, joka hakee käyttäjätietoja Microsoft Graphista kerran yössä ja tekee raportin aktiivisista käyttäjistä.

Automaatio ei kirjaudu sisään Akun tai Iineksen käyttäjällä.

Sen sijaan automaatiolla on service principal, jolle on annettu tarvittavat API-oikeudet.

**Tekninen huomio:**  
Service principal on erittäin tärkeä ymmärtää, koska sillä voi olla oikeuksia ilman ihmiskäyttäjää. Jos se saa application permission -oikeuksia, se voi toimia taustalla itsenäisesti.

**Riski:**  
Unohtunut service principal, jolla on vanha client secret ja laajat oikeudet, on aikamoinen tietoturvan homejuusto jääkaapin perällä.

**Elikkäs:**  
Service principal on sovelluksen oma identiteetti tenantissa. Se on vähän kuin sovelluksen käyttäjätili, mutta ei ihmiskäyttäjä.

---

## Managed Identity

**Managed Identity** - Azure-resurssille annettu hallittu identiteetti, jonka avulla resurssi voi käyttää muita palveluita ilman että salasanoja tai client secrettejä pitää hallita käsin.

Managed identity voi olla turvallisempi vaihtoehto kuin client secret, koska salaisuutta ei tarvitse tallentaa koodiin, tiedostoon tai pipelineen.

Managed identityä voidaan käyttää esimerkiksi:

- Azure Functionissa
- Azure Virtual Machinessa
- Azure Automationissa
- Logic Appsissa
- App Servicessä

**Esimerkkitilanne:**  
Ankkalinna Oy:n Azure Function hakee salaisuuksia Azure Key Vaultista.

Sen sijaan että Azure Functioniin tallennetaan salasana tai client secret, sille annetaan managed identity.

Key Vaultissa määritellään, että juuri tämä managed identity saa lukea tietyn salaisuuden.

**Tekninen huomio:**  
Managed identity toimii vain tuetuille Azure-resursseille. Se ei ole yleinen ratkaisu kaikkeen, mutta Azuren sisällä se on usein hyvä tapa välttää kovakoodattuja salaisuuksia.

**Riski:**  
Managed identitykin voi olla riski, jos sille annetaan liian laajat oikeudet. Salaisuuden puuttuminen ei tarkoita, että oikeus olisi harmiton.

**Elikkäs:**  
Managed identity on Azure-resurssin oma turvallinen identiteetti. Sen avulla palvelu voi tehdä asioita ilman että salasanoja tungetaan koodiin kuin purkkaa näppäimistön alle.

---

## Client Secret

**Client Secret** - Sovelluksen salaisuus, jota käytetään sovelluksen tunnistamiseen. Se on käytännössä sovelluksen salasana.

Client secret voi olla tarpeen, jos sovellus tarvitsee tavan todistaa Entra ID:lle, että se on oikea sovellus.

Client secret liittyy usein app registrationiin ja OAuth-pohjaisiin kirjautumis- tai API-käyttötilanteisiin.

**Esimerkkitilanne:**  
Ankkalinna Oy:n automaatiosovellus käyttää client secretiä kirjautuakseen Microsoft Graphiin.

Sovelluksella on application permission, jolla se saa lukea käyttäjätietoja.

Jos client secret vuotaa, ulkopuolinen taho voi yrittää käyttää sovelluksen identiteettiä ja sen oikeuksia.

**Tekninen huomio:**  
Client secret pitää suojata samalla vakavuudella kuin salasana. Sitä ei pidä tallentaa suoraan koodiin, GitHubiin, dokumentteihin tai jaettuihin Excel-hirviöihin.

**Riski:**  
Vuotanut client secret voi antaa pääsyn sovelluksen oikeuksiin. Jos sovelluksella on laajat API-oikeudet, vaikutus voi olla iso.

**Elikkäs:**  
Client secret on sovelluksen salasana. Jos se vuotaa, sovelluksen oikeudet voivat vuotaa mukana.

---

## Certificate Credential

**Certificate Credential** - Sertifikaatti, jota sovellus voi käyttää tunnistautumiseen client secretin sijasta.

Sertifikaattipohjainen tunnistautuminen voi olla turvallisempi vaihtoehto kuin client secret, jos se toteutetaan oikein.

Sertifikaatti voi olla parempi, koska:

- sitä ei käsitellä samalla tavalla yksinkertaisena tekstisalaisuutena
- se voi olla vahvempi tunnistautumistapa
- sen hallinta voidaan tehdä turvallisemmin
- se sopii hyvin automaatioihin ja palveluihin

**Esimerkkitilanne:**  
Ankkalinna Oy:n identiteettitiimi päättää korvata pitkäikäisen client secretin sertifikaatilla.

Sovellus käyttää sertifikaattia tunnistautuakseen Microsoft Entra ID:lle ja hakeakseen tokenin Microsoft Graphia varten.

**Tekninen huomio:**  
Sertifikaatti ei poista tarvetta hallinnalle. Sertifikaatillakin on voimassaoloaika, omistaja, säilytyspaikka ja uusimisprosessi.

**Riski:**  
Jos sertifikaatti vanhenee ilman uusimista, sovellus voi lakata toimimasta. Jos yksityinen avain vuotaa, riski voi olla vakava.

**Elikkäs:**  
Certificate credential on sovelluksen tunnistautumistapa sertifikaatilla. Usein parempi kuin client secret, mutta ei mikään “aseta ja unohda” -taikakalu.

---

## API Permission

**API Permission** - Oikeus, jonka sovellus tarvitsee käyttääkseen rajapintaa, kuten Microsoft Graphia.

API permission määrittää, mitä sovellus saa tehdä rajapinnan kautta.

Oikeudet voivat liittyä esimerkiksi:

- käyttäjien lukemiseen
- ryhmien lukemiseen
- sähköpostien lukemiseen
- tiedostojen käsittelyyn
- hakemiston tietojen muokkaamiseen
- sovellusten hallintaan
- audit- tai sign-in-lokien lukemiseen

API permissions voi olla hyvin laajoja. Siksi niitä ei pidä hyväksyä ajatuksella “no painetaan nyt Allow että päästään eteenpäin”.

**Esimerkkitilanne:**  
Ankkalinna Oy:n raportointisovellus tarvitsee oikeuden lukea käyttäjien perustietoja.

Sille voidaan antaa Microsoft Graph -oikeus, joka sallii käyttäjien lukemisen.

Mutta jos sovellus tarvitsee vain käyttäjän nimen ja osaston, sille ei pidä antaa oikeutta lukea kaikkien käyttäjien sähköposteja, ryhmiä ja tiedostoja.

**Tekninen huomio:**  
API permissions pitää arvioida least privilege -periaatteella. Sovellukselle annetaan vain ne oikeudet, joita se oikeasti tarvitsee.

**Riski:**  
Liian laajat API permissions voivat antaa sovellukselle pääsyn organisaation dataan erittäin laajasti.

**Elikkäs:**  
API permission kertoo, mitä sovellus saa tehdä rajapinnassa. Tämä on sovellusten käyttöoikeushallinnan ydintä.

---

## Microsoft Graph

**Microsoft Graph** - Microsoftin rajapinta, jonka kautta voidaan käyttää ja hallita Microsoft 365- ja Entra ID -tietoja ohjelmallisesti.

Microsoft Graphin kautta voidaan käsitellä esimerkiksi:

- käyttäjiä
- ryhmiä
- laitteita
- sovelluksia
- Teams-tietoja
- sähköpostia
- kalentereita
- tiedostoja
- hakemistotietoja
- kirjautumis- ja audit-lokeja

Microsoft Graph on todella tehokas, koska sen kautta pääsee moneen Microsoft-palveluun yhdellä rajapinnalla.

Tehokas tarkoittaa myös: älä sohi sokkona.

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa tehdä raportin käyttäjistä, joilla ei ole ollut kirjautumisia pitkään aikaan.

Sovellus tai PowerShell-skripti voi käyttää Microsoft Graphia hakeakseen käyttäjätietoja ja sign-in activity -tietoja.

Tätä varten tarvitaan sopivat Graph API -oikeudet.

**Tekninen huomio:**  
Graphin käyttöön tarvitaan token ja oikeudet. Se, mitä Graphilla voi tehdä, riippuu siitä, millaiset delegated tai application permissions sovellukselle on annettu.

**Riski:**  
Graphin kautta voidaan lukea tai muuttaa paljon tietoa. Väärät oikeudet voivat tehdä pienestä skriptistä ison riskin.

**Elikkäs:**  
Microsoft Graph on Microsoft 365:n ja Entran ohjelmallinen pääväylä. Sillä voi tehdä paljon hyvää ja paljon vahinkoa.

---

## Delegated Permission

**Delegated Permission** - Oikeus, jossa sovellus toimii kirjautuneen käyttäjän puolesta. Sovelluksen toiminta riippuu sekä käyttäjän omista oikeuksista että sovellukselle myönnetyistä oikeuksista.

Delegated permissionissä käyttäjä on mukana tilanteessa.

Sovellus ei toimi täysin yksin, vaan käyttäjän kontekstissa.

**Esimerkkitilanne:**  
Aku kirjautuu raportointisovellukseen Microsoft-tunnuksella.

Sovellus pyytää oikeuden lukea Akun perustiedot ja profiilin.

Sovellus toimii Akun puolesta. Se ei saa lukea kaikkea organisaation dataa vain siksi, että Aku kirjautui sisään.

Jos Aku ei itse pääse HR-raportteihin, sovelluksenkaan ei pitäisi päästä niihin Akun nimissä.

**Tekninen huomio:**  
Delegated permission = käyttäjä + sovellus. Molemmat vaikuttavat lopputulokseen.

**Riski:**  
Jos käyttäjä hyväksyy sovellukselle oikeuksia ymmärtämättä niitä, sovellus voi saada pääsyn käyttäjän tietoihin tai toimintoihin käyttäjän nimissä.

**Elikkäs:**  
Delegated permission tarkoittaa, että sovellus toimii käyttäjän puolesta. Sovellus ei ole yksin liikenteessä, vaan käyttäjä on mukana.

---

## Application Permission

**Application Permission** - Oikeus, jossa sovellus toimii omilla oikeuksillaan ilman kirjautunutta käyttäjää.

Application permission voi olla hyvin vahva oikeus, koska sovellus ei ole sidottu yksittäisen käyttäjän käyttöoikeuksiin.

Sovellus voi toimia taustalla esimerkiksi ajastetusti tai palveluna.

**Esimerkkitilanne:**  
Ankkalinna Oy:n automaatio hakee joka yö listan kaikista käyttäjistä ja heidän ryhmäjäsenyyksistään.

Kukaan käyttäjä ei ole kirjautuneena sovellukseen.

Sovellus käyttää application permission -oikeutta Microsoft Graphiin.

Jos sovellukselle on annettu oikeus lukea kaikki käyttäjät, se voi tehdä sen omalla sovellusidentiteetillään.

**Tekninen huomio:**  
Application permission vaatii usein admin consentin, koska oikeus voi koskea koko organisaatiota.

**Riski:**  
Application permission voi antaa sovellukselle laajan pääsyn ilman käyttäjän rajoituksia. Tämä pitää arvioida todella tarkasti.

**Elikkäs:**  
Application permission tarkoittaa, että sovellus toimii omilla oikeuksillaan. Tämä on tehokas, mutta myös vaarallinen, jos oikeudet ovat liian leveät.

---

## Admin Consent

**Admin Consent** - Ylläpitäjän hyväksyntä sovelluksen tarvitsemille oikeuksille.

Admin consent tarvitaan usein silloin, kun sovellus pyytää laajoja tai organisaatiotason oikeuksia.

Admin consent on tärkeä kontrolli, koska tavallisen käyttäjän ei pitäisi voida hyväksyä mitä tahansa sovellusta lukemaan organisaation tietoja.

**Esimerkkitilanne:**  
Ankkalinna Oy:n sovellus pyytää oikeutta lukea kaikkien käyttäjien perustiedot Microsoft Graphista.

Tavallinen käyttäjä ei voi hyväksyä tätä koko organisaation puolesta.

Ylläpitäjän pitää arvioida:

- miksi sovellus tarvitsee oikeuden
- mitä dataa oikeus koskee
- onko oikeus liian laaja
- kuka omistaa sovelluksen
- onko sovellus luotettava
- miten oikeutta valvotaan
- onko oikeus määräaikainen tai tarkistettava myöhemmin

Jos arvio on kunnossa, admin voi antaa consentin.

**Tekninen huomio:**  
Admin consent ei saa olla kumileimasin. Se on tietoturvakontrolli.

**Riski:**  
Jos admin hyväksyy sovelluksia tarkistamatta, organisaatio voi antaa sovelluksille pääsyn dataan, jota ne eivät oikeasti tarvitse.

**Elikkäs:**  
Admin consent on ylläpitäjän lupa sovellukselle. Ei “paina hyväksy että päästään kotiin”, vaan oikea riskipäätös.

---

## User Consent

**User Consent** - Käyttäjän oma hyväksyntä sovelluksen pyytämille oikeuksille, jos organisaation asetukset sallivat sen.

User consent voi olla hyödyllinen pienissä ja vähäriskisissä tilanteissa, mutta se voi olla myös riski.

Käyttäjä ei aina ymmärrä, mitä sovellus pyytää.

**Esimerkkitilanne:**  
Aku löytää uuden tuottavuussovelluksen ja kirjautuu siihen Microsoft-tilillään.

Sovellus pyytää oikeutta lukea Akun profiilitiedot ja kalenterin.

Jos user consent on sallittu, Aku voi hyväksyä pyynnön itse.

Jos organisaatiossa tätä ei ole rajattu, käyttäjät voivat vahingossa antaa sovelluksille pääsyä tietoihin, joita sovelluksen ei pitäisi saada.

**Tekninen huomio:**  
Monissa organisaatioissa user consentia rajoitetaan, valvotaan tai ohjataan admin approval -prosessin kautta.

**Riski:**  
Käyttäjä voi hyväksyä haitallisen tai liian uteliaan sovelluksen, jos hän ei ymmärrä consent-ruudun merkitystä.

**Elikkäs:**  
User consent on käyttäjän antama lupa sovellukselle. Kätevä, mutta riskialtis, jos käyttäjät painavat Allow kuin se olisi karkkinappi.

---

## Consent Grant

**Consent Grant** - Myönnetty suostumus sovelluksen oikeuksille. Se kertoo, mitä oikeuksia sovellus on saanut ja kuka ne on hyväksynyt.

Consent grant on jälki siitä, että sovellukselle on annettu lupa johonkin.

Sitä voidaan tarkastella esimerkiksi sovellusten oikeuksien auditoinnissa.

**Esimerkkitilanne:**  
Ankkalinna Oy tekee sovellusten käyttöoikeustarkistuksen.

Tarkistuksessa huomataan, että vanhalle raportointisovellukselle on annettu oikeus lukea kaikki käyttäjätiedot Microsoft Graphista.

Sovellusta ei ole käytetty vuoteen.

Consent grant näyttää, mitä oikeuksia sovellukselle on joskus hyväksytty.

Tämän perusteella IAM-tiimi voi kysyä:

- tarvitaanko sovellusta vielä
- tarvitseeko se edelleen oikeudet
- pitäisikö consent poistaa
- kuka omistaa sovelluksen
- onko sovelluksella vanhentunut secret

**Tekninen huomio:**  
Consent grantit kannattaa tarkistaa säännöllisesti, koska vanhat hyväksynnät voivat jäädä voimaan vuosiksi.

**Riski:**  
Vanha sovellus voi säilyttää oikeuksia, vaikka sitä ei enää käytetä. Tämä on sovellusten access drift.

**Elikkäs:**  
Consent grant on jälki annetusta luvasta. Se kertoo, mitä sovellukselle on sallittu.

---

## Single Sign-On

**Single Sign-On** - Kertakirjautuminen. Käyttäjä kirjautuu kerran organisaation identiteetillä ja pääsee sen jälkeen sovelluksiin ilman erillistä salasanaa jokaiseen palveluun.

SSO helpottaa käyttäjän arkea ja parantaa hallintaa, jos se toteutetaan oikein.

SSO voidaan toteuttaa esimerkiksi:

- SAML:lla
- OpenID Connectilla
- OAuth 2.0 -pohjaisilla malleilla
- Entra ID:n sovellusintegraatioilla

**Esimerkkitilanne:**  
Ankkalinna Oy ottaa käyttöön HR-sovelluksen.

Sen sijaan, että käyttäjille luodaan erilliset HR-sovelluksen salasanat, sovellus liitetään Entra ID:hen SSO:lla.

Aku kirjautuu HR-sovellukseen Microsoft-tunnuksellaan.

Kun Aku lähtee yrityksestä ja hänen Entra-tilinsä suljetaan, myös pääsy HR-sovellukseen voidaan katkaista hallitummin.

**Tekninen huomio:**  
SSO ei yksin ratkaise käyttöoikeushallintaa. Se hoitaa kirjautumista, mutta sovelluksen sisäiset roolit ja oikeudet pitää silti hallita.

**Riski:**  
Jos SSO on käytössä mutta käyttäjien pääsyjä sovelluksessa ei poisteta oikein, käyttäjä voi jäädä sovelluksen sisälle vanhoilla oikeuksilla.

**Elikkäs:**  
SSO tarkoittaa yksi kirjautuminen, monta sovellusta. Hyvä käyttäjälle, mutta vaatii kunnon pääsynhallinnan taustalle.

---

## Enterprise App Assignment

**Enterprise App Assignment** - Määritys, jolla käyttäjä tai ryhmä annetaan sovelluksen käyttäjäksi Enterprise Applicationissa.

Assignment kertoo, kenelle sovellus on sallittu.

Sovelluksen asetuksista riippuen vain assigned-käyttäjät voivat päästä sovellukseen.

**Esimerkkitilanne:**  
Ankkalinna Oy ottaa käyttöön raportointisovelluksen.

Sovelluksen käyttö sallitaan vain ryhmälle `Reporting-Users`.

Enterprise Applicationissa määritetään, että `Reporting-Users`-ryhmä on assigned sovellukseen.

Kun Aku lisätään ryhmään, hän saa mahdollisuuden kirjautua sovellukseen.

Kun Aku poistetaan ryhmästä, pääsy sovellukseen poistuu.

**Tekninen huomio:**  
Assignment on hyvä tapa rajata sovelluksen käyttöä, mutta pitää ymmärtää, tuleeko käyttäjän pääsy ryhmästä, access packagesta, suorasta assignmentista vai sovelluksen omista rooleista.

**Riski:**  
Jos sovellus sallii pääsyn kaikille käyttäjille eikä assignmentia käytetä, sovellus voi olla avoimempi kuin oli tarkoitus.

**Elikkäs:**  
Enterprise App Assignment kertoo, kuka saa käyttää sovellusta. Se on sovelluspääsyn portinvartija.

---

## App Role

**App Role** - Sovelluksen määrittelemä rooli, jonka avulla käyttäjille tai ryhmille voidaan antaa eri tasoisia oikeuksia sovelluksessa.

App role voi olla esimerkiksi:

- Reader
- Contributor
- Approver
- Manager
- Administrator

App roles voivat auttaa, jos sovellus tukee roolipohjaista pääsynhallintaa Entra ID:n kautta.

**Esimerkkitilanne:**  
Ankkalinna Oy:n raportointisovelluksessa on kaksi roolia:

- Report Reader
- Report Admin

Taloushallinnon käyttäjät saavat Report Reader -roolin.

Vain raportointitiimin pääkäyttäjät saavat Report Admin -roolin.

Näin kaikki sovelluksen käyttäjät eivät saa admin-oikeuksia sovelluksen sisällä.

**Tekninen huomio:**  
App role -määritykset pitää dokumentoida. Muuten kukaan ei myöhemmin tiedä, mitä sovelluksen `Admin` tai `PowerUser` oikeasti tekee.

**Riski:**  
Jos app roleja jaetaan väärin, käyttäjä voi saada sovelluksen sisällä liian laajat oikeudet, vaikka Entra-pääsy näyttäisi muuten siistiltä.

**Elikkäs:**  
App role kertoo, mitä käyttäjä saa tehdä sovelluksen sisällä. Pääsy sovellukseen ja rooli sovelluksessa eivät ole sama asia.

---

## OAuth Permission Grant

**OAuth Permission Grant** - OAuth-pohjainen suostumus tai oikeusmyöntö, joka kertoo, että sovellus on saanut luvan käyttää tiettyä API-oikeutta.

OAuth permission grant liittyy consent-malliin ja sovellusten oikeuksiin.

Se voi liittyä esimerkiksi delegated permission -oikeuksiin, joissa käyttäjä tai admin on hyväksynyt sovellukselle tietyn oikeuden.

**Esimerkkitilanne:**  
Aku kirjautuu sovellukseen, joka pyytää oikeutta lukea hänen profiilitietonsa.

Aku hyväksyy pyynnön.

Tämän jälkeen tenanttiin voi jäädä tieto siitä, että sovellukselle on myönnetty kyseinen oikeus Akun puolesta.

**Tekninen huomio:**  
OAuth permission grantit voivat olla tärkeitä sovellusoikeuksien auditoinnissa ja siivouksessa.

**Riski:**  
Jos käyttäjät ovat vuosien aikana hyväksyneet paljon sovelluksia, ympäristöön voi kertyä vanhoja oikeusmyöntöjä, joita kukaan ei enää muista.

**Elikkäs:**  
OAuth permission grant on sovellukselle annettu lupa OAuth-maailmassa. Se on yksi tapa nähdä, mitä sovelluksille on sallittu.

---

## Secret Expiration

**Secret Expiration** - Client secretin voimassaolon päättyminen.

Client secretit eivät yleensä ole ikuisia. Niillä on päättymispäivä, jonka jälkeen sovellus ei voi enää käyttää kyseistä secretiä tunnistautumiseen.

Tämä on hyvä tietoturvan kannalta, mutta voi aiheuttaa käyttökatkon, jos sitä ei seurata.

**Esimerkkitilanne:**  
Ankkalinna Oy:n raportointiautomaatio käyttää client secretiä.

Secret vanhenee viikonloppuna, mutta kukaan ei ole huomannut sitä.

Maanantaiaamuna raportit eivät muodostu.

Syy ei ole “mystinen Microsoft”, vaan vanhentunut client secret.

**Tekninen huomio:**  
Client secretien vanhenemiselle pitäisi olla seuranta, omistaja ja uusimisprosessi.

**Riski:**  
Vanhentunut secret voi rikkoa integraation. Liian pitkäikäinen secret taas kasvattaa tietoturvariskiä.

**Elikkäs:**  
Secret expiration tarkoittaa, että sovelluksen salasana vanhenee. Jos kukaan ei seuraa sitä, maanantai voi alkaa mukavasti liekeissä.

---

## Application Ownership

**Application Ownership** - Sovelluksen omistajuus. Tarkoittaa sitä, kuka vastaa sovelluksesta, sen oikeuksista, salaisuuksista, asetuksista ja elinkaaresta.

Application owner ei ole koriste. Jonkun pitää tietää:

- miksi sovellus on olemassa
- kuka käyttää sovellusta
- mitä oikeuksia sovelluksella on
- kuka hyväksyy muutokset
- milloin oikeudet tarkistetaan
- milloin client secret tai sertifikaatti vanhenee
- poistetaanko sovellus, jos sitä ei enää käytetä

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on vanha integraatiosovellus, joka lukee käyttäjätietoja Graphista.

Kun IAM-tiimi kysyy, kuka sovelluksen omistaa, kukaan ei tiedä.

Sovelluksella on edelleen laajat oikeudet ja voimassa oleva client secret.

Tämä on huono tilanne.

Hyvässä mallissa sovelluksella olisi selkeä omistaja, dokumentoitu käyttötarkoitus ja säännöllinen tarkistus.

**Tekninen huomio:**  
Sovellusten omistajuus on kriittinen osa governancea. Ilman omistajaa sovellusoikeuksia on vaikea arvioida.

**Riski:**  
Omistajaton sovellus voi jäädä tenanttiin oikeuksineen vuosiksi. Ja kyllä, se on juuri niin huono idea kuin miltä kuulostaa.

**Elikkäs:**  
Application ownership kertoo, kuka vastaa sovelluksesta. Jos kukaan ei omista sitä, kukaan ei myöskään siivoa sitä.

---

## Stale Application

**Stale Application** - Vanhentunut tai käyttämättömäksi jäänyt sovellus, app registration, enterprise application tai service principal, joka on edelleen olemassa tenantissa.

Stale application voi syntyä, kun:

- projekti päättyy
- sovellus poistuu käytöstä
- integraatio korvataan toisella
- omistaja vaihtaa työpaikkaa
- dokumentaatio unohtuu
- client secret jää voimaan
- API-oikeuksia ei poisteta

**Esimerkkitilanne:**  
Ankkalinna Oy:llä oli testisovellus, jolla harjoiteltiin Microsoft Graphia.

Sovellusta ei ole käytetty vuoteen.

Silti sillä on edelleen:

- app registration
- service principal
- client secret
- Graph API -oikeus lukea käyttäjiä
- admin consent

Kukaan ei muista, miksi sovellus on luotu.

Tämä on stale application.

**Tekninen huomio:**  
Stale applicationit kannattaa tarkistaa säännöllisesti esimerkiksi sign-in activityn, omistajien, secretien ja API-oikeuksien perusteella.

**Riski:**  
Käyttämätön sovellus voi silti sisältää voimassa olevia oikeuksia. Jos sen secret vuotaa, kukaan ei välttämättä edes huomaa käyttöä ajoissa.

**Elikkäs:**  
Stale application on vanha sovellusraato tenantissa. Jos sitä ei käytetä, omisteta tai ymmärretä, se pitää tarkistaa ja mahdollisesti poistaa.
