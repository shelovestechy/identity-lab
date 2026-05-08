# 04 - Devices

Tämä sivu kokoaa Microsoft Entra ID:n laitteisiin, laiteidentiteettiin, laitehallintaan ja Conditional Access -ajatteluun liittyviä käsitteitä.

Tavoite on ymmärtää, että modernissa IAM-ajattelussa ei katsota vain käyttäjää.

Pääsynhallinnassa voidaan tarkistaa myös:

- kuka käyttäjä on
- millä laitteella käyttäjä kirjautuu
- onko laite organisaation hallinnassa
- onko laite compliant
- onko laite henkilökohtainen vai yrityksen omistama
- mistä sijainnista kirjautuminen tulee
- mihin sovellukseen käyttäjä yrittää päästä
- näyttääkö kirjautuminen riskialttiilta

Laite on siis osa pääsynhallintaa. Käyttäjä voi olla oikea, mutta laite voi silti olla väärä.

---

## Contents

- [Device](#device)
- [Device Identity](#device-identity)
- [Entra Joined Device](#entra-joined-device)
- [Hybrid Joined Device](#hybrid-joined-device)
- [Registered Device](#registered-device)
- [Managed Device](#managed-device)
- [Unmanaged Device](#unmanaged-device)
- [Device Compliance](#device-compliance)
- [Compliant Device](#compliant-device)
- [Non-Compliant Device](#non-compliant-device)
- [Device-Based Conditional Access](#device-based-conditional-access)
- [Primary User](#primary-user)
- [Device Ownership](#device-ownership)
- [Corporate-Owned Device](#corporate-owned-device)
- [Personally-Owned Device](#personally-owned-device)
- [Stale Device](#stale-device)
- [Device Lifecycle](#device-lifecycle)

---

## Device

**Device** - Laiteobjekti Microsoft Entra ID:ssä. Device voi olla esimerkiksi Windows-työasema, kannettava tietokone, puhelin tai tabletti, joka näkyy organisaation identiteetti- ja laitehallinnassa.

Entra ID:ssä laite ei ole vain “kone listassa”. Laite voi olla osa kirjautumisen ja pääsynhallinnan päätöstä.

Laiteobjektiin voi liittyä tietoa esimerkiksi siitä:

- mikä laitteen nimi on
- kuka laitteen omistaa tai käyttää
- onko laite Entra joined
- onko laite hybrid joined
- onko laite registered
- onko laite hallittu
- onko laite compliant
- milloin laitetta on viimeksi käytetty kirjautumiseen
- liittyykö laitteeseen käyttäjän kirjautumisia

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

**Tekninen huomio:**  
Device-objekti auttaa Entra ID:tä ja muita Microsoft-palveluita ymmärtämään, millä laitteella käyttäjä yrittää päästä palveluun.

**Riski:**  
Jos organisaatio ei huomioi laitteita pääsynhallinnassa, käyttäjä voi päästä arkaluontoiseen tietoon myös suojaamattomalta tai hallitsemattomalta laitteelta.

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

**Tekninen huomio:**  
Device identity ei automaattisesti tarkoita, että laite on turvallinen. Se tarkoittaa, että laite voidaan tunnistaa.

**Riski:**  
Jos organisaatio luottaa vain käyttäjään eikä huomioi laitetta, oikea käyttäjä voi avata tietoa väärältä tai vaarantuneelta laitteelta.

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
- Intune-hallinta voi olla mahdollinen
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

**Elikkäs:**  
Registered device on tunnistettu laite, mutta ei välttämättä täysin hallittu työlaite. Se on eri asia kuin Entra joined tai hybrid joined.

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

Managed device -ajattelussa organisaatio ei vain luota siihen, että käyttäjä toimii oikein. Laitteelle asetetaan teknisiä hallintakäytäntöjä.

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

**Tekninen huomio:**  
Managed device tarkoittaa, että organisaatiolla on teknisiä keinoja ohjata ja valvoa laitteen asetuksia. Se ei ole pelkkä nimilappu.

**Riski:**  
Jos laite on käyttäjän käytössä mutta ei hallinnassa, organisaatio ei välttämättä voi varmistaa sen suojaustasoa.

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

**Tekninen huomio:**  
Unmanaged device ei tarkoita automaattisesti pahaa laitetta. Se tarkoittaa vain, että organisaatio ei hallitse sitä samalla tavalla kuin työvälinettä.

**Riski:**  
Hallitsemattomalla laitteella voi olla puutteellinen suojaus, haittaohjelmia, vanhentunut käyttöjärjestelmä tai muita riskejä, joita organisaatio ei näe.

**Elikkäs:**  
Unmanaged device on laite, johon organisaatio ei oikeasti pysty luottamaan samalla tavalla kuin hallittuun työvälineeseen.

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

**Tekninen huomio:**  
Compliance ei ole pysyvä kunniamerkki. Laite voi olla compliant tänään ja non-compliant huomenna, jos esimerkiksi suojaus menee pois päältä tai päivitykset jäävät jälkeen.

**Elikkäs:**  
Device compliance kertoo, täyttääkö laite organisaation turvallisuusvaatimukset. Pääsyä ei tarvitse antaa vain käyttäjän perusteella, vaan myös laitteen kunto voidaan tarkistaa.

---

## Compliant Device

**Compliant Device** - Laite, joka täyttää organisaation määrittelemät vaatimukset.

Compliant-laite on läpäissyt ne tarkistukset, jotka organisaatio on määritellyt esimerkiksi Intunessa.

Compliant-tila voi perustua esimerkiksi:

- salaukseen
- käyttöjärjestelmän versioon
- suojausasetuksiin
- salasana- tai PIN-vaatimuksiin
- haittaohjelmasuojaukseen
- laitteen hallinnan tilaan

**Esimerkkitilanne:**  
Roope Ankan työläppäri on Intunen hallinnassa.

Laite täyttää Ankkalinna Oy:n vaatimukset:

- BitLocker on päällä
- Windows on ajan tasalla
- Defender toimii
- käyttäjällä ei ole paikallista admin-oikeutta ilman tarvetta
- laite raportoi tilansa Intuneen

Laite merkitään compliantiksi.

Kun Roope avaa talousraportit, Conditional Access sallii pääsyn, koska käyttäjä, MFA ja laitevaatimukset täyttyvät.

**Riski tai huomio:**  
Compliant ei tarkoita täydellistä turvallisuutta. Se tarkoittaa, että laite täyttää organisaation määrittelemät vähimmäisvaatimukset.

**Elikkäs:**  
Compliant device on laite, joka on läpäissyt organisaation turvatarkistuksen. Ei täydellinen enkeli, mutta hyväksytyssä kunnossa.

---

## Non-Compliant Device

**Non-Compliant Device** - Laite, joka ei täytä organisaation määrittelemiä turvallisuusvaatimuksia.

Laite voi olla non-compliant esimerkiksi siksi, että:

- levy ei ole salattu
- käyttöjärjestelmä on liian vanha
- laite ei ole raportoinut tilaansa
- suojausohjelma ei ole kunnossa
- PIN-koodi puuttuu
- laite on jailbroken tai rooted
- päivitykset ovat myöhässä

**Esimerkkitilanne:**  
Hannun työläppäri ei ole asentanut tärkeitä Windows-päivityksiä pitkään aikaan.

Intune merkitsee laitteen non-compliantiksi.

Kun Hannu yrittää avata Ankkalinna Oy:n arkaluontoisen SharePoint-sivuston, Conditional Access estää pääsyn ja ilmoittaa, että laitteen pitää täyttää organisaation vaatimukset.

Hannu joutuu korjaamaan laitteen tilan ennen kuin pääsy sallitaan uudelleen.

**Tekninen huomio:**  
Non-compliant-tila ei aina tarkoita, että käyttäjä teki jotain väärin. Joskus kyse voi olla päivitysongelmasta, synkronointivirheestä tai siitä, ettei laite ole ehtinyt raportoida tilaansa.

**Riski:**  
Jos non-compliant-laitteet saavat käyttää samoja resursseja kuin compliant-laitteet, compliance-kontrollista tulee lähinnä koriste.

**Elikkäs:**  
Non-compliant device ei täytä vaatimuksia. Se ei välttämättä ole “paha laite”, mutta sitä ei pitäisi kohdella samalla luottamustasolla kuin kunnossa olevaa työvälinettä.

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

**Tekninen huomio:**  
Device-based Conditional Access on hyvä tapa vähentää riskiä, mutta sääntöjen pitää olla hyvin testattuja. Huono sääntö voi estää myös oikeat käyttäjät väärällä hetkellä.

**Riski:**  
Jos sääntöjä ei suunnitella kunnolla, käyttäjät voivat jäädä lukkoon tai kriittinen työ voi estyä. Toisaalta liian löysät säännöt eivät suojaa mitään. Ihana tasapainolaji, eli IT:n oma nuorallatanssi.

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

**Tekninen huomio:**  
Primary user ei ole aina sama asia kuin ainoa käyttäjä. Jaetuissa laitteissa tai kioskityyppisissä laitteissa primary user -ajattelu voi olla erilainen.

**Riski:**  
Väärä primary user voi sotkea laitteen hallintaa, tukiprosesseja ja raportointia.

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

**Tekninen huomio:**  
Omistajuus vaikuttaa siihen, millaisia hallintatoimia organisaatio voi tehdä. Työlaitteelle voidaan yleensä tehdä enemmän kuin käyttäjän omalle henkilökohtaiselle laitteelle.

**Elikkäs:**  
Device ownership kertoo, kenen laite on. Työlaite ja oma laite eivät ole sama asia, eikä niitä pitäisi kohdella samalla luottamustasolla.

---

## Corporate-Owned Device

**Corporate-Owned Device** - Organisaation omistama laite. Tällainen laite on yleensä hankittu, hallittu ja annettu käyttäjälle työn tekemistä varten.

Corporate-owned-laite voidaan usein hallita tiukemmin kuin käyttäjän oma laite.

Sille voidaan määrittää esimerkiksi:

- pakolliset suojausasetukset
- sovellukset
- päivitykset
- salaus
- etähallinta
- etätyhjennys
- käyttörajoitukset
- compliance-vaatimukset

**Esimerkkitilanne:**  
Ankkalinna Oy antaa Tupulle uuden Windows-läppärin.

Laite on organisaation omaisuutta ja liitetään Entra ID:hen sekä Intune-hallintaan.

Tupulla ei ole oikeutta poistaa laitteen suojausasetuksia tai käyttää sitä täysin miten huvittaa, koska laite on työväline.

Jos Tupu lähtee organisaatiosta, laite palautetaan, tyhjennetään ja annetaan mahdollisesti seuraavalle käyttäjälle.

**Riski:**  
Jos corporate-owned-laitteita ei hallita kunnolla, organisaatio maksaa työvälineistä mutta ei saa niistä kunnollista turvallisuushyötyä. Se on vähän kuin ostaisi turvaoven ja jättäisi sen sepposen selälleen.

**Elikkäs:**  
Corporate-owned device on työnantajan omistama laite. Sitä voidaan ja pitää hallita työympäristön vaatimusten mukaan.

---

## Personally-Owned Device

**Personally-Owned Device** - Käyttäjän oma henkilökohtainen laite, jolla hän käyttää organisaation palveluita.

Personally-owned-laite voi olla esimerkiksi oma puhelin, tabletti tai kotikone.

Organisaation pitää miettiä tarkkaan, mitä omilla laitteilla saa tehdä.

Kysymyksiä:

- saako työsähköpostia lukea omalla puhelimella?
- saako tiedostoja ladata omalle koneelle?
- saako henkilökohtaisella laitteella avata HR- tai talousdataa?
- pitääkö käyttää hyväksyttyä sovellusta?
- voidaanko työdata poistaa ilman että käyttäjän oma data katoaa?
- vaaditaanko MFA aina?
- sallitaanko pääsy vain selaimessa?

**Esimerkkitilanne:**  
Iines haluaa lukea Teams-viestejä omalla puhelimellaan.

Ankkalinna Oy sallii tämän, mutta vain hyväksytyillä Microsoft-sovelluksilla.

Lisäksi käytössä voi olla App Protection Policy, joka estää työtiedon kopioimisen henkilökohtaisiin sovelluksiin.

**Riski:**  
Henkilökohtainen laite voi olla suojaamaton, jaettu perheen kanssa, vanhentunut tai muuten organisaation näkökulmasta tuntematon.

**Elikkäs:**  
Personally-owned device on käyttäjän oma laite. Kätevä arjessa, mutta IAMin ja tietoturvan kannalta se vaatii tarkat säännöt.

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

**Tekninen huomio:**  
Stale device -siivous pitää tehdä hallitusti. Ennen poistoa pitää ymmärtää, onko laite oikeasti poistunut käytöstä vai onko se vain ollut pitkään offline.

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

**Tekninen huomio:**  
Laitteen elinkaari pitäisi yhdistää käyttäjän elinkaareen. Kun käyttäjä aloittaa, vaihtaa roolia tai lähtee, myös hänen laitteensa pitää huomioida.

**Riski:**  
Jos laitteen elinkaarta ei hallita, ympäristöön jää vanhoja laitteita, väärin kohdistettuja käyttäjätietoja ja epäselvää pääsynhallintaa.

**Elikkäs:**  
Device lifecycle tarkoittaa, että myös laitteella on oma elinkaari. Laite pitää ottaa käyttöön, hallita ja poistaa siististi, muuten se jää kummittelemaan ympäristöön.
