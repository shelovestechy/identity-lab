# 09 - Hybrid Identity

Tämä sivu kokoaa hybrid identity -ajatteluun liittyviä käsitteitä Microsoft-ympäristössä.

Hybrid identity tarkoittaa tilannetta, jossa organisaatiolla on sekä paikallinen Active Directory että Microsoft Entra ID käytössä.

Tällöin käyttäjän identiteetti ei elä vain yhdessä paikassa.

Sama käyttäjä voi näkyä esimerkiksi:

- paikallisessa Active Directoryssa
- Microsoft Entra ID:ssä
- Microsoft 365 -palveluissa
- Exchange Onlinessa
- Teamsissa
- SharePointissa
- erilaisissa sovelluksissa
- HR-järjestelmässä
- IAM- tai IGA-järjestelmässä

Tämä on juuri se kohta, jossa identiteetinhallinta alkaa olla oikeasti kiinnostavaa. Ja välillä myös vähän “miksi tämä on näin” -osastoa.

---

## Contents

- [Hybrid Identity](#hybrid-identity)
- [On-premises Active Directory](#on-premises-active-directory)
- [Microsoft Entra ID](#microsoft-entra-id)
- [Microsoft Entra Connect](#microsoft-entra-connect)
- [Cloud Sync](#cloud-sync)
- [Synchronization](#synchronization)
- [Source of Authority](#source-of-authority)
- [Synced User](#synced-user)
- [Cloud-only User](#cloud-only-user)
- [Immutable ID](#immutable-id)
- [Anchor Attribute](#anchor-attribute)
- [UPN](#upn)
- [Primary SMTP Address](#primary-smtp-address)
- [ProxyAddresses](#proxyaddresses)
- [Attribute Mapping](#attribute-mapping)
- [Password Hash Synchronization](#password-hash-synchronization)
- [Pass-through Authentication](#pass-through-authentication)
- [Federation](#federation)
- [Hybrid Join](#hybrid-join)
- [Entra Joined Device](#entra-joined-device)
- [Hybrid Joined Device](#hybrid-joined-device)
- [Registered Device](#registered-device)
- [Writeback](#writeback)
- [Group Writeback](#group-writeback)
- [Password Writeback](#password-writeback)
- [Exchange Hybrid](#exchange-hybrid)
- [Soft Match](#soft-match)
- [Hard Match](#hard-match)
- [Duplicate Identity](#duplicate-identity)
- [Sync Error](#sync-error)
- [Staging Mode](#staging-mode)

---

## Hybrid Identity

**Hybrid Identity** - Identiteettimalli, jossa organisaation käyttäjät ja identiteetit ovat yhteydessä sekä paikalliseen Active Directoryyn että Microsoft Entra ID:hen.

Hybrid identity on yleinen organisaatioissa, joissa Microsoft 365 on käytössä, mutta käyttäjähallinta perustuu yhä paikalliseen AD:hen.

Tällöin käyttäjä voidaan luoda paikallisessa AD:ssä ja synkronoida pilveen Entra ID:hen.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on vanha paikallinen Active Directory, jossa hallitaan käyttäjiä, ryhmiä ja työasemia.

Samalla Ankkalinna käyttää Microsoft 365 -palveluita kuten Outlookia, Teamsia ja SharePointia.

Aku Ankan käyttäjätili luodaan paikalliseen AD:hen.

Microsoft Entra Connect synkronoi Akun käyttäjätiedot Microsoft Entra ID:hen.

Tämän jälkeen Aku voi kirjautua Microsoft 365 -palveluihin samalla organisaation tunnuksella.

**Tekninen huomio:**  
Hybrid identityssä pitää aina ymmärtää, mistä tieto tulee ja mihin se synkronoituu. Kaikkea ei voi muuttaa pilvestä, jos paikallinen AD on tiedon lähde.

**Riski:**  
Jos paikallisen AD:n ja Entra ID:n suhdetta ei ymmärretä, voidaan muuttaa väärää järjestelmää ja ihmetellä miksi muutos katoaa tai rikkoo jotain.

**Elikkäs:**  
Hybrid identity tarkoittaa, että käyttäjän identiteetti elää sekä vanhassa AD-maailmassa että Microsoftin pilvessä.

---

## On-premises Active Directory

**On-premises Active Directory** - Paikallinen Active Directory. Organisaation omassa ympäristössä toimiva hakemistopalvelu käyttäjien, ryhmien, laitteiden ja kirjautumisen hallintaan.

Tästä käytetään usein lyhyesti nimeä AD.

On-prem AD on ollut pitkään Windows-ympäristöjen identiteetinhallinnan perusta.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä Service Desk avaa Active Directory Users and Computers -työkalun ja tarkistaa Aku Ankan käyttäjätilin.

Sieltä voidaan nähdä esimerkiksi:

- käyttäjän nimi
- käyttäjätunnus
- ryhmäjäsenyydet
- osasto
- toimipiste
- tili aktiivinen tai disabled
- salasana-asetuksia
- manager-tieto
- muut AD-attribuutit

**Tekninen huomio:**  
Jos käyttäjä synkronoidaan paikallisesta AD:stä Entraan, monet käyttäjän perustiedot pitää muuttaa paikallisessa AD:ssä, ei suoraan Entra ID:ssä.

**Riski:**  
Jos paikallinen AD on sotkuinen, sama sotku voi synkronoitua pilveen. Pilvi ei automaattisesti tee huonosta datasta hyvää dataa. Ikävä kyllä, Microsoft ei tarjoa “korjaa kaikki meidän historia” -nappia.

**Elikkäs:**  
On-prem AD on paikallinen käyttäjähakemisto. Hybridissä se on usein käyttäjätiedon alkuperäinen lähde.

---

## Microsoft Entra ID

**Microsoft Entra ID** - Microsoftin pilvipohjainen identiteetti- ja pääsynhallintapalvelu.

Hybrid-ympäristössä Entra ID vastaanottaa usein käyttäjä- ja ryhmätietoja paikallisesta AD:stä.

Entra ID:tä käytetään esimerkiksi:

- Microsoft 365 -kirjautumiseen
- Teamsiin
- SharePointiin
- Exchange Onlineen
- Enterprise Applicationeihin
- Conditional Accessiin
- MFA:han
- pilvisovellusten SSO:hon
- identity governanceen

**Esimerkkitilanne:**  
Aku Ankan käyttäjätiedot ovat paikallisessa AD:ssä, mutta Aku kirjautuu Teamsiin ja Outlookiin Microsoft Entra ID:n kautta.

Entra ID tarkistaa kirjautumisen, Conditional Access -säännöt ja MFA-vaatimukset.

**Tekninen huomio:**  
Entra ID ei ole sama asia kuin paikallinen Active Directory, vaikka nimet menevät arjessa helposti sekaisin. Azure AD oli Entra ID:n vanha nimi, mutta se ei ollut sama asia kuin perinteinen AD.

**Riski:**  
Jos AD, Azure AD ja Entra sekoitetaan puheessa, voidaan päätyä korjaamaan väärää paikkaa.

**Elikkäs:**  
Entra ID on Microsoftin pilvi-identiteetti. Hybridissä se toimii yhdessä paikallisen AD:n kanssa.

---

## Microsoft Entra Connect

**Microsoft Entra Connect** - Työkalu, jolla synkronoidaan käyttäjiä, ryhmiä ja muita objekteja paikallisesta Active Directorysta Microsoft Entra ID:hen.

Entra Connect tunnettiin aiemmin nimellä Azure AD Connect.

Sen avulla paikallisen AD:n käyttäjät saadaan näkyviin Microsoftin pilvipalveluihin.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on paikallinen AD ja Microsoft 365.

Kun uusi käyttäjä Tupu Ankka luodaan paikalliseen AD:hen oikeaan OU:hun, Entra Connect synkronoi Tupun Entra ID:hen.

Tämän jälkeen Tupulle voidaan antaa Microsoft 365 -lisenssi ja hän voi kirjautua pilvipalveluihin.

**Tekninen huomio:**  
Entra Connectin asetukset määrittävät, mitä objekteja ja attribuutteja synkronoidaan. Kaikki AD:ssä oleva ei välttämättä mene pilveen.

**Riski:**  
Väärät sync-asetukset voivat tuoda pilveen liikaa, liian vähän tai vääriä käyttäjiä.

**Elikkäs:**  
Entra Connect on silta paikallisen AD:n ja Microsoft Entra ID:n välillä.

---

## Cloud Sync

**Cloud Sync** - Microsoftin pilvipohjaisempi synkronointiratkaisu, jolla voidaan synkronoida käyttäjiä ja ryhmiä paikallisesta AD:stä Microsoft Entra ID:hen.

Cloud Sync voi olla vaihtoehto tai täydentävä ratkaisu Entra Connectille tietyissä ympäristöissä.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on useampi AD-metsä eri toimipaikoissa.

Cloud Sync voisi olla yksi vaihtoehto käyttäjien synkronointiin pilveen kevyemmällä agenttipohjaisella mallilla.

**Tekninen huomio:**  
Cloud Sync ja Entra Connect eivät ole täysin sama asia. Niiden ominaisuudet, rajoitukset ja käyttötapaukset pitää tarkistaa ennen päätöksiä.

**Riski:**  
Jos valitaan synkronointimalli ymmärtämättä ympäristön tarpeita, myöhemmin voi tulla vastaan ominaisuusrajoja.

**Elikkäs:**  
Cloud Sync on kevyempi pilvipainotteinen synkronointimalli, mutta se ei automaattisesti korvaa kaikkia Entra Connectin käyttötapauksia.

---

## Synchronization

**Synchronization** - Tietojen synkronointi järjestelmästä toiseen. Hybrid identityssä tämä tarkoittaa usein käyttäjä-, ryhmä- ja attribuuttitietojen siirtymistä paikallisesta AD:stä Entra ID:hen.

Synkronointi voi koskea esimerkiksi:

- käyttäjiä
- ryhmiä
- yhteystietoja
- attribuutteja
- salasanaan liittyviä tietoja
- laitteita
- Exchange-attribuutteja

**Esimerkkitilanne:**  
Iines Ankan sukunimi muuttuu paikallisessa AD:ssä.

Kun synkronointi tapahtuu, muutos näkyy myöhemmin myös Entra ID:ssä ja Microsoft 365 -palveluissa.

Jos muutos tehtäisiin vain Entraan, paikallinen AD voisi yliajaa sen seuraavassa synkronoinnissa.

**Tekninen huomio:**  
Synkronointi ei ole sama asia kuin reaaliaikainen maaginen teleportti. Viiveitä voi olla, ja eri palvelut voivat päivittyä eri tahtiin.

**Riski:**  
Jos käyttäjälle luvataan, että “nyt se näkyy heti kaikkialla”, Service Desk saa pian kuulla klassikon: “ei näy vieläkään”.

**Elikkäs:**  
Synchronization tarkoittaa, että käyttäjätiedot siirtyvät järjestelmästä toiseen. Muutos pitää tehdä oikeassa lähteessä.

---

## Source of Authority

**Source of Authority** - Järjestelmä, joka on tietyn käyttäjätiedon virallinen lähde.

Hybrid identityssä tämä on kriittinen käsite.

Source of authority voi olla esimerkiksi:

- HR-järjestelmä
- paikallinen Active Directory
- Microsoft Entra ID
- IAM- tai IGA-järjestelmä
- Exchange-hallinta

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä käyttäjän nimi ja osasto tulevat HR-järjestelmästä.

HR-järjestelmä päivittää tiedot paikalliseen AD:hen.

AD synkronoituu Entra ID:hen.

Jos Service Desk muuttaa osaston käsin Entra ID:ssä, muutos ei välttämättä pysy, koska HR ja AD ovat tiedon lähde.

**Tekninen huomio:**  
Eri attribuuteilla voi olla eri source of authority. Esimerkiksi henkilön nimi voi tulla HR:stä, mutta sähköpostialias voi olla Exchange-hallinnan kautta määritelty.

**Riski:**  
Jos ei tiedetä, kuka omistaa tiedon, samaa asiaa korjataan väärästä paikasta yhä uudelleen.

**Elikkäs:**  
Source of authority kertoo, mistä tieto oikeasti tulee. Ensin selvitä lähde, sitten tee muutos.

---

## Synced User

**Synced User** - Käyttäjä, joka on synkronoitu paikallisesta Active Directorysta Microsoft Entra ID:hen.

Synced user näkyy pilvessä, mutta monet sen perustiedot ovat lähtöisin paikallisesta AD:stä.

**Esimerkkitilanne:**  
Aku Ankka näkyy Microsoft Entra admin centerissä käyttäjänä.

Hänen tilinsä on kuitenkin synced from on-premises AD.

Jos Akun displayName, UPN tai tietyt attribuutit pitää muuttaa, muutos tehdään paikallisessa AD:ssä.

**Tekninen huomio:**  
Synced userin pilvessä näkyviä kenttiä ei aina voi muokata suoraan Entra ID:ssä, koska paikallinen AD on tiedon lähde.

**Riski:**  
Jos synced useria yritetään korjata pilvestä, muutokset voivat epäonnistua tai palautua takaisin.

**Elikkäs:**  
Synced user on pilvessä näkyvä käyttäjä, jonka juuret ovat paikallisessa AD:ssä.

---

## Cloud-only User

**Cloud-only User** - Käyttäjä, joka on luotu suoraan Microsoft Entra ID:hen eikä synkronoidu paikallisesta AD:stä.

Cloud-only käyttäjää hallitaan yleensä pilven hallintatyökaluilla.

**Esimerkkitilanne:**  
Ankkalinna Oy luo ulkoiselle testikäyttäjälle cloud-only tilin suoraan Microsoft 365 admin centerissä.

Käyttäjää ei ole paikallisessa AD:ssä.

Muutokset tehdään Entra ID:ssä tai Microsoft 365 -hallinnassa.

**Tekninen huomio:**  
Cloud-only userin kohdalla Entra ID on usein käyttäjän source of authority, ellei jokin muu järjestelmä hallitse sitä.

**Riski:**  
Jos organisaatiossa on sekä synced- että cloud-only käyttäjiä, prosessit pitää erottaa. Kaikkia käyttäjiä ei voi käsitellä samalla tavalla.

**Elikkäs:**  
Cloud-only user elää vain pilvessä. Synced user tulee paikallisesta AD:stä.

---

## Immutable ID

**Immutable ID** - Tunniste, jota käytetään yhdistämään paikallisen AD:n käyttäjä ja Microsoft Entra ID:n käyttäjä samaan identiteettiin.

Immutable ID liittyy erityisesti hybrid-ympäristöihin.

Se auttaa Entraa ymmärtämään, että paikallisen AD:n käyttäjä ja pilven käyttäjä ovat sama henkilö.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on paikallinen käyttäjä Aku Ankka.

Kun käyttäjä synkronoidaan pilveen, Immutable ID auttaa yhdistämään paikallisen AD-objektin oikeaan Entra ID -objektiin.

Jos tämä yhdistys menee väärin, käyttäjälle voi syntyä duplikaatti tai väärä linkitys.

**Tekninen huomio:**  
Immutable ID:tä ei pidä mennä muuttamaan kevyesti. Se liittyy identiteetin linkitykseen AD:n ja Entran välillä.

**Riski:**  
Väärä Immutable ID voi aiheuttaa identiteettien yhdistymisongelmia, duplikaatteja tai vaikeita sync-virheitä.

**Elikkäs:**  
Immutable ID on tekninen liitoskohta, joka auttaa sanomaan: tämä AD-käyttäjä ja tämä pilvikäyttäjä ovat sama ihminen.

---

## Anchor Attribute

**Anchor Attribute** - Attribuutti, jota käytetään käyttäjän pysyvänä ankkurina paikallisen AD:n ja Entra ID:n välillä.

Anchor-attribuutin tarkoitus on tunnistaa sama objekti luotettavasti synkronoinnissa.

**Esimerkkitilanne:**  
Ankkalinna Oy:n käyttäjä Aku Ankka vaihtaa nimeä tai sähköpostiosoitetta.

Vaikka näkyvät tiedot muuttuvat, anchor-attribuutin pitäisi pysyä vakaana, jotta synkronointi ymmärtää kyseessä olevan sama käyttäjä.

**Tekninen huomio:**  
Modernissa Entra Connect -ympäristössä sourceAnchor / immutableId -ajattelu on tärkeä identiteetin pysyvyyden kannalta.

**Riski:**  
Jos ankkuri muuttuu väärin, käyttäjä voidaan tulkita uudeksi identiteetiksi.

**Elikkäs:**  
Anchor attribute on identiteetin ankkuri. Nimi voi muuttua, sähköposti voi muuttua, mutta ankkurin pitäisi pitää käyttäjä samana käyttäjänä.

---

## UPN

**UPN** - User Principal Name. Käyttäjän kirjautumistunnus Microsoft-ympäristössä.

UPN näyttää usein sähköpostiosoitteelta, mutta se ei ole teknisesti sama asia kuin sähköpostiosoite.

**Esimerkkitilanne:**  
Iines kirjautuu Microsoft 365:een tunnuksella:

iines.ankka@ankkalinna.fi

Tämä on hänen UPN:nsä.

Nimenmuutoksen jälkeen sähköpostiosoite voi muuttua, mutta UPN:n muuttaminen pitää harkita erikseen.

**Tekninen huomio:**  
UPN:n muuttaminen voi vaikuttaa kirjautumiseen, sovelluksiin, integraatioihin, profiileihin ja käyttäjäkokemukseen. Siksi sitä ei pidä muuttaa sokkona.

**Riski:**  
Jos UPN muutetaan ilman vaikutusarviointia, käyttäjä ei ehkä pääse kirjautumaan tai integraatiot voivat mennä rikki.

**Elikkäs:**  
UPN on kirjautumisnimi. Se voi näyttää sähköpostilta, mutta sitä ei pidä käsitellä vain “sähköpostikenttänä”.

---

## Primary SMTP Address

**Primary SMTP Address** - Käyttäjän ensisijainen sähköpostiosoite.

Tämä on osoite, josta käyttäjän sähköposti yleensä lähtee ja johon käyttäjän virallinen sähköposti liittyy.

**Esimerkkitilanne:**  
Iines Ankan ensisijainen sähköpostiosoite on:

iines.ankka@ankkalinna.fi

Kun nimi vaihtuu Iines Hanheksi, uusi ensisijainen osoite voi olla:

iines.hanhi@ankkalinna.fi

Vanha osoite kannattaa usein säilyttää aliaksena.

**Tekninen huomio:**  
Primary SMTP ei ole sama asia kuin UPN, vaikka ne usein ovat samat organisaation selkeyden vuoksi.

**Riski:**  
Jos vanha osoite poistetaan kokonaan, vanhalle nimelle lähetetyt viestit voivat palautua tai kadota.

**Elikkäs:**  
Primary SMTP on käyttäjän pääsähköpostiosoite. Se on postia varten, UPN on kirjautumista varten.

---

## ProxyAddresses

**ProxyAddresses** - Attribuutti, jossa säilytetään käyttäjän sähköpostiosoitteita ja aliaksia.

ProxyAddresses voi sisältää sekä ensisijaisen osoitteen että lisäosoitteita.

Yleinen ajatus:

- `SMTP:` isolla tarkoittaa ensisijaista osoitetta
- `smtp:` pienellä tarkoittaa aliasta

**Esimerkkitilanne:**  
Iines Ankan nimi vaihtuu Iines Hanheksi.

ProxyAddresses voisi sisältää:

- `SMTP:iines.hanhi@ankkalinna.fi`
- `smtp:iines.ankka@ankkalinna.fi`

Tällöin uusi osoite on ensisijainen, mutta vanha osoite toimii edelleen aliaksena.

**Tekninen huomio:**  
ProxyAddresses liittyy Exchange- ja Microsoft 365 -sähköpostin toimintaan. Sitä ei kannata muuttaa sokkona ilman ymmärrystä ympäristön mallista.

**Riski:**  
Väärä proxyAddresses-muutos voi rikkoa sähköpostin kulkua tai aiheuttaa osoiteristiriitoja.

**Elikkäs:**  
ProxyAddresses on sähköpostiosoitteiden lista. Siellä kannattaa pitää vanha osoite aliaksena, jos käyttäjän nimi tai osoite muuttuu.

---

## Attribute Mapping

**Attribute Mapping** - Määritys siitä, miten yhden järjestelmän kenttä vastaa toisen järjestelmän kenttää.

Hybrid identityssä attribute mapping kertoo, miten paikallisen AD:n attribuutit siirtyvät Entra ID:hen.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä AD:n `department`-kenttä synkronoituu Entra ID:n department-tiedoksi.

Tätä tietoa voidaan käyttää esimerkiksi dynamic group -säännöissä.

Jos HR-järjestelmässä osasto on väärin, käyttäjä voi päätyä väärään dynaamiseen ryhmään ja saada väärät oikeudet.

**Tekninen huomio:**  
Attribute mapping on todella tärkeä automaatiossa, koska monet käyttöoikeudet voivat perustua attribuutteihin.

**Riski:**  
Väärä attribuuttikartoitus voi antaa käyttäjille vääriä oikeuksia tai jättää oikeat oikeudet antamatta.

**Elikkäs:**  
Attribute mapping kertoo, mikä kenttä menee minne. Jos kenttä on väärä, automaatio tekee väärän asian tosi tehokkaasti.

---

## Password Hash Synchronization

**Password Hash Synchronization** - Kirjautumismalli, jossa paikallisen AD:n salasanatiiviste synkronoidaan Microsoft Entra ID:hen.

Tämän avulla käyttäjä voi kirjautua pilvipalveluihin samalla salasanalla kuin paikalliseen ympäristöön.

**Esimerkkitilanne:**  
Aku vaihtaa salasanansa työasemalla.

Salasanan muutos synkronoituu niin, että Aku voi käyttää samaa salasanaa Microsoft 365 -palveluissa.

**Tekninen huomio:**  
Kyse ei ole siitä, että selkokielinen salasana lähetetään pilveen. Salasanan käsittely perustuu tiivisteisiin ja suojausmekanismeihin.

**Riski:**  
Jos käyttäjän salasana on heikko ja MFA ei ole käytössä, sama salasana voi avata sekä paikallisia että pilvipalveluita.

**Elikkäs:**  
Password Hash Sync mahdollistaa saman salasanan AD:n ja pilven välillä ilman että käyttäjän pitää muistaa kahta eri salasanaa.

---

## Pass-through Authentication

**Pass-through Authentication** - Kirjautumismalli, jossa pilvikirjautuminen tarkistetaan paikallista AD:tä vasten ilman, että salasanatiivistettä synkronoidaan Entra ID:hen samalla tavalla kuin Password Hash Syncissä.

Kun käyttäjä kirjautuu pilvipalveluun, tunnistus kulkee paikallisen agentin kautta AD:hen.

**Esimerkkitilanne:**  
Ankkalinna Oy haluaa, että Microsoft 365 -kirjautuminen tarkistetaan paikallisesta AD:stä.

Aku kirjautuu Teamsiin.

Kirjautumispyyntö menee Entra ID:n kautta paikalliseen AD:hen pass-through authentication -agentin avulla.

**Tekninen huomio:**  
Pass-through Authentication vaatii toimivat paikalliset agentit ja yhteydet.

**Riski:**  
Jos paikallinen infra tai agentit eivät toimi, pilvikirjautuminen voi häiriintyä.

**Elikkäs:**  
Pass-through Authentication tarkistaa pilvikirjautumisen paikallista AD:tä vasten.

---

## Federation

**Federation** - Luottosuhde identiteettijärjestelmien välillä. Hybrid-ympäristössä federation voi tarkoittaa sitä, että Microsoft 365 -kirjautuminen ohjataan organisaation omaan tunnistuspalveluun.

Tämä voi liittyä esimerkiksi AD FS -ympäristöihin.

**Esimerkkitilanne:**  
Ankkalinna Oy käyttää AD FS:ää.

Kun Aku kirjautuu Microsoft 365:een, kirjautuminen ohjautuu Ankkalinnan omaan federation-palveluun.

Se todentaa käyttäjän ja Microsoft 365 luottaa tähän vastaukseen.

**Tekninen huomio:**  
Federation voi antaa paljon kontrollia, mutta tuo myös lisää ylläpidettävää infrastruktuuria.

**Riski:**  
Jos federation-palvelu menee rikki, käyttäjät eivät välttämättä pääse pilvipalveluihin.

**Elikkäs:**  
Federation tarkoittaa, että Microsoft luottaa organisaation omaan kirjautumisjärjestelmään. Hieno, mutta ei mikään “aseta ja unohda” -ratkaisu.

---

## Hybrid Join

**Hybrid Join** - Laiteidentiteetin malli, jossa Windows-laite on liitetty sekä paikalliseen Active Directoryyn että Microsoft Entra ID:hen.

Hybrid join liittyy erityisesti laitteisiin, ei suoraan käyttäjätilin synkronointiin.

**Esimerkkitilanne:**  
Ankkalinna Oy:n työasemat ovat perinteisesti domain-joined paikalliseen AD:hen.

Samalla ne rekisteröidään Microsoft Entra ID:hen hybrid joined -laitteina.

Conditional Access voi käyttää laitteen tilaa pääsynhallinnan ehtona.

**Tekninen huomio:**  
Hybrid join voi olla tärkeä siirtymävaihe organisaatioille, jotka ovat matkalla kohti modernimpaa laitehallintaa.

**Riski:**  
Jos laiteobjektit, join-tila tai Intune-hallinta ovat sekaisin, käyttäjän kirjautuminen ja Conditional Access voivat oireilla oudosti.

**Elikkäs:**  
Hybrid join tarkoittaa, että laite kuuluu sekä AD:hen että Entra ID:hen.

---

## Entra Joined Device

**Entra Joined Device** - Laite, joka on liitetty suoraan Microsoft Entra ID:hen ilman paikallista AD-domain-liitosta.

Tämä on yleinen modernissa pilvipohjaisessa laitehallinnassa.

**Esimerkkitilanne:**  
Ankkalinna Oy antaa uudelle työntekijälle Windows-läppärin.

Laite otetaan käyttöön Autopilotilla ja liitetään suoraan Entra ID:hen.

Laite hallitaan Intunella.

**Tekninen huomio:**  
Entra joined -malli sopii hyvin cloud-first-ympäristöihin, joissa paikallista AD-riippuvuutta halutaan vähentää.

**Riski:**  
Jos organisaatiolla on paljon vanhoja AD-riippuvaisia sovelluksia, pelkkä Entra joined -malli ei välttämättä riitä ilman lisäsuunnittelua.

**Elikkäs:**  
Entra joined device kuuluu suoraan Microsoftin pilvi-identiteettiin, ei perinteiseen AD-domainiin.

---

## Hybrid Joined Device

**Hybrid Joined Device** - Laite, joka on sekä paikallisessa AD:ssä että Microsoft Entra ID:ssä.

Tätä käytetään usein organisaatioissa, joissa on vielä paikallinen AD, mutta Microsoft 365 ja pilvipohjainen pääsynhallinta ovat käytössä.

**Esimerkkitilanne:**  
Aku Ankan työläppäri on domain-joined Ankkalinnan paikalliseen AD:hen.

Se näkyy myös Entra ID:ssä hybrid joined -laitteena.

Conditional Access voi sallia pääsyn tiettyihin palveluihin vain hybrid joined -laitteilta.

**Tekninen huomio:**  
Hybrid joined -tila voi olla tärkeä signaali Conditional Accessissa, mutta se ei yksin tarkoita, että laite olisi muuten terve tai täysin turvallinen.

**Riski:**  
Jos hybrid joined -laitteita pidetään automaattisesti luotettuina ilman compliance-tarkistusta, riskit voivat jäädä piiloon.

**Elikkäs:**  
Hybrid joined device on laite, jolla on toinen jalka AD:ssä ja toinen pilvessä.

---

## Registered Device

**Registered Device** - Laite, joka on rekisteröity Microsoft Entra ID:hen, mutta ei välttämättä ole organisaation täysin hallitsema työlaite.

Registered device voi olla esimerkiksi henkilökohtainen puhelin tai BYOD-laite.

**Esimerkkitilanne:**  
Iines kirjautuu Outlookiin omalla puhelimellaan.

Puhelin rekisteröityy Entra ID:hen, jotta Microsoft voi tunnistaa laitteen kirjautumisessa.

Se ei kuitenkaan välttämättä ole samalla tavalla organisaation hallinnassa kuin Intune-hallittu työlaite.

**Tekninen huomio:**  
Registered ei ole sama asia kuin managed tai compliant.

**Riski:**  
Jos registered device tulkitaan vahingossa luotetuksi työvälineeksi, pääsynhallinta voi olla liian löysä.

**Elikkäs:**  
Registered device on tunnistettu laite, mutta ei automaattisesti organisaation hallitsema laite.

---

## Writeback

**Writeback** - Toiminto, jossa pilvessä tehty tieto tai muutos kirjoitetaan takaisin paikalliseen ympäristöön.

Writeback voi liittyä esimerkiksi salasanoihin, ryhmiin tai laitteisiin riippuen ympäristön asetuksista.

**Esimerkkitilanne:**  
Aku vaihtaa salasanansa Microsoft 365:n itsepalvelun kautta.

Password writebackin avulla uusi salasana kirjoitetaan takaisin paikalliseen AD:hen.

Näin Aku voi käyttää samaa salasanaa myös paikallisissa järjestelmissä.

**Tekninen huomio:**  
Writeback vaatii erikseen tuetut ominaisuudet ja oikeat asetukset. Kaikkea pilvessä tehtyä ei automaattisesti kirjoiteta takaisin AD:hen.

**Riski:**  
Jos writebackin vaikutuksia ei ymmärretä, voidaan yllättyä siitä, mihin järjestelmiin muutos oikeasti vaikuttaa.

**Elikkäs:**  
Writeback tarkoittaa, että pilvestä kirjoitetaan tietoa takaisin paikalliseen ympäristöön.

---

## Group Writeback

**Group Writeback** - Toiminto, jossa tietyt pilvessä luodut tai hallitut ryhmät voidaan kirjoittaa takaisin paikalliseen AD:hen.

Tätä voidaan tarvita, jos pilvessä hallittuja ryhmiä pitää käyttää myös paikallisissa järjestelmissä.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä projektiryhmä hallitaan Microsoft 365:ssä.

Paikallinen sovellus tarvitsee kuitenkin AD-ryhmän oikeuksien antamiseen.

Group writeback voisi auttaa tuomaan pilviryhmän paikallisen ympäristön käyttöön.

**Tekninen huomio:**  
Group writebackiin liittyy rajoituksia ja käyttötapaukset pitää suunnitella tarkasti.

**Riski:**  
Jos ryhmiä kirjoitetaan takaisin ilman selkeää mallia, AD:n ryhmärakenne voi mennä sotkuiseksi.

**Elikkäs:**  
Group writeback vie ryhmätietoa pilvestä takaisin AD:hen. Kätevä tietyissä tilanteissa, mutta ei mikään ryhmäkaatopaikka.

---

## Password Writeback

**Password Writeback** - Toiminto, jossa pilvessä tehty salasanan vaihto tai palautus kirjoitetaan takaisin paikalliseen AD:hen.

Tämä liittyy usein Self-Service Password Reset -toimintoon.

**Esimerkkitilanne:**  
Hupu unohtaa salasanansa.

Hän käyttää Microsoftin SSPR-toimintoa ja asettaa uuden salasanan.

Password writeback päivittää uuden salasanan myös paikalliseen AD:hen.

Tämän jälkeen Hupu voi kirjautua sekä Microsoft 365:een että paikalliseen työasemaan samalla uudella salasanalla.

**Tekninen huomio:**  
Password writeback on tärkeä hybrid-ympäristössä, jotta salasanan palautus pilvessä ei jää vain pilven asiaksi.

**Riski:**  
Jos password writeback ei toimi, käyttäjä voi vaihtaa salasanan pilvessä mutta ei pääse paikallisiin järjestelmiin odotetusti.

**Elikkäs:**  
Password writeback vie pilvessä palautetun salasanan takaisin AD:hen.

---

## Exchange Hybrid

**Exchange Hybrid** - Malli, jossa organisaatiolla on sekä paikallinen Exchange että Exchange Online käytössä tai siirtymävaiheessa.

Exchange hybrid liittyy usein sähköpostiin, postilaatikoihin, osoitteisiin ja Exchange-attribuutteihin.

**Esimerkkitilanne:**  
Ankkalinna Oy siirtää postilaatikoita paikallisesta Exchangesta Exchange Onlineen.

Osa käyttäjistä on vielä paikallisessa Exchangessa ja osa pilvessä.

Käyttäjien sähköpostiosoitteet, alias-tiedot ja postilaatikon sijainti pitää hallita oikein.

**Tekninen huomio:**  
Synkronoiduissa ympäristöissä Exchange-attribuutit voivat tulla paikallisesta ympäristöstä, vaikka postilaatikko olisi pilvessä.

**Riski:**  
Jos sähköpostiattribuutteja muutetaan väärästä paikasta, sähköposti voi mennä rikki tai osoitteet voivat käyttäytyä oudosti.

**Elikkäs:**  
Exchange Hybrid tarkoittaa, että sähköpostimaailma elää sekä paikallisesti että pilvessä. Ja kyllä, siitä voi tulla aika herkullinen sotku, jos attribuutteja räplää väärin.

---

## Soft Match

**Soft Match** - Prosessi, jossa Entra ID yrittää yhdistää paikallisen AD:n käyttäjän olemassa olevaan pilvikäyttäjään esimerkiksi UPN:n tai sähköpostiosoitteen perusteella.

Soft match voi auttaa tilanteessa, jossa pilvessä on jo käyttäjä ja myöhemmin paikallinen AD-käyttäjä synkronoidaan.

**Esimerkkitilanne:**  
Ankkalinna Oy on luonut Akulle ensin cloud-only käyttäjän Microsoft 365:een.

Myöhemmin Akulle luodaan paikallinen AD-käyttäjä ja aloitetaan synkronointi.

Jos tiedot täsmäävät, Entra voi yhdistää paikallisen käyttäjän olemassa olevaan pilvikäyttäjään soft matchin avulla.

**Tekninen huomio:**  
Soft match perustuu siihen, että tietyt tunnistetiedot täsmäävät. Jos ne eivät täsmää tai ovat ristiriidassa, voi syntyä ongelmia.

**Riski:**  
Väärä soft match voi yhdistää väärät identiteetit tai aiheuttaa duplikaatteja.

**Elikkäs:**  
Soft match yrittää päätellä, että tämä AD-käyttäjä ja tämä pilvikäyttäjä ovat sama henkilö.

---

## Hard Match

**Hard Match** - Tarkempi yhdistäminen, jossa paikallisen AD:n käyttäjä ja pilvikäyttäjä yhdistetään teknisen tunnisteen perusteella.

Hard match liittyy usein Immutable ID -arvoon.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä soft match ei toimi, koska käyttäjän UPN tai sähköpostiosoite ei täsmää.

IAM-tiimi joutuu selvittämään, miten paikallinen AD-käyttäjä ja pilvikäyttäjä yhdistetään oikealla teknisellä tunnisteella.

**Tekninen huomio:**  
Hard match on teknisempi ja riskialttiimpi operaatio kuin tavallinen käyttäjän muokkaus. Sitä ei pidä tehdä sokkona.

**Riski:**  
Väärä hard match voi yhdistää väärät käyttäjät ja aiheuttaa todella ikävän identiteettisotkun.

**Elikkäs:**  
Hard match yhdistää identiteetit teknisellä tunnisteella. Tähän ei mennä vasaralla ja villasukilla, vaan suunnitelmalla.

---

## Duplicate Identity

**Duplicate Identity** - Tilanne, jossa samalle ihmiselle syntyy kaksi tai useampi digitaalinen identiteetti.

Duplicate identity voi syntyä esimerkiksi, jos:

- käyttäjä luodaan ensin pilveen ja myöhemmin AD:hen
- HR luo henkilön uutena, vaikka kyse on roolimuutoksesta
- soft match ei onnistu
- UPN tai sähköpostiosoite ei täsmää
- käyttäjälle luodaan uusi tili nimenmuutoksen takia
- vanhaa tiliä ei suljeta oikein

**Esimerkkitilanne:**  
Iines Ankka siirtyy työntekijästä toimihenkilöksi Ankkalinna Oy:ssä.

HR-järjestelmä käsittelee muutoksen uutena työsuhteena ja luo uuden käyttäjätiedon.

Tämän seurauksena Iinekselle syntyy uusi tili, vaikka vanha tili on vielä olemassa.

Nyt Iineksellä voi olla kaksi identiteettiä:

- vanha tunnus, jossa on vanhat oikeudet
- uusi tunnus, jossa on uudet oikeudet

**Tekninen huomio:**  
Duplicate identity sotkee helposti sähköpostin, oikeudet, auditoinnin, ryhmät, OneDriven, Teamsin ja raportoinnin.

**Riski:**  
Jos samalla henkilöllä on kaksi aktiivista tiliä, kukaan ei välttämättä tiedä kumpi on oikea ja mitä oikeuksia kummallakin on.

**Elikkäs:**  
Duplicate identity tarkoittaa, että yhdestä ihmisestä tulee järjestelmissä kaksi käyttäjää. Se on IAM-sotkun premium-versio.

---

## Sync Error

**Sync Error** - Virhe synkronoinnissa paikallisen AD:n ja Microsoft Entra ID:n välillä.

Sync error voi liittyä esimerkiksi:

- duplikaattiin UPN:ään
- duplikaattiin sähköpostiosoitteeseen
- virheelliseen attribuuttiin
- liian pitkään arvoon
- puuttuvaan pakolliseen tietoon
- ristiriitaiseen objectiin
- oikeusongelmaan
- sync-sääntöön

**Esimerkkitilanne:**  
Ankkalinna Oy luo uuden käyttäjän, mutta käyttäjä ei ilmesty Entra ID:hen.

Tarkistuksessa huomataan sync error: sähköpostiosoite on jo käytössä toisella objektilla.

Käyttäjää ei voida synkronoida oikein ennen kuin osoiteristiriita korjataan.

**Tekninen huomio:**  
Sync errorit kannattaa selvittää juurisyyn kautta. Pelkkä oireen korjaaminen voi johtaa siihen, että sama ongelma palaa.

**Riski:**  
Jos sync errorit jätetään huomioimatta, käyttäjät voivat puuttua pilvestä, lisenssit eivät toimi tai oikeudet jäävät antamatta.

**Elikkäs:**  
Sync error tarkoittaa, että AD:n ja Entran välinen tiedonsiirto kompastui johonkin. Lokit käteen, ei arvailua.

---

## Staging Mode

**Staging Mode** - Microsoft Entra Connectin tila, jossa palvelin voi lukea ja valmistella synkronointia, mutta ei tee aktiivisia muutoksia Entra ID:hen.

Staging modea käytetään usein varapalvelimen tai muutosten testaamisen yhteydessä.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on käytössä Entra Connect -palvelin.

IAM-tiimi rakentaa uuden Entra Connect -palvelimen varalle.

Uusi palvelin asetetaan staging modeen, jotta sen asetuksia voidaan tarkistaa ilman että se alkaa heti kirjoittaa muutoksia pilveen.

Jos aktiivinen palvelin hajoaa, staging-palvelin voidaan ottaa käyttöön hallitusti.

**Tekninen huomio:**  
Staging mode on hyödyllinen migraatioissa, päivityksissä ja varautumisessa.

**Riski:**  
Jos kaksi Entra Connect -palvelinta yrittää tehdä aktiivista synkronointia väärin samaan aikaan, ympäristöön voi tulla ikäviä ongelmia.

**Elikkäs:**  
Staging mode on varalla oleva tai testattava sync-palvelin. Se katsoo ja valmistautuu, mutta ei vielä ohjaa liikennettä.

---

## Yhteenveto

Hybrid identity on yksi tärkeimmistä aiheista Microsoft-ympäristöissä, koska moni organisaatio ei ole täysin pilvessä eikä täysin paikallinen.

Todellisuus on usein jotain tältä väliltä:

- käyttäjät luodaan HR-järjestelmästä tai AD:stä
- tiedot synkronoituvat Entra ID:hen
- kirjautuminen tapahtuu Microsoft 365 -palveluihin
- sähköposti voi olla Exchange Onlinessa
- laitteet voivat olla hybrid joined
- oikeudet perustuvat ryhmiin, attribuutteihin ja sovelluksiin
- muutokset pitää tehdä oikeassa lähdejärjestelmässä

Hybrid identityssä tärkein kysymys on usein:

> Mistä tämä tieto tulee ja mihin se vaikuttaa?

Kun tämän ymmärtää, moni asia alkaa näyttää vähemmän mystiseltä.

**Elikkäs:**  
Hybrid identity on AD:n ja Entran yhteispeliä. Se on tehokas, mutta vain jos ymmärretään source of authority, synkronointi, attribuutit, käyttäjien linkitys ja se, mistä muutokset oikeasti pitää tehdä.
