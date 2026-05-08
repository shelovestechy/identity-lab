# 08 - Authentication and Protocols

Tämä sivu kokoaa Microsoft Entra ID:n kirjautumiseen, tunnistautumiseen, valtuutukseen, protokolliin ja tokeneihin liittyviä käsitteitä.

Tavoite on ymmärtää, että kirjautuminen ei ole vain:

> “Käyttäjä antaa salasanan ja pääsee sisään.”

Modernissa Microsoft-ympäristössä kirjautumiseen voi liittyä monta eri osaa:

- kuka käyttäjä väittää olevansa
- miten käyttäjän henkilöllisyys todistetaan
- mitä sovellusta käyttäjä käyttää
- mitä sovellus pyytää tehdä
- mitä oikeuksia käyttäjällä tai sovelluksella on
- mitä token sisältää
- kuinka kauan istunto pysyy voimassa
- mitä tapahtuu, jos riski muuttuu
- mitä protokollaa sovellus käyttää

Tämä on yksi niistä aiheista, jossa sanat menevät helposti sekaisin. Authentication, authorization, OAuth, OIDC, SAML ja tokenit kuulostavat aluksi samalta tekniseltä puurolta.

Mutta kun ne erottaa toisistaan, koko IAM-ajattelu alkaa napsua paremmin paikalleen.

---

## Contents

- [Authentication](#authentication)
- [Authorization](#authorization)
- [Authentication vs Authorization](#authentication-vs-authorization)
- [Credential](#credential)
- [Password](#password)
- [Multi-Factor Authentication](#multi-factor-authentication)
- [MFA](#mfa)
- [Authentication Method](#authentication-method)
- [Microsoft Authenticator](#microsoft-authenticator)
- [Passwordless Authentication](#passwordless-authentication)
- [Passkey](#passkey)
- [FIDO2 Security Key](#fido2-security-key)
- [Self-Service Password Reset](#self-service-password-reset)
- [SSPR](#sspr)
- [Password Protection](#password-protection)
- [Modern Authentication](#modern-authentication)
- [Legacy Authentication](#legacy-authentication)
- [Single Sign-On](#single-sign-on)
- [SSO](#sso)
- [Federation](#federation)
- [SAML](#saml)
- [OAuth 2.0](#oauth-20)
- [OpenID Connect](#openid-connect)
- [OIDC](#oidc)
- [Token](#token)
- [ID Token](#id-token)
- [Access Token](#access-token)
- [Refresh Token](#refresh-token)
- [Claims](#claims)
- [Scope](#scope)
- [Consent](#consent)
- [Redirect URI](#redirect-uri)
- [Client ID](#client-id)
- [Session](#session)
- [Sign-in Frequency](#sign-in-frequency)
- [Continuous Access Evaluation](#continuous-access-evaluation)

---

## Authentication

**Authentication** - Todentaminen. Tarkoittaa sitä, että käyttäjä tai sovellus todistaa olevansa se, kuka väittää olevansa.

Authentication vastaa kysymykseen:

> Kuka sinä olet, ja miten todistat sen?

Todentaminen voi tapahtua esimerkiksi:

- salasanalla
- Microsoft Authenticatorilla
- MFA:lla
- passkeyllä
- FIDO2-turva-avaimella
- sertifikaatilla
- sovelluksen client secretillä
- managed identityllä

**Esimerkkitilanne:**  
Aku Ankka kirjautuu Microsoft 365:een.

Hän antaa käyttäjätunnuksen ja salasanan.

Sen jälkeen Microsoft Entra ID pyytää MFA-vahvistuksen Authenticatorilla.

Kun Aku hyväksyy kirjautumisen, Entra ID voi todeta, että Aku on todennettu.

**Tekninen huomio:**  
Authentication ei vielä tarkoita, että käyttäjä saa tehdä kaiken. Se tarkoittaa vain, että käyttäjän identiteetti on todistettu.

**Riski:**  
Jos authentication perustuu vain salasanaan, varastettu salasana voi riittää kirjautumiseen.

**Elikkäs:**  
Authentication kertoo kuka käyttäjä on. Se ei vielä päätä, mihin käyttäjä pääsee.

---

## Authorization

**Authorization** - Valtuutus. Tarkoittaa sitä, mitä todennettu käyttäjä tai sovellus saa tehdä.

Authorization vastaa kysymykseen:

> Mihin sinulla on lupa?

Valtuutus voi perustua esimerkiksi:

- ryhmäjäsenyyteen
- rooliin
- sovelluksen sisäiseen rooliin
- API-oikeuteen
- access packageen
- Conditional Access -päätökseen
- käyttäjän attribuutteihin
- resource ownerin hyväksyntään

**Esimerkkitilanne:**  
Aku kirjautuu onnistuneesti raportointisovellukseen.

Kirjautuminen todistaa, että hän on Aku.

Mutta sovellus tarkistaa vielä, saako Aku nähdä talousraportteja.

Jos Aku kuuluu `Finance-Reports-Read` -ryhmään, hän saa lukea raportteja.

Jos ei kuulu, kirjautuminen onnistuu mutta raportit eivät aukea.

**Tekninen huomio:**  
Authentication ja authorization ovat eri asioita. Käyttäjä voi olla kirjautunut sisään, mutta hänellä ei silti ole oikeutta tiettyyn resurssiin.

**Riski:**  
Jos sovellus luulee, että kirjautuminen yksin riittää pääsyksi kaikkeen, käyttäjät voivat päästä tietoihin ilman oikeaa valtuutusta.

**Elikkäs:**  
Authorization kertoo mitä käyttäjä saa tehdä. Kirjautuminen sisään ei tarkoita automaattisesti pääsyä kaikkeen.

---

## Authentication vs Authorization

**Authentication vs Authorization** - Authentication tarkoittaa henkilöllisyyden todistamista. Authorization tarkoittaa oikeuksien tarkistamista.

Nämä menevät helposti sekaisin, mutta ero on tärkeä.

Authentication:

> Oletko oikeasti Aku Ankka?

Authorization:

> Saako Aku Ankka nähdä tämän tiedoston?

**Esimerkkitilanne:**  
Iines kirjautuu Ankkalinna Oy:n HR-sovellukseen Microsoft-tunnuksella.

Authentication onnistuu, koska Entra ID tunnistaa Iineksen.

Seuraavaksi sovellus tarkistaa, onko Iineksellä HR-rooli.

Jos Iines ei kuulu HR-ryhmään, hän ei saa nähdä HR-dataa, vaikka kirjautuminen onnistui.

**Tekninen huomio:**  
OIDC liittyy usein authenticationiin eli käyttäjän tunnistamiseen. OAuth 2.0 liittyy authorizationiin eli siihen, mitä sovellus saa tehdä.

**Riski:**  
Jos nämä käsitteet sekoitetaan, voidaan rakentaa sovellus, joka tunnistaa käyttäjän hyvin mutta ei rajoita tekemistä oikein.

**Elikkäs:**  
Authentication kysyy “kuka olet?” Authorization kysyy “mitä saat tehdä?”

---

## Credential

**Credential** - Tunnistautumistieto tai todiste, jolla käyttäjä, sovellus tai palvelu todistaa identiteettinsä.

Credential voi olla esimerkiksi:

- salasana
- PIN
- passkey
- FIDO2-avain
- certificate
- client secret
- yksityinen avain
- biometrinen tunniste laitteen kautta

**Esimerkkitilanne:**  
Ankkalinna Oy:n käyttäjillä voi olla salasanat ja Microsoft Authenticator käytössä.

Sovelluksella voi olla client secret tai certificate credential.

Molemmat ovat credentialeja, mutta toinen liittyy ihmiskäyttäjään ja toinen sovellukseen.

**Tekninen huomio:**  
Credentialeja pitää suojata. Tämä koskee sekä käyttäjien salasanoja että sovellusten secrettejä.

**Riski:**  
Vuotanut credential voi antaa hyökkääjälle mahdollisuuden esiintyä käyttäjänä tai sovelluksena.

**Elikkäs:**  
Credential on todiste, jolla joku tai jokin todistaa olevansa oikea identiteetti.

---

## Password

**Password** - Salasana. Perinteinen tunnistautumistapa, jolla käyttäjä yrittää todistaa henkilöllisyytensä.

Salasana on edelleen yleinen, mutta yksinään heikko suoja.

Salasanoihin liittyy ongelmia:

- niitä kierrätetään
- niitä arvataan
- niitä kalastellaan
- niitä kirjoitetaan muistiin
- niitä vuotaa palveluista
- käyttäjät tekevät niistä liian yksinkertaisia
- hyökkääjät kokeilevat niitä automaattisesti

**Esimerkkitilanne:**  
Aku käyttää samaa salasanaa työtilillä ja vanhassa harrastusfoorumissa.

Foorumi hakkeroidaan ja salasana vuotaa.

Hyökkääjä kokeilee samaa salasanaa Microsoft 365 -kirjautumiseen.

Jos MFA ei ole käytössä, riski kasvaa heti.

**Tekninen huomio:**  
Salasana ei ole kuollut, mutta sen päälle pitää rakentaa lisäsuojaa kuten MFA, riskipohjainen kirjautuminen ja password protection.

**Riski:**  
Pelkkä salasana on liian helppo varastaa, arvata tai kalastella.

**Elikkäs:**  
Password on vanha perusavain. Se toimii, mutta yksinään se on aika surkea lukko nykypäivänä.

---

## Multi-Factor Authentication

**Multi-Factor Authentication** - Monivaiheinen tunnistautuminen. Käyttäjän pitää todistaa henkilöllisyytensä useammalla kuin yhdellä tavalla.

MFA voi perustua esimerkiksi:

- johonkin mitä käyttäjä tietää, kuten salasana
- johonkin mitä käyttäjällä on, kuten puhelin tai turva-avain
- johonkin mitä käyttäjä on, kuten biometrinen tunnistus laitteen kautta

**Esimerkkitilanne:**  
Iines kirjautuu Microsoft 365:een.

Ensin hän antaa salasanan.

Sen jälkeen hän hyväksyy kirjautumisen Microsoft Authenticatorissa.

Hyökkääjä, jolla on vain salasana, ei pääse sisään ilman toista tekijää.

**Tekninen huomio:**  
MFA:n laatu riippuu käytetystä menetelmästä. Kaikki MFA ei ole yhtä vahvaa.

**Riski:**  
MFA fatigue -hyökkäyksessä käyttäjälle lähetetään paljon hyväksymispyyntöjä, kunnes käyttäjä vahingossa hyväksyy yhden.

**Elikkäs:**  
MFA tarkoittaa, ettei pelkkä salasana riitä. Tarvitaan toinen todiste.

---

## MFA

**MFA** - Lyhenne sanoista Multi-Factor Authentication.

MFA on yksi tärkeimmistä perussuojauksista Microsoft 365- ja Entra-ympäristöissä.

**Esimerkkitilanne:**  
Ankkalinna Oy vaatii MFA:n kaikilta käyttäjiltä, mutta erityisen tiukasti admin-rooleilta ja ulkoisilta kirjautumisilta.

Jos Roope yrittää kirjautua admin-portaaliin, häneltä vaaditaan MFA.

**Tekninen huomio:**  
MFA voidaan pakottaa esimerkiksi Conditional Access -policyllä.

**Riski:**  
Jos MFA jätetään pois admin-tileiltä, organisaation tärkeimmät tunnukset jäävät liian heikosti suojatuiksi.

**Elikkäs:**  
MFA = salasana plus toinen varmistus. Ei täydellinen, mutta paljon parempi kuin pelkkä salasana.

---

## Authentication Method

**Authentication Method** - Tapa, jolla käyttäjä todentaa henkilöllisyytensä.

Authentication method voi olla esimerkiksi:

- password
- Microsoft Authenticator
- SMS
- voice call
- FIDO2 security key
- passkey
- Windows Hello for Business
- Temporary Access Pass

**Esimerkkitilanne:**  
Ankkalinna Oy sallii käyttäjille Microsoft Authenticatorin ja FIDO2-avaimet.

SMS pidetään varamenetelmänä vain rajatuissa tilanteissa, koska se ei ole yhtä vahva.

**Tekninen huomio:**  
Authentication methods kannattaa hallita keskitetysti. Organisaation pitää tietää, mitä menetelmiä sallitaan ja kenelle.

**Riski:**  
Heikot authentication methodit voivat jättää aukon muuten hyvään kirjautumissuojaan.

**Elikkäs:**  
Authentication method on tapa todistaa henkilöllisyys. Kaikki tavat eivät ole yhtä turvallisia.

---

## Microsoft Authenticator

**Microsoft Authenticator** - Microsoftin mobiilisovellus, jota käytetään MFA:han ja joissain tapauksissa passwordless-kirjautumiseen.

Microsoft Authenticator voi tukea esimerkiksi:

- push-ilmoituksia
- number matchingia
- kertakoodeja
- passwordless sign-in -kirjautumista

**Esimerkkitilanne:**  
Aku kirjautuu Outlookiin.

Puhelimeen tulee Authenticator-ilmoitus, jossa näkyy numero.

Aku syöttää oikean numeron sovellukseen ja hyväksyy kirjautumisen.

Tämä vähentää riskiä, että käyttäjä hyväksyisi väärän kirjautumispyynnön sokkona.

**Tekninen huomio:**  
Number matching parantaa MFA:n turvallisuutta, koska käyttäjän pitää yhdistää kirjautumisruudussa näkyvä numero puhelimen hyväksyntään.

**Riski:**  
Jos käyttäjä hyväksyy Authenticator-pyynnön miettimättä, hän voi vahingossa päästää hyökkääjän sisään.

**Elikkäs:**  
Microsoft Authenticator on MFA- ja kirjautumissovellus. Hyvä työkalu, mutta käyttäjän pitää ymmärtää mitä hän hyväksyy.

---

## Passwordless Authentication

**Passwordless Authentication** - Kirjautuminen ilman perinteistä salasanaa.

Passwordless voi käyttää esimerkiksi:

- Microsoft Authenticatoria
- Windows Hello for Businessia
- FIDO2-turva-avainta
- passkeytä
- biometriaa laitteen kautta

Ajatus on vähentää salasanoihin liittyviä riskejä.

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa vähentää salasanojen kalastelun riskiä.

Käyttäjille otetaan käyttöön passwordless sign-in Microsoft Authenticatorilla.

Iines ei kirjoita salasanaa kirjautumisessa, vaan hyväksyy kirjautumisen vahvemmalla menetelmällä.

**Tekninen huomio:**  
Passwordless ei tarkoita, että turvallisuutta olisi vähemmän. Hyvin toteutettuna se voi olla vahvempi kuin salasana plus heikko MFA.

**Riski:**  
Jos käyttöönotto tehdään huonosti, käyttäjät hämmentyvät ja Service Desk saa kauniin lumivyöryn tikettejä.

**Elikkäs:**  
Passwordless tarkoittaa, että salasana ei ole kirjautumisen pääjuttu. Vähemmän salasanoja, vähemmän salasanadraamaa.

---

## Passkey

**Passkey** - Moderni salasanaton kirjautumistapa, jossa käyttäjä todentaa itsensä esimerkiksi laitteen, biometrian tai PIN-koodin avulla ilman perinteistä salasanaa.

Passkeyt perustuvat vahvempaan kryptografiseen malliin kuin tavallinen salasana.

**Esimerkkitilanne:**  
Aku kirjautuu palveluun passkeyllä.

Hän vahvistaa kirjautumisen läppärin biometrisellä tunnistuksella tai PIN-koodilla.

Salasanaa ei tarvitse kirjoittaa eikä se voi samalla tavalla vuotaa kalastelusivulle.

**Tekninen huomio:**  
Passkeyt voivat vähentää phishing-riskiä, koska käyttäjä ei syötä salasanaa hyökkääjän tekemälle sivulle.

**Riski:**  
Passkeyn käyttöönotossa pitää miettiä palautus, laitteiden vaihto ja käyttäjän tukiprosessi.

**Elikkäs:**  
Passkey on moderni tapa kirjautua ilman salasanaa. Käyttäjä todistaa itsensä laitteella, ei muistamalla `Kesä2026!` joka paikassa.

---

## FIDO2 Security Key

**FIDO2 Security Key** - Fyysinen turva-avain, jota voidaan käyttää vahvaan tunnistautumiseen.

FIDO2-avain voi olla esimerkiksi USB-, NFC- tai Bluetooth-avain.

**Esimerkkitilanne:**  
Ankkalinna Oy antaa admin-käyttäjille FIDO2-turva-avaimet.

Kun Roope kirjautuu admin-portaaliin, hänen pitää käyttää fyysistä turva-avainta.

Pelkkä salasana ja puhelin eivät riitä.

**Tekninen huomio:**  
FIDO2 on vahva vaihtoehto erityisesti korkean riskin käyttäjille, kuten admin-rooleille.

**Riski:**  
Fyysisen avaimen katoaminen pitää huomioida prosessissa. Pitää olla palautusmalli, mutta ei sellainen, joka vesittää koko suojauksen.

**Elikkäs:**  
FIDO2 security key on fyysinen avain kirjautumiseen. Todella vahva, kun sitä käytetään oikein.

---

## Self-Service Password Reset

**Self-Service Password Reset** - Ominaisuus, jonka avulla käyttäjä voi palauttaa tai vaihtaa salasanansa itse ilman Service Deskin apua.

SSPR voi vaatia käyttäjältä vahvistuksen esimerkiksi Authenticatorilla, puhelimella tai muulla määritellyllä menetelmällä.

**Esimerkkitilanne:**  
Hupu unohtaa salasanansa aamulla.

Sen sijaan että hän soittaa Service Deskiin, hän käyttää SSPR:ää.

Hän vahvistaa henkilöllisyytensä ja asettaa uuden salasanan itse.

**Tekninen huomio:**  
SSPR vähentää Service Deskin kuormaa, mutta sen turvallisuus riippuu palautusmenetelmistä.

**Riski:**  
Jos salasanan palautusmenetelmät ovat heikkoja, hyökkääjä voi yrittää kaapata tilin palautusprosessin kautta.

**Elikkäs:**  
SSPR antaa käyttäjälle turvallisen tavan palauttaa salasana itse. Hyvä käyttäjälle, hyvä Service Deskille.

---

## SSPR

**SSPR** - Lyhenne sanoista Self-Service Password Reset.

**Esimerkkitilanne:**  
Ankkalinna Oy ottaa SSPR:n käyttöön, jotta salasanan unohtaminen ei aina aiheuta tikettiä.

Käyttäjät rekisteröivät palautusmenetelmät etukäteen.

**Tekninen huomio:**  
SSPR vaatii hyvän käyttöönoton ja käyttäjien ohjeistuksen.

**Riski:**  
Jos käyttäjät eivät rekisteröi menetelmiä, SSPR ei auta silloin kun sitä tarvitaan.

**Elikkäs:**  
SSPR = käyttäjä voi palauttaa salasanansa itse hallitusti.

---

## Password Protection

**Password Protection** - Toiminto, jolla estetään heikkojen, yleisten tai organisaatiolle riskialttiiden salasanojen käyttö.

Password Protection voi estää esimerkiksi:

- yleisiä salasanoja
- organisaation nimeen liittyviä salasanoja
- helposti arvattavia salasanoja
- vuodoissa usein näkyviä salasanoja

**Esimerkkitilanne:**  
Ankkalinna Oy ei halua käyttäjien käyttävän salasanoja kuten:

- `Ankkalinna2026`
- `Aku12345`
- `Password1`
- `Kesä2026!`

Password Protection voi estää tällaisia salasanoja.

**Tekninen huomio:**  
Microsoft Entra Password Protection voi auttaa suojaamaan sekä pilvi- että tietyissä malleissa myös paikallista AD-ympäristöä.

**Riski:**  
Jos käyttäjät saavat valita liian helppoja salasanoja, hyökkääjän työ helpottuu.

**Elikkäs:**  
Password Protection estää huonoja salasanoja ennen kuin ne ehtivät käyttöön.

---

## Modern Authentication

**Modern Authentication** - Uudempi kirjautumismalli, joka tukee esimerkiksi MFA:ta, Conditional Accessia ja token-pohjaista kirjautumista.

Modern authentication perustuu yleensä nykyaikaisiin protokolliin kuten OAuth 2.0 ja OpenID Connect.

**Esimerkkitilanne:**  
Aku käyttää Outlookin modernia versiota Microsoft 365 -postiin.

Kirjautuminen kulkee Entra ID:n kautta ja voi vaatia MFA:n sekä Conditional Access -tarkistukset.

**Tekninen huomio:**  
Modern authentication mahdollistaa paljon paremmat suojauskontrollit kuin vanhat kirjautumistavat.

**Riski:**  
Jos organisaatio käyttää edelleen vanhoja clienttejä tai protokollia, kaikki modernit kontrollit eivät välttämättä toimi.

**Elikkäs:**  
Modern authentication on nykyaikainen kirjautumistapa, joka osaa pelata yhteen MFA:n ja Conditional Accessin kanssa.

---

## Legacy Authentication

**Legacy Authentication** - Vanha kirjautumistapa, joka ei tue moderneja suojausominaisuuksia kuten MFA:ta samalla tavalla.

Legacy authentication voi liittyä esimerkiksi vanhoihin sähköpostiprotokolliin tai sovelluksiin.

**Esimerkkitilanne:**  
Vanha sähköpostisovellus yrittää kirjautua Exchange Onlineen käyttäjän salasanalla, mutta ei tue MFA:ta.

Jos legacy authentication on sallittu, hyökkääjä voi yrittää käyttää sitä ohittaakseen modernit suojaukset.

**Tekninen huomio:**  
Conditional Accessilla voidaan estää legacy authentication -kirjautumisia.

**Riski:**  
Legacy authentication voi olla iso takaovi, jos se jää käyttöön ilman pakottavaa syytä.

**Elikkäs:**  
Legacy authentication on vanha kirjautumistapa. Jos se ei tue MFA:ta, se on usein riski eikä nostalgiaesine.

---

## Single Sign-On

**Single Sign-On** - Kertakirjautuminen. Käyttäjä kirjautuu kerran ja pääsee useisiin sovelluksiin ilman erillistä salasanaa jokaiseen sovellukseen.

SSO parantaa käyttäjäkokemusta ja helpottaa pääsynhallintaa.

**Esimerkkitilanne:**  
Aku kirjautuu Microsoft-tilillään.

Sen jälkeen hän pääsee Teamsiin, SharePointiin ja HR-sovellukseen ilman erillisiä salasanoja.

Jos Akun tili suljetaan Entra ID:ssä, pääsy näihin SSO:n takana oleviin sovelluksiin voidaan katkaista keskitetymmin.

**Tekninen huomio:**  
SSO ei yksin päätä sovelluksen sisäisiä oikeuksia. Se hoitaa kirjautumisen, mutta sovelluksen roolit ja oikeudet pitää silti hallita.

**Riski:**  
Jos SSO toimii mutta deprovisioning ei, käyttäjä voi jäädä sovellukseen elämään vanhoilla oikeuksilla.

**Elikkäs:**  
SSO = yksi kirjautuminen, monta sovellusta. Kätevä, mutta ei vapauta oikeuksien hallinnasta.

---

## SSO

**SSO** - Lyhenne sanoista Single Sign-On.

**Esimerkkitilanne:**  
Ankkalinna Oy ottaa käyttöön SSO:n ServiceNow’hun.

Käyttäjät kirjautuvat ServiceNow’hun Microsoft-tunnuksella, eikä erillistä ServiceNow-salasanaa tarvita.

**Tekninen huomio:**  
SSO voidaan toteuttaa eri protokollilla, esimerkiksi SAML:lla tai OpenID Connectilla.

**Riski:**  
Jos SSO-asetukset määritetään väärin, käyttäjät eivät pääse sovellukseen tai pääsevät väärillä tiedoilla.

**Elikkäs:**  
SSO tarkoittaa kertakirjautumista. Vähemmän salasanoja, enemmän keskitettyä hallintaa.

---

## Federation

**Federation** - Luottosuhde identiteettijärjestelmien välillä. Federation mahdollistaa sen, että yksi järjestelmä luottaa toisen järjestelmän tekemään käyttäjän tunnistamiseen.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on kumppanisovellus, joka ei itse hallitse Ankkalinnan käyttäjien salasanoja.

Sen sijaan sovellus luottaa Ankkalinnan Entra ID:hen.

Kun Aku kirjautuu, Entra ID todentaa Akun ja sovellus hyväksyy tämän luottosuhteen perusteella.

**Tekninen huomio:**  
Federation voi käyttää eri protokollia, kuten SAMLia tai OpenID Connectia.

**Riski:**  
Jos federation-luottosuhde on väärin määritelty, sovellus voi luottaa vääriin tietoihin tai päästää käyttäjiä väärin sisään.

**Elikkäs:**  
Federation on järjestelmien välinen luottosopimus kirjautumisessa.

---

## SAML

**SAML** - Security Assertion Markup Language. Vanhempi mutta edelleen yleinen kirjautumisprotokolla, jota käytetään usein yrityssovellusten SSO-kirjautumisessa.

SAMLissa identiteettipalvelu antaa sovellukselle väitteen käyttäjästä.

Tätä väitettä kutsutaan assertioniksi.

**Esimerkkitilanne:**  
Ankkalinna Oy käyttää vanhempaa HR-järjestelmää, joka tukee SAML SSO:ta.

Kun Iines kirjautuu HR-järjestelmään, hänet ohjataan Entra ID:hen.

Entra ID todentaa Iineksen ja lähettää HR-sovellukselle SAML assertionin, jossa kerrotaan kuka Iines on.

**Tekninen huomio:**  
SAMLia käytetään paljon vanhemmissa enterprise-sovelluksissa. Se ei ole sama asia kuin OAuth tai OIDC.

**Riski:**  
Väärät SAML claimit tai väärä NameID-asetus voivat aiheuttaa sen, että käyttäjä yhdistyy väärään profiiliin sovelluksessa.

**Elikkäs:**  
SAML on vanhempi mutta yleinen SSO-protokolla. Se kertoo sovellukselle, että käyttäjä on tunnistettu.

---

## OAuth 2.0

**OAuth 2.0** - Valtuutusprotokolla, jonka avulla sovellus voi saada luvan käyttää tiettyä resurssia tai rajapintaa ilman että käyttäjän salasanaa annetaan sovellukselle.

OAuth 2.0 liittyy erityisesti siihen, mitä sovellus saa tehdä.

**Esimerkkitilanne:**  
Raportointisovellus haluaa lukea Akun profiilitiedot Microsoft Graphista.

Aku kirjautuu ja sovellus pyytää luvan lukea tarvittavat tiedot.

Sovellus saa access tokenin, jolla se voi kutsua Graphia sallituilla oikeuksilla.

Akun salasanaa ei anneta raportointisovellukselle.

**Tekninen huomio:**  
OAuth 2.0 ei varsinaisesti ole käyttäjän tunnistautumisprotokolla. Siihen käytetään usein OpenID Connectia, joka rakentuu OAuthin päälle.

**Riski:**  
Jos OAuth-oikeudet ovat liian laajat tai consent-prosessi on löysä, sovellukset voivat saada liikaa pääsyä dataan.

**Elikkäs:**  
OAuth 2.0 kertoo, mitä sovellus saa tehdä. Se ei ole “kirjaudu sisään” -asia samalla tavalla kuin OIDC.

---

## OpenID Connect

**OpenID Connect** - Kirjautumisprotokolla, joka rakentuu OAuth 2.0:n päälle. Sen avulla sovellus voi tunnistaa käyttäjän.

OpenID Connect liittyy siihen, kuka käyttäjä on.

Se käyttää ID tokenia kertomaan sovellukselle käyttäjän identiteetistä.

**Esimerkkitilanne:**  
Ankkalinna Oy:n uusi web-sovellus haluaa antaa käyttäjien kirjautua Microsoft-tunnuksella.

Sovellus käyttää OpenID Connectia Entra ID:n kanssa.

Kun Aku kirjautuu, sovellus saa ID tokenin, josta se näkee, että käyttäjä on Aku.

**Tekninen huomio:**  
OIDC on usein moderni valinta uusille web-sovelluksille, jotka tarvitsevat Microsoft-kirjautumisen.

**Riski:**  
Jos sovellus ei validoi tokenia oikein, se voi luottaa väärennettyyn tai väärälle sovellukselle tarkoitettuun tokeniin.

**Elikkäs:**  
OpenID Connect kertoo sovellukselle kuka käyttäjä on. OAuth kertoo mitä sovellus saa tehdä.

---

## OIDC

**OIDC** - Lyhenne sanoista OpenID Connect.

**Esimerkkitilanne:**  
Kun käyttäjä kirjautuu moderniin sovellukseen Microsoft-tunnuksella, taustalla voi olla OIDC.

Sovellus saa ID tokenin ja tunnistaa käyttäjän.

**Tekninen huomio:**  
OIDC käyttää OAuth 2.0 -pohjaa, mutta lisää käyttäjän tunnistamisen.

**Riski:**  
OIDC-asetuksissa redirect URI, client ID ja tokenien validointi pitää määritellä oikein.

**Elikkäs:**  
OIDC on moderni kirjautumistapa sovelluksille.

---

## Token

**Token** - Digitaalinen lupalappu tai tunniste, jota käytetään kirjautumisen, tunnistamisen ja pääsynhallinnan yhteydessä.

Token voi sisältää tietoa esimerkiksi:

- käyttäjästä
- sovelluksesta
- oikeuksista
- voimassaoloajasta
- tenantista
- audience-tiedosta
- claim-tiedoista

**Esimerkkitilanne:**  
Aku kirjautuu sovellukseen.

Entra ID antaa sovellukselle tokenin.

Sovellus lukee tokenista, kuka käyttäjä on ja mitä tietoja token sisältää.

Jos sovellus kutsuu Microsoft Graphia, se käyttää access tokenia Graph-pyyntöihin.

**Tekninen huomio:**  
Token ei ole vain random-merkkijono. Se sisältää tietoa ja se pitää validoida oikein.

**Riski:**  
Jos token varastetaan, sitä voidaan yrittää käyttää pääsyyn niin kauan kuin se on voimassa ja hyväksyttävä.

**Elikkäs:**  
Token on digitaalinen lupalappu. Se kertoo sovellukselle tai rajapinnalle jotain käyttäjästä tai oikeuksista.

---

## ID Token

**ID Token** - Token, joka kertoo sovellukselle käyttäjän identiteetistä. Käytetään OpenID Connectissa.

ID token voi sisältää esimerkiksi:

- käyttäjän tunnisteen
- nimen
- käyttäjätunnuksen
- tenantin
- kirjautumisajan
- muita claim-tietoja

**Esimerkkitilanne:**  
Aku kirjautuu Ankkalinna Oy:n sisäiseen web-sovellukseen.

Sovellus saa ID tokenin.

Token kertoo sovellukselle, että kirjautunut käyttäjä on Aku Ankka.

**Tekninen huomio:**  
ID token on tarkoitettu sovellukselle käyttäjän tunnistamiseen. Sitä ei pidä käyttää API-kutsuihin samalla tavalla kuin access tokenia.

**Riski:**  
Jos sovellus käyttää väärää tokenia väärään tarkoitukseen, turvallisuusmalli menee sekaisin.

**Elikkäs:**  
ID token kertoo kuka käyttäjä on.

---

## Access Token

**Access Token** - Token, jonka avulla sovellus voi käyttää tiettyä rajapintaa tai resurssia.

Access token liittyy siihen, mitä sovellus saa tehdä.

**Esimerkkitilanne:**  
Raportointisovellus haluaa hakea käyttäjätietoja Microsoft Graphista.

Sovellus käyttää access tokenia kutsuessaan Graph API:a.

Graph tarkistaa tokenista, onko sovelluksella lupa lukea käyttäjätietoja.

**Tekninen huomio:**  
Access token on yleensä tarkoitettu tietylle resurssille eli audiencelle. Graphille tarkoitettu token ei ole yleinen vapaalippu kaikkiin palveluihin.

**Riski:**  
Jos access token vuotaa, sitä voidaan käyttää sen voimassaolon ajan niihin resursseihin, joihin token antaa pääsyn.

**Elikkäs:**  
Access token kertoo mihin resurssiin sovellus saa pääsyn ja mitä se saa tehdä.

---

## Refresh Token

**Refresh Token** - Token, jonka avulla sovellus voi hakea uuden access tokenin ilman että käyttäjän pitää kirjautua uudelleen joka hetki.

Refresh token auttaa pitämään käyttäjän istunnon käytännöllisenä.

**Esimerkkitilanne:**  
Iines kirjautuu sovellukseen aamulla.

Access token voi vanhentua lyhyessä ajassa, mutta refresh tokenin avulla sovellus voi hakea uuden access tokenin ilman että Iines näkee jatkuvasti kirjautumisikkunaa.

**Tekninen huomio:**  
Refresh tokenit ovat herkkiä, koska niiden avulla voidaan jatkaa istuntoa. Microsoftin suojausominaisuudet voivat peruuttaa tai rajoittaa niitä riskitilanteissa.

**Riski:**  
Varastettu refresh token voi olla vakava riski, koska sen avulla voidaan yrittää jatkaa pääsyä pidempään.

**Elikkäs:**  
Refresh token auttaa uusimaan pääsylapun ilman jatkuvaa uudelleenkirjautumista.

---

## Claims

**Claims** - Tokenissa olevia väitteitä tai tietoja käyttäjästä, sovelluksesta tai kirjautumisesta.

Claim voi kertoa esimerkiksi:

- käyttäjän nimen
- object ID:n
- tenant ID:n
- käyttäjän ryhmät
- roolit
- kirjautumisajan
- issuerin
- audiencen
- MFA-tiedon

**Esimerkkitilanne:**  
Ankkalinna Oy:n sovellus saa ID tokenin, jossa on claim käyttäjän nimestä ja object ID:stä.

Sovellus käyttää object ID:tä tunnistaakseen käyttäjän pysyvämmin kuin sähköpostiosoitteen perusteella.

**Tekninen huomio:**  
Claimit ovat tärkeitä, koska sovellukset voivat tehdä päätöksiä niiden perusteella. Siksi niiden pitää olla oikein.

**Riski:**  
Jos sovellus luottaa väärään claimiin, käyttäjä voi yhdistyä väärään profiiliin tai saada väärän roolin.

**Elikkäs:**  
Claims ovat tokenin sisällä olevia tietoja. Ne kertovat sovellukselle asioita käyttäjästä ja kirjautumisesta.

---

## Scope

**Scope** - OAuth 2.0 -maailmassa scope kertoo, mitä oikeutta sovellus pyytää tai saa käyttää.

Scope voi olla esimerkiksi oikeus lukea käyttäjän perustietoja tai kalenteria.

**Esimerkkitilanne:**  
Sovellus pyytää scopea, jolla se voi lukea Akun profiilitiedot.

Jos Aku tai admin hyväksyy pyynnön, sovellus saa tokenin, jossa tämä oikeus näkyy.

Sovellus ei saa automaattisesti oikeutta lukea kaikkea mahdollista.

**Tekninen huomio:**  
Delegated permissions näkyvät usein scope-ajatteluna. Application permissions käyttävät rooleihin liittyvää mallia.

**Riski:**  
Liian laajat scopet antavat sovellukselle enemmän oikeuksia kuin se tarvitsee.

**Elikkäs:**  
Scope kertoo, mitä sovellus pyytää saada tehdä.

---

## Consent

**Consent** - Suostumus tai hyväksyntä sovelluksen pyytämille oikeuksille.

Consent voi olla käyttäjän antama tai adminin antama.

**Esimerkkitilanne:**  
Aku kirjautuu sovellukseen, joka pyytää oikeutta lukea hänen profiilinsa.

Jos organisaation asetukset sallivat, Aku voi antaa user consentin.

Jos sovellus pyytää laajempia oikeuksia, kuten kaikkien käyttäjien tietojen lukemista, tarvitaan admin consent.

**Tekninen huomio:**  
Consent on tärkeä governance-kohta sovelluksissa. Ei pidä hyväksyä oikeuksia ymmärtämättä mitä ne tekevät.

**Riski:**  
Jos käyttäjät voivat hyväksyä liian laajoja sovellusoikeuksia, haitallinen sovellus voi saada pääsyn dataan.

**Elikkäs:**  
Consent on lupa sovellukselle. Älä paina hyväksy vain siksi, että nappi on sininen ja elämä väsyttää.

---

## Redirect URI

**Redirect URI** - Osoite, johon käyttäjä ohjataan takaisin kirjautumisen jälkeen.

Redirect URI määritellään app registrationissa.

**Esimerkkitilanne:**  
Ankkalinna Oy:n web-sovellus käyttää Entra ID -kirjautumista.

Kun Aku kirjautuu onnistuneesti, Entra ID ohjaa selaimen takaisin sovelluksen redirect URI -osoitteeseen.

Sovellus jatkaa kirjautumisprosessia tästä.

**Tekninen huomio:**  
Redirect URI pitää olla tarkasti määritelty. Sitä ei saa jättää liian avoimeksi.

**Riski:**  
Väärin määritelty redirect URI voi aiheuttaa turvallisuusriskin, jossa tokenit tai kirjautumisvastaukset ohjautuvat väärään paikkaan.

**Elikkäs:**  
Redirect URI on paluuosoite kirjautumisen jälkeen. Sen pitää osoittaa oikeaan sovellukseen, ei minne sattuu.

---

## Client ID

**Client ID** - Sovelluksen julkinen tunniste Entra ID:ssä. Sitä käytetään tunnistamaan, mikä sovellus pyytää kirjautumista tai tokenia.

Client ID syntyy app registrationin yhteydessä.

**Esimerkkitilanne:**  
Ankkalinna Oy:n raportointisovelluksella on oma client ID.

Kun sovellus pyytää tokenia Entra ID:ltä, client ID kertoo, mikä sovellus on kyseessä.

**Tekninen huomio:**  
Client ID ei ole salaisuus samalla tavalla kuin client secret. Se tunnistaa sovelluksen, mutta ei yksin todista, että sovellus on luotettava.

**Riski:**  
Jos client ID sekoitetaan client secretiin, voidaan vahingossa käsitellä julkista tunnistetta salaisuutena tai toisin päin.

**Elikkäs:**  
Client ID on sovelluksen tunnistenumero. Se kertoo mikä sovellus on kyseessä, mutta se ei ole sovelluksen salasana.

---

## Session

**Session** - Käyttäjän kirjautumisistunto. Istunto määrittää, kuinka kirjautunut käyttäjä pysyy kirjautuneena ja miten palvelut muistavat kirjautumisen.

Session voi liittyä esimerkiksi:

- selaimen kirjautumistilaan
- tokenien voimassaoloon
- sovelluksen omaan istuntoon
- Conditional Access -session controlleihin
- persistent browser session -asetuksiin

**Esimerkkitilanne:**  
Aku kirjautuu aamulla Microsoft 365:een.

Hän ei joudu kirjautumaan uudelleen joka kerta, kun avaa Teamsin tai SharePointin, koska istunto on voimassa.

Jos riski muuttuu tai policy vaatii uudelleenkirjautumista, istunto voidaan katkaista tai käyttäjältä voidaan vaatia uusi MFA.

**Tekninen huomio:**  
Session ei ole sama asia kuin käyttöoikeus. Käyttäjä voi olla kirjautunut, mutta pääsy tiettyyn sovellukseen voi silti muuttua.

**Riski:**  
Liian pitkät tai huonosti hallitut istunnot voivat antaa pääsyn jatkua tilanteissa, joissa käyttäjän riski tai oikeudet ovat muuttuneet.

**Elikkäs:**  
Session on kirjautumisistunto. Se pitää käyttäjän sisällä, kunnes se vanhenee, katkaistaan tai vaatii uuden tarkistuksen.

---

## Sign-in Frequency

**Sign-in Frequency** - Asetus, jolla määritetään kuinka usein käyttäjän pitää kirjautua uudelleen tai suorittaa uusi todentaminen.

Sign-in frequency voi olla osa Conditional Access -session controlleja.

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa, että admin-käyttäjät todentavat itsensä uudelleen säännöllisesti.

Policy voi vaatia uuden kirjautumisen tai MFA:n tietyn ajan välein.

**Tekninen huomio:**  
Liian tiukka sign-in frequency voi ärsyttää käyttäjiä ja lisätä tukipyyntöjä. Liian löysä voi kasvattaa riskiä.

**Riski:**  
Jos käyttäjä pysyy kirjautuneena liian pitkään riskialttiissa tilanteessa, pääsy voi jatkua pidempään kuin pitäisi.

**Elikkäs:**  
Sign-in frequency määrittää, kuinka usein käyttäjältä kysytään “todista uudestaan, että olet sinä”.

---

## Continuous Access Evaluation

**Continuous Access Evaluation** - Mekanismi, jossa pääsyä voidaan arvioida uudelleen myös istunnon aikana, ei vain kirjautumishetkellä.

CAE auttaa reagoimaan nopeammin muutoksiin.

Tällaisia muutoksia voivat olla esimerkiksi:

- käyttäjä poistetaan käytöstä
- salasana vaihtuu
- käyttäjän riski muuttuu
- sijainti muuttuu
- token pitäisi hylätä
- pääsy pitää katkaista nopeammin

**Esimerkkitilanne:**  
Hannun tili poistetaan käytöstä, koska hänen työsuhteensa päättyy.

Ilman jatkuvaa arviointia osa istunnoista voisi pysyä käytössä tokenin voimassaolon ajan.

Continuous Access Evaluation auttaa palveluita reagoimaan nopeammin siihen, että käyttäjän pääsy pitäisi katkaista.

**Tekninen huomio:**  
CAE toimii tuetuissa palveluissa ja tilanteissa. Se ei tarkoita, että kaikki mahdollinen pääsy katkeaa maagisesti kaikkialla sekunnissa.

**Riski:**  
Jos organisaatio luottaa vain tokenien luonnolliseen vanhenemiseen, poistuneen tai riskialttiin käyttäjän pääsy voi jatkua liian pitkään.

**Elikkäs:**  
Continuous Access Evaluation tarkoittaa, että pääsyä voidaan arvioida myös kesken istunnon. Ei vain kirjautumishetkellä, vaan tilanteen muuttuessa.

---

## Yhteenveto

Authentication ja authorization ovat IAMin peruskiviä.

Ilman niitä ei voi kunnolla ymmärtää:

- kirjautumista
- MFA:ta
- Conditional Accessia
- SSO:ta
- sovelluksia
- API-oikeuksia
- tokeneita
- OAuthia
- OIDC:tä
- SAMLia
- käyttäjän ja sovelluksen oikeuksia

Tärkein ero on tämä:

> Authentication kertoo kuka olet.  
> Authorization kertoo mitä saat tehdä.

Microsoft Entra ID:n maailmassa kirjautuminen on kokonainen ketju, jossa käyttäjä, sovellus, laite, sijainti, riski, tokenit ja oikeudet vaikuttavat lopputulokseen.

**Elikkäs:**  
Kirjautuminen ei ole pelkkä salasana. Se on koko prosessi, jossa tarkistetaan identiteetti, oikeudet, sovellus, tilanne ja riski.
