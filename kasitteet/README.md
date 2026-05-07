# Käsitteet

Tähän kansioon kerään IAMiin, tietoturvaan, identiteettiin ja käyttöoikeuksiin liittyviä lyhenteitä ja käsitteitä.

Selitän asiat omin sanoin, mahdollisimman selkeästi.

---

## IAM ja identiteetti

**IAM** - Identity and Access Management. Tarkoittaa identiteetin ja käyttöoikeuksien hallintaa. Kuka käyttäjä on, mihin hän pääsee ja millä oikeuksilla.

**Identity** - Digitaalinen identiteetti. Esimerkiksi käyttäjätili, jolla ihminen tunnistetaan järjestelmässä.

**Access** - Pääsy johonkin järjestelmään, sovellukseen, tiedostoon tai resurssiin.

**Permission** - Käyttöoikeus. Mitä käyttäjä saa tehdä, esimerkiksi lukea, muokata, poistaa tai hallita.

**Role** - Rooli. Roolin avulla käyttäjälle voidaan antaa oikeuksia työn tai tehtävän perusteella.

**Group** - Ryhmä. Käyttäjiä voidaan lisätä ryhmiin ja ryhmälle annetaan oikeudet. Näin oikeuksia ei tarvitse antaa jokaiselle yksitellen.

**User Account** - Käyttäjätili. Tili, jolla henkilö kirjautuu järjestelmiin.

**Service Account** - Palvelutili. Tili, jota käyttää järjestelmä, sovellus tai automaatio, ei suoraan tavallinen käyttäjä.

**Shared Account** - Jaettu tili. Sama tili on useamman ihmisen käytössä. Usein huono idea, koska vastuuta on vaikea jäljittää.

**Identity Lifecycle** - Identiteetin elinkaari. Mitä käyttäjätilille tapahtuu alusta loppuun: luonti, muutokset ja poisto.

**JML** - Joiner, Mover, Leaver. Käyttäjän elinkaaren kolme vaihetta: uusi työntekijä, roolia vaihtava työntekijä ja lähtevä työntekijä.

**Joiner** - Uusi käyttäjä tai työntekijä. Hänelle luodaan tili ja annetaan tarvittavat oikeudet.

**Mover** - Käyttäjä, joka vaihtaa roolia, tiimiä, osastoa tai tehtävää. Vanhoja oikeuksia pitää tarkistaa, ettei niitä jää turhaan.

**Leaver** - Käyttäjä, joka lähtee organisaatiosta. Tilit ja oikeudet pitää poistaa tai sulkea hallitusti.

**Provisioning** - Käyttäjän tai oikeuksien luominen järjestelmiin. Esimerkiksi uuden käyttäjätilin tekeminen.

**Deprovisioning** - Käyttäjän tai oikeuksien poistaminen. Esimerkiksi lähtevän työntekijän tilin sulkeminen ja pääsyjen poistaminen.

**Access Request** - Käyttöoikeuspyyntö. Käyttäjä pyytää pääsyä johonkin järjestelmään tai resurssiin.

**Access Approval** - Käyttöoikeuden hyväksyntä. Esihenkilö, omistaja tai muu vastuuhenkilö hyväksyy pyynnön.

**Access Review** - Käyttöoikeuksien tarkistus. Tarkistetaan, tarvitseeko käyttäjä vielä hänellä olevia oikeuksia.

**Access Certification** - Käyttöoikeuksien virallisempi tarkastus ja vahvistus. Usein osa governance- tai auditointiprosessia.

**Access Drift** - Tilanne, jossa käyttäjälle kertyy ajan mittaan liikaa tai vanhoja oikeuksia. Esimerkiksi roolinvaihdon jälkeen vanhat pääsyt jäävät voimaan.

**Role Creep** - Sama idea kuin access drift. Käyttäjälle kertyy oikeuksia vähitellen enemmän kuin hän oikeasti tarvitsee.

**Least Privilege** - Vähimmän oikeuden periaate. Käyttäjällä pitäisi olla vain ne oikeudet, joita hän oikeasti tarvitsee työn tekemiseen.

**Need to Know** - Käyttäjälle annetaan pääsy vain tietoihin, joita hän tarvitsee tehtävässään.

**Segregation of Duties** - Työtehtävien eriyttäminen. Yhdellä ihmisellä ei pitäisi olla liikaa valtaa tehdä koko prosessia yksin, jos se aiheuttaa riskin.

**SoD** - Segregation of Duties. Lyhenne työtehtävien eriyttämisestä.

---

## Todennus ja kirjautuminen

**Authentication** - Todentaminen. Tarkistetaan, että käyttäjä on se kuka väittää olevansa.

**Authorization** - Valtuutus. Tarkistetaan, mitä käyttäjä saa tehdä todentamisen jälkeen.

**AuthN** - Authentication. Lyhenne todentamisesta.

**AuthZ** - Authorization. Lyhenne valtuutuksesta.

**MFA** - Multi-Factor Authentication. Monivaiheinen tunnistautuminen. Esimerkiksi salasana ja puhelimen vahvistus.

**2FA** - Two-Factor Authentication. Kaksivaiheinen tunnistautuminen. Käytännössä yksi MFA:n muoto.

**SSO** - Single Sign-On. Kertakirjautuminen. Käyttäjä kirjautuu kerran ja pääsee useisiin palveluihin ilman jatkuvaa uutta kirjautumista.

**Passwordless** - Kirjautuminen ilman salasanaa. Esimerkiksi biometria, laiteavain tai Microsoft Authenticator.

**Passkey** - Moderni kirjautumistapa, jossa salasanaa ei tarvitse käyttää samalla tavalla kuin ennen.

**FIDO2** - Turvallinen kirjautumisstandardi, jota käytetään esimerkiksi turva-avaimissa ja passkey-ratkaisuissa.

**Conditional Access** - Ehdollinen pääsynhallinta. Pääsy sallitaan tai estetään ehtojen mukaan, kuten käyttäjän sijainti, laite, riski tai MFA.

**Risk-Based Access** - Pääsyä arvioidaan riskin perusteella. Jos kirjautuminen näyttää epäilyttävältä, järjestelmä voi vaatia lisävahvistuksen tai estää pääsyn.

**Session** - Istunto. Aika, jolloin käyttäjä on kirjautuneena järjestelmään.

**Token** - Digitaalinen lupalappu, jolla järjestelmä tietää, että käyttäjä on kirjautunut ja mihin hänellä on oikeus.

**Refresh Token** - Token, jolla voidaan hakea uusi käyttötoken ilman että käyttäjän täytyy kirjautua uudestaan.

**Access Token** - Token, jolla päästään käyttämään palvelua tai rajapintaa.

---

## Protokollat ja integraatiot

**SAML** - Kirjautumis- ja tunnistautumisprotokolla. Käytetään usein yrityssovellusten SSO-kirjautumisessa.

**OAuth 2.0** - Valtuutusprotokolla. Sen avulla sovellus voi saada luvan käyttää tiettyä resurssia ilman että käyttäjän salasanaa jaetaan sovellukselle.

**OIDC** - OpenID Connect. Kirjautumisprotokolla, joka rakentuu OAuth 2.0:n päälle. Käytetään käyttäjän tunnistamiseen.

**SCIM** - System for Cross-domain Identity Management. Standardi käyttäjien ja ryhmien automaattiseen provisiointiin järjestelmien välillä.

**API** - Application Programming Interface. Rajapinta, jonka kautta järjestelmät keskustelevat keskenään.

**REST API** - Yleinen rajapintatyyli, jota monet modernit palvelut käyttävät.

**Graph API** - Microsoftin rajapinta, jolla voidaan hakea ja hallita Microsoft 365:n ja Entra ID:n tietoja.

**Webhook** - Tapa, jolla järjestelmä voi ilmoittaa toiselle järjestelmälle tapahtumasta automaattisesti.

**Federation** - Luottosuhde eri järjestelmien välillä. Esimerkiksi organisaation tunnuksilla kirjaudutaan ulkoiseen palveluun.

**IdP** - Identity Provider. Identiteetin tarjoaja. Palvelu, joka tunnistaa käyttäjän, esimerkiksi Microsoft Entra ID.

**SP** - Service Provider. Palveluntarjoaja. Sovellus tai palvelu, johon käyttäjä kirjautuu identiteetintarjoajan kautta.

---

## Microsoft ja Entra ID

**Microsoft Entra ID** - Microsoftin pilvipohjainen identiteetti- ja pääsynhallintapalvelu. Ennen tätä kutsuttiin nimellä Azure Active Directory eli Azure AD / AAD.

**Azure AD / AAD** - Microsoft Entra ID:n vanha nimi. Tätä nimeä käytetään edelleen paljon puhekielessä ja vanhemmassa dokumentaatiossa.

**AD** - Active Directory. Usein tällä tarkoitetaan perinteistä paikallista Windows-toimialueympäristöä eli Active Directory Domain Servicesia.

**AD DS** - Active Directory Domain Services. Perinteinen Windows Server -pohjainen hakemistopalvelu, jossa hallitaan esimerkiksi domaineja, käyttäjiä, ryhmiä, koneita, OU-rakenteita ja Group Policy -asetuksia.

**Tenant** - Microsoft-pilviympäristön oma vuokralainen. Organisaation oma Microsoft 365 / Entra ID -ympäristö.

**Directory** - Hakemisto, jossa käyttäjät, ryhmät, sovellukset ja identiteettitiedot ovat.

**Enterprise Application** - Yrityssovellus Entra ID:ssä. Sovellus, johon voidaan liittää käyttäjiä, ryhmiä ja SSO-asetuksia.

**App Registration** - Sovellusrekisteröinti. Määrittää sovelluksen identiteetin Entra ID:ssä.

**Service Principal** - Sovelluksen identiteetti tenantissa. Vähän kuin sovelluksen käyttäjätili Entra ID:ssä.

**Managed Identity** - Azure-resurssille annettu identiteetti, jolla se voi käyttää muita palveluja ilman kovakoodattuja tunnuksia.

**Dynamic Group** - Dynaaminen ryhmä. Ryhmän jäsenyys määräytyy sääntöjen perusteella, esimerkiksi osaston tai työnimikkeen mukaan.

**Security Group** - Turvaryhmä. Käytetään oikeuksien ja pääsyn hallintaan.

**Microsoft 365 Group** - Ryhmä, johon liittyy usein Teams, SharePoint, sähköposti ja muita Microsoft 365 -resursseja.

**PIM** - Privileged Identity Management. Microsoftin tapa hallita korkean tason oikeuksia määräaikaisesti ja valvotusti.

**Privileged Role** - Korkean oikeustason rooli, kuten Global Administrator.

**Global Administrator** - Erittäin korkea Microsoft 365 / Entra ID -ylläpitorooli. Tätä ei pidä jakaa kevyesti.

**Lifecycle Workflows** - Entra ID:n toiminto, jolla voidaan automatisoida käyttäjän elinkaaren vaiheita.

**Entitlement Management** - Entra ID Governance -toiminto, jolla hallitaan pääsypaketteja, hyväksyntöjä ja määräaikaisia oikeuksia.

**Access Package** - Pääsypaketti. Valmiiksi koottu oikeuspaketti, jota käyttäjä voi pyytää ja joka voidaan hyväksyä.

**Identity Protection** - Microsoftin toiminto, joka havaitsee riskikäyttäjiä ja riskikirjautumisia.

**Conditional Access Policy** - Sääntö, joka määrittää millä ehdoilla käyttäjä pääsee palveluun.

---

## AD ja perinteinen ympäristö

**AD** - Active Directory. Perinteinen Windows-ympäristön hakemistopalvelu.

**Domain** - Toimialue. Organisaation AD-ympäristön looginen alue.

**Domain Controller** - Palvelin, joka hallitsee Active Directory -toimialuetta.

**OU** - Organizational Unit. AD:n kansiorakenne, jolla käyttäjiä, koneita ja ryhmiä järjestellään.

**GPO** - Group Policy Object. Ryhmäkäytäntö, jolla hallitaan Windows-koneiden ja käyttäjien asetuksia.

**LDAP** - Protokolla, jolla haetaan ja käsitellään hakemistotietoja.

**Kerberos** - Todennusprotokolla, jota käytetään paljon Windows-ympäristöissä.

**NTLM** - Vanhempi Microsoftin todennusprotokolla. Nykyään usein halutaan välttää, jos mahdollista.

**Hybrid Identity** - Yhdistelmä paikallista AD:tä ja pilvi-identiteettiä, kuten Microsoft Entra ID:tä.

**Entra Connect** - Työkalu, jolla synkronoidaan paikallisen AD:n käyttäjiä Entra ID:hen.

**Password Hash Sync** - Salasanatiivisteiden synkronointi paikallisesta AD:stä Entra ID:hen.

**Pass-Through Authentication** - Kirjautumistapa, jossa käyttäjän salasana tarkistetaan paikallista AD:tä vasten.

---

## IGA, PAM ja governance

**IGA** - Identity Governance and Administration. IAM:n hallinnollisempi osa. Kuka saa oikeuksia, kuka hyväksyy, kuka tarkistaa ja milloin oikeudet poistetaan.

**Governance** - Hallintamalli. Säännöt, vastuut ja prosessit, joilla varmistetaan että asiat pysyvät hallinnassa.

**Access Governance** - Käyttöoikeuksien hallinnointi. Kuka omistaa oikeudet, kuka hyväksyy ja miten niitä tarkistetaan.

**PAM** - Privileged Access Management. Korkean tason oikeuksien hallinta.

**Privileged Access** - Tavallista vaarallisemmat tai laajemmat oikeudet, kuten järjestelmänvalvojan oikeudet.

**JIT Access** - Just-In-Time Access. Oikeus annetaan vain määräajaksi silloin kun sitä tarvitaan.

**Break Glass Account** - Hätätilitili, jota käytetään vain kriisitilanteissa jos normaalit kirjautumistavat eivät toimi.

**Audit Trail** - Jälki siitä, mitä on tehty, kuka teki ja milloin. Tärkeä valvonnassa ja auditoinneissa.

**Certification Campaign** - Kampanja, jossa vastuuhenkilöt käyvät läpi käyttäjien oikeuksia ja vahvistavat, ovatko ne vielä tarpeellisia.

**Policy** - Käytäntö tai sääntö. Määrittää miten asioita pitäisi tehdä.

**Control** - Kontrolli. Toimenpide tai mekanismi, jolla riskiä hallitaan.

**Risk** - Riski. Mahdollisuus, että jokin menee pieleen ja aiheuttaa haittaa.

**Compliance** - Vaatimustenmukaisuus. Toimitaan sääntöjen, lakien, standardien tai sopimusten mukaan.

---

## Tietoturva ja sääntely

**ISO/IEC 27001** - Tietoturvan hallintajärjestelmän standardi. Auttaa organisaatiota hallitsemaan tietoturvaa järjestelmällisesti.

**ISMS** - Information Security Management System. Tietoturvan hallintajärjestelmä.

**GDPR** - EU:n tietosuoja-asetus. Määrää, miten henkilötietoja pitää käsitellä ja suojata.

**Personal Data** - Henkilötieto. Tieto, josta ihminen voidaan tunnistaa.

**Data Protection** - Tietosuoja. Henkilötietojen suojaaminen ja käsittely oikein.

**Privacy** - Yksityisyys. Ihmisen oikeus siihen, ettei hänen tietojaan käsitellä miten sattuu.

**NIS2** - EU:n kyberturvallisuusdirektiivi, joka asettaa vaatimuksia tärkeille ja keskeisille toimijoille.

**Finnish Cybersecurity Act** - Suomen kyberturvallisuuslaki, joka liittyy NIS2-direktiivin toimeenpanoon.

**Incident** - Tietoturvapoikkeama tai häiriö. Jotain tapahtuu, mikä voi vaarantaa järjestelmän, tiedon tai toiminnan.

**Incident Response** - Poikkeamaan reagoiminen. Mitä tehdään, kun tietoturvaongelma tapahtuu.

**Data Breach** - Tietovuoto. Henkilötietoja tai muuta arkaluontoista tietoa päätyy väärille tahoille.

**DPIA** - Data Protection Impact Assessment. Tietosuojaa koskeva vaikutustenarviointi.

**CIA Triad** - Confidentiality, Integrity, Availability. Tietoturvan kolme perusasiaa: luottamuksellisuus, eheys ja saatavuus.

**Confidentiality** - Luottamuksellisuus. Tieto näkyy vain niille, joilla on siihen oikeus.

**Integrity** - Eheys. Tieto pysyy oikeana eikä muutu luvatta.

**Availability** - Saatavuus. Järjestelmät ja tiedot ovat käytettävissä silloin kun niitä tarvitaan.

---

## Työkalut

**SailPoint** - IGA-työkalu. Käytetään identiteetin elinkaaren, käyttöoikeuksien ja access review -prosessien hallintaan.

**Saviynt** - IGA- ja access governance -alusta.

**Omada** - IGA-ratkaisu identiteetin ja käyttöoikeuksien hallintaan.

**CyberArk** - PAM-työkalu. Käytetään erityisesti korkean tason oikeuksien ja salaisuuksien hallintaan.

**ServiceNow** - ITSM-työkalu. Käytetään tiketteihin, palvelupyyntöihin, työnkulkuun ja dokumentointiin.

**Jira** - Työnhallinnan ja tehtävienhallinnan työkalu. Käytetään paljon kehitys- ja IT-tiimeissä.

**Power BI** - Raportointi- ja visualisointityökalu.

**PowerShell** - Microsoft-ympäristöissä paljon käytetty komentokieli ja automaatiotyökalu.

**Microsoft Graph** - Rajapinta Microsoft 365:n ja Entra ID:n tietoihin.

---

## Selkokieliset muistisäännöt

**IAM** - Kuka olet ja mihin pääset.

**IGA** - Kuka päätti että pääset, onko se vielä oikein ja milloin se tarkistetaan.

**PAM** - Kuka saa käyttää vaarallisempia admin-oikeuksia ja kuinka kauan.

**MFA** - Yksi salasana ei riitä, näytä toinen todiste.

**SSO** - Kirjaudu kerran ja kulje useampaan paikkaan.

**RBAC** - Oikeudet roolin perusteella.

**ABAC** - Oikeudet käyttäjän ja tilanteen ominaisuuksien perusteella.

**SCIM** - Käyttäjätiedot liikkuvat järjestelmien välillä automaattisemmin.

**Zero Trust** - Älä luota vain siksi, että käyttäjä tai laite on “sisällä”. Tarkista aina.

---

## Helpot esimerkit

Tässä muutama todella yksinkertainen esimerkki, jotta käsitteet eivät jää pelkäksi sanalistaksi.

### IAM

**Tilanne:** Työntekijä aloittaa uudessa työssä.

IAM vastaa kysymyksiin:

- Kuka tämä henkilö on?
- Mihin järjestelmiin hän tarvitsee pääsyn?
- Millä tunnuksella hän kirjautuu?
- Mitä oikeuksia hänellä pitää olla?
- Milloin oikeudet poistetaan?

**Elikkäs:** IAM on kuin työpaikan digitaalinen avainhallinta.

---

### Identity

**Tilanne:** Karita kirjautuu työpaikan koneelle omalla käyttäjätunnuksella.

Käyttäjätunnus on hänen digitaalinen identiteettinsä.

**Elikkäs:** Identity kertoo järjestelmälle: “Tämä käyttäjä on Karita.”

---

### Access

**Tilanne:** Karita pääsee Teamsiin, sähköpostiin ja ServiceNow’hun.

Nämä pääsyt ovat accessia.

**Elikkäs:** Access tarkoittaa: “Mihin oviin tällä käyttäjällä on avain?”

---

### Permission

**Tilanne:** Karita voi lukea tiedoston, mutta ei poistaa sitä.

Se on käyttöoikeus.

**Elikkäs:** Permission kertoo, mitä käyttäjä saa tehdä oven takana.

---

### Group

**Tilanne:** Kaikille Service Desk -tiimin jäsenille annetaan pääsy samaan järjestelmään ryhmän kautta.

Sen sijaan että jokaiselle käyttäjälle annettaisiin oikeudet erikseen, käyttäjät lisätään ryhmään.

**Elikkäs:** Ryhmä on kuin avainnippu. Kun kuulut ryhmään, saat siihen ryhmään kuuluvat oikeudet.

---

### Role

**Tilanne:** “Service Desk Specialist” -roolilla on tietyt perusoikeudet.

Jos henkilö vaihtaa Service Deskistä HR-tiimiin, hänen roolinsa muuttuu ja oikeudet pitäisi tarkistaa.

**Elikkäs:** Rooli kertoo, millaisia oikeuksia työtehtävä yleensä tarvitsee.

---

### Joiner

**Tilanne:** Uusi työntekijä aloittaa maanantaina.

Hänelle luodaan tili, sähköposti ja pääsyt tarvittaviin järjestelmiin.

**Elikkäs:** Joiner = uusi tyyppi tulee taloon.

---

### Mover

**Tilanne:** Työntekijä vaihtaa myyntitiimistä taloushallintoon.

Hän tarvitsee uusia oikeuksia, mutta vanhat myyntitiimin oikeudet pitäisi poistaa.

**Elikkäs:** Mover = tyyppi vaihtaa paikkaa talon sisällä.

---

### Leaver

**Tilanne:** Työntekijä lähtee organisaatiosta.

Hänen tilinsä suljetaan ja käyttöoikeudet poistetaan.

**Elikkäs:** Leaver = tyyppi lähtee talosta, joten avaimet pitää ottaa pois.

---

### Provisioning

**Tilanne:** Uudelle työntekijälle luodaan käyttäjätili ja annetaan pääsy Teamsiin.

Tämä on provisioningia.

**Elikkäs:** Provisioning = tehdään käyttäjälle pääsyt valmiiksi.

---

### Deprovisioning

**Tilanne:** Työntekijä lähtee ja hänen tunnuksensa suljetaan.

Tämä on deprovisioningia.

**Elikkäs:** Deprovisioning = otetaan pääsyt pois.

---

### Access Request

**Tilanne:** Käyttäjä pyytää pääsyä raportointijärjestelmään.

Hän tekee käyttöoikeuspyynnön.

**Elikkäs:** Access request = “Saanko avaimen tähän oveen?”

---

### Access Approval

**Tilanne:** Esihenkilö hyväksyy käyttäjän pyynnön päästä raportointijärjestelmään.

**Elikkäs:** Access approval = joku vastuuhenkilö sanoo: “Kyllä, tämä pääsy on perusteltu.”

---

### Access Review

**Tilanne:** Puolen vuoden välein tarkistetaan, tarvitseeko käyttäjä edelleen pääsyn tiettyyn järjestelmään.

**Elikkäs:** Access review = katsotaan, onko avain vielä tarpeellinen.

---

### Role Creep

**Tilanne:** Työntekijä on vaihtanut tiimiä kolme kertaa, mutta vanhat oikeudet ovat jääneet voimaan joka kerta.

Nyt hänellä on pääsy paikkoihin, joihin hänen ei enää pitäisi päästä.

**Elikkäs:** Role creep = käyttäjälle kertyy oikeuksia kuin pölyä nurkkiin.

---

### Least Privilege

**Tilanne:** Käyttäjä tarvitsee vain lukuoikeuden, joten hänelle ei anneta muokkaus- tai admin-oikeutta.

**Elikkäs:** Least privilege = annetaan vain sen verran oikeuksia kuin oikeasti tarvitaan. Ei yhtään ylimääräistä.

---

### Authentication

**Tilanne:** Käyttäjä kirjautuu sisään salasanalla ja Authenticator-sovelluksella.

Järjestelmä tarkistaa, että käyttäjä on oikeasti se kuka väittää olevansa.

**Elikkäs:** Authentication = “Todista kuka olet.”

---

### Authorization

**Tilanne:** Käyttäjä on kirjautunut sisään, mutta järjestelmä tarkistaa vielä, saako hän avata tietyn raportin.

**Elikkäs:** Authorization = “Mitä saat tehdä nyt kun olet sisällä?”

---

### MFA

**Tilanne:** Salasanan jälkeen käyttäjän pitää hyväksyä kirjautuminen puhelimella.

**Elikkäs:** MFA = salasana plus toinen todiste.

---

### SSO

**Tilanne:** Käyttäjä kirjautuu Microsoft-tunnuksella ja pääsee samalla kirjautumisella Teamsiin, Outlookiin ja SharePointiin.

**Elikkäs:** SSO = yksi kirjautuminen, monta ovea.

---

### Conditional Access

**Tilanne:** Käyttäjä yrittää kirjautua oudosta maasta tai tuntemattomalta laitteelta.

Järjestelmä vaatii MFA:n tai estää kirjautumisen.

**Elikkäs:** Conditional Access = “Pääset sisään vain jos ehdot täyttyvät.”

---

### PIM

**Tilanne:** Admin ei pidä korkeita oikeuksia koko ajan päällä.

Kun oikeuksia tarvitaan, hän aktivoi ne määräajaksi ja vahvistaa kirjautumisen MFA:lla.

**Elikkäs:** PIM = admin-oikeudet päälle vain silloin kun niitä oikeasti tarvitaan.

---

### PAM

**Tilanne:** Organisaatio hallitsee tarkasti, kuka saa käyttää admin-tunnuksia, milloin ja miksi.

**Elikkäs:** PAM = vaarallisempien oikeuksien lukollinen kaappi.

---

### IGA

**Tilanne:** Organisaatio tarkistaa säännöllisesti, kenellä on pääsy mihinkin, kuka hyväksyi pääsyn ja onko pääsy vielä tarpeellinen.

**Elikkäs:** IGA = käyttöoikeuksien siivous, valvonta ja järjenpito.

---

### RBAC

**Tilanne:** Kaikki HR-tiimin työntekijät saavat HR-roolin kautta samat perusoikeudet.

**Elikkäs:** RBAC = oikeudet tulevat roolin perusteella.

---

### ABAC

**Tilanne:** Käyttäjä saa pääsyn, koska hänen osastonsa on Finance, sijainti on Finland ja työsuhde on aktiivinen.

**Elikkäs:** ABAC = oikeudet tulevat käyttäjän ominaisuuksien perusteella.

---

### SCIM

**Tilanne:** Kun käyttäjä lisätään Entra ID:hen, hänen tietonsa siirtyvät automaattisesti toiseen sovellukseen.

Kun käyttäjä poistuu, myös sovelluksen pääsy voidaan poistaa automaattisesti.

**Elikkäs:** SCIM = käyttäjätiedot kulkevat järjestelmästä toiseen automaattisemmin.

---

### SAML

**Tilanne:** Käyttäjä kirjautuu yrityksen tunnuksilla ulkoiseen sovellukseen.

Sovellus luottaa siihen, että organisaation kirjautumisjärjestelmä on jo tunnistanut käyttäjän.

**Elikkäs:** SAML = “Me tunnistimme tämän käyttäjän, päästä hänet sisään.”

---

### OAuth 2.0

**Tilanne:** Sovellus pyytää lupaa lukea käyttäjän kalenteria, mutta käyttäjän salasanaa ei anneta sovellukselle.

**Elikkäs:** OAuth 2.0 = annetaan lupa tiettyyn asiaan ilman että jaetaan salasanaa.

---

### OIDC

**Tilanne:** Sovellus haluaa tietää kuka käyttäjä on.

OIDC auttaa sovellusta tunnistamaan käyttäjän modernilla tavalla.

**Elikkäs:** OIDC = kirjautumisen henkilöllisyystarkistus OAuthin päällä.

---

### Audit Trail

**Tilanne:** Järjestelmästä nähdään, kuka antoi käyttäjälle oikeudet, milloin ja miksi.

**Elikkäs:** Audit trail = jalanjäljet järjestelmässä.

---

### ISO/IEC 27001

**Tilanne:** Organisaatio haluaa hallita tietoturvaa järjestelmällisesti eikä vain reagoida paniikissa kun jotain hajoaa.

**Elikkäs:** ISO/IEC 27001 = tietoturvan järjestyksenpitomalli.

---

### GDPR

**Tilanne:** Asiakkaan henkilötietoja ei saa käsitellä miten sattuu.

Pitää tietää miksi tietoa kerätään, missä sitä säilytetään, kuka siihen pääsee ja milloin se poistetaan.

**Elikkäs:** GDPR = henkilötietoja ei kohdella kuin ilmaista karkkia.

---

### NIS2

**Tilanne:** Tärkeiden organisaatioiden pitää huolehtia kyberturvallisuudesta kunnolla, varautua häiriöihin ja ilmoittaa vakavista poikkeamista.

**Elikkäs:** NIS2 = EU sanoo, että kyberturvaa ei saa hoitaa villasukkatasolla.

---

### Zero Trust

**Tilanne:** Käyttäjä on yrityksen verkossa, mutta häntä ei silti automaattisesti luoteta.

Järjestelmä tarkistaa käyttäjän, laitteen, sijainnin, riskin ja oikeudet.

**Elikkäs:** Zero Trust = älä luota sokeasti, tarkista aina.
