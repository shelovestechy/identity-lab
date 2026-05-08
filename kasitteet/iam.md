# IAM

IAM tarkoittaa **Identity and Access Managementia** eli identiteetin ja käyttöoikeuksien hallintaa.

Tässä tiedostossa kerään IAMiin liittyviä peruskäsitteitä selkokielellä, esimerkkien kautta.

---

## IAM

**IAM** - Identity and Access Management. Tarkoittaa identiteetin ja käyttöoikeuksien hallintaa. IAM vastaa siihen, kuka käyttäjä on, mihin hän pääsee ja millä oikeuksilla.

**Esimerkkitilanne:**  
Ankkalinna Oy palkkaa uuden työntekijän nimeltä Aku Ankka. Akulle pitää luoda käyttäjätunnus, sähköposti ja pääsy niihin järjestelmiin, joita hän tarvitsee työssään. Samalla pitää varmistaa, ettei Aku saa pääsyä sellaisiin tietoihin, joita hän ei tarvitse.

**Elikkäs:**  
IAM on työpaikan digitaalinen avainhallinta. Se päättää kenellä on avain, mihin oveen ja milloin avain pitää ottaa pois.

---

## Identity

**Identity** - Digitaalinen identiteetti. Esimerkiksi käyttäjätili, jolla ihminen tunnistetaan järjestelmässä.

**Esimerkkitilanne:**  
Roope Ankka kirjautuu Ankkalinna Oy:n järjestelmiin käyttäjätunnuksella `roope.ankka@ankkalinna.fi`. Tämä tunnus kertoo järjestelmälle, että kyseessä on Roope eikä joku muu.

**Elikkäs:**  
Identity kertoo järjestelmälle: “Tämä käyttäjä on tämä henkilö.”

---

## Access

**Access** - Pääsy johonkin järjestelmään, sovellukseen, tiedostoon tai resurssiin.

**Esimerkkitilanne:**  
Aku Ankka pääsee kirjautumaan Microsoft Teamsiin, Outlookiin ja työvuorojärjestelmään. Hänellä ei kuitenkaan ole pääsyä palkkahallinnon järjestelmään.

**Elikkäs:**  
Access tarkoittaa sitä, mihin digitaalisiin oviin käyttäjällä on avain.

---

## Permission

**Permission** - Käyttöoikeus. Mitä käyttäjä saa tehdä järjestelmässä, esimerkiksi lukea, muokata, poistaa tai hallita.

**Esimerkkitilanne:**  
Iines Ankka saa avata asiakastiedoston ja lukea sen, mutta hän ei saa poistaa sitä. Hannu Hanhi taas saa sekä lukea että muokata tiedostoa, koska hänen työroolinsa vaatii sitä.

**Elikkäs:**  
Access kertoo, pääsetkö sisään. Permission kertoo, mitä saat tehdä kun olet sisällä.

---

## Role

**Role** - Rooli. Roolin avulla käyttäjälle voidaan antaa oikeuksia työn tai tehtävän perusteella.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä on rooleja kuten `Service Desk`, `HR`, `Finance` ja `Manager`. Kun uusi työntekijä aloittaa HR-tiimissä, hänelle voidaan antaa HR-rooliin kuuluvat perusoikeudet.

**Elikkäs:**  
Role on kuin työtehtävän mukainen avainnippu. Eri rooleilla on eri avaimet.

---

## Group

**Group** - Ryhmä. Käyttäjiä voidaan lisätä ryhmiin ja ryhmälle annetaan oikeudet. Näin oikeuksia ei tarvitse antaa jokaiselle käyttäjälle yksitellen.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on ryhmä nimeltä `HR-users`. Kaikki HR-tiimin työntekijät lisätään tähän ryhmään ja ryhmällä on pääsy HR-järjestelmään.

**Elikkäs:**  
Ryhmä on kuin yhteinen avainnippu. Kun kuulut ryhmään, saat ryhmän mukana tulevat oikeudet.

---

## User Account

**User Account** - Käyttäjätili. Tili, jolla henkilö kirjautuu järjestelmiin.

**Esimerkkitilanne:**  
Ankkalinna Oy luo uudelle työntekijälle käyttäjätilin `aku.ankka@ankkalinna.fi`. Tällä tilillä Aku kirjautuu koneelle, sähköpostiin ja muihin työjärjestelmiin.

**Elikkäs:**  
User account on käyttäjän oma digitaalinen työpaikkatunnus.

---

## Service Account

**Service Account** - Palvelutili. Tili, jota käyttää järjestelmä, sovellus tai automaatio, ei suoraan tavallinen käyttäjä.

**Esimerkkitilanne:**  
Ankkalinna Oy:llä on automaatio, joka siirtää raportteja järjestelmästä toiseen joka yö. Tätä varten käytetään palvelutiliä, eikä kenenkään henkilökohtaista käyttäjätiliä.

**Elikkäs:**  
Service account on järjestelmän tai automaation oma tili. Ei ihmisen arkikäyttöön.

---

## Shared Account

**Shared Account** - Jaettu tili. Sama tili on useamman ihmisen käytössä. Usein huono idea, koska vastuuta on vaikea jäljittää.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä useampi työntekijä käyttää samaa tunnusta `varasto.admin`. Joku tekee muutoksen varastojärjestelmään, mutta jälkeenpäin ei tiedetä kuka sen oikeasti teki.

**Elikkäs:**  
Shared account on yhteiskäyttötunnus. Kätevä ehkä hetken, mutta auditoinnin kannalta aikamoinen sekasotku... (Käyttäjien mielestä kiva - kaikkien muiden mielestä vähemmän kiva)

---

## Identity Lifecycle

**Identity Lifecycle** - Identiteetin elinkaari. Mitä käyttäjätilille tapahtuu alusta loppuun: luonti, muutokset ja poisto. (( Joiner, Mover ja Leaver ))

**Esimerkkitilanne:**  
Aku Ankka aloittaa Ankkalinna Oy:ssä, vaihtaa myöhemmin toiseen tiimiin ja lopulta lähtee yrityksestä. Hänen käyttäjätilinsä ja oikeutensa muuttuvat jokaisessa vaiheessa.

**Elikkäs:**  
Identity lifecycle on käyttäjätilin elämäntarina: alku, muutokset ja loppu.

---

## JML

**JML** - Joiner, Mover, Leaver. Käyttäjän elinkaaren kolme vaihetta: uusi työntekijä, roolia vaihtava työntekijä ja lähtevä työntekijä.

**Esimerkkitilanne:**  
Ankkalinna Oy:ssä Aku aloittaa uutena työntekijänä, siirtyy myöhemmin varastosta asiakaspalveluun ja lopulta lähtee yrityksestä. Näissä vaiheissa hänen oikeuksiaan pitää hallita eri tavalla.

**Elikkäs:**  
JML on käyttäjän työpaikkamatka: tulee taloon, vaihtaa paikkaa talon sisällä tai lähtee talosta pois.

---

## Joiner

**Joiner** - Uusi käyttäjä tai työntekijä. Hänelle luodaan tili ja annetaan tarvittavat oikeudet.

**Esimerkkitilanne:**  
Ankkalinna Oy palkkaa uuden työntekijän nimeltä Tupu Ankka. Hänelle luodaan käyttäjätili, sähköposti ja pääsy perehdytysmateriaaleihin.

**Elikkäs:**  
Joiner = uusi tyyppi tulee taloon ja tarvitsee digitaaliset avaimet.

---

## Mover

**Mover** - Käyttäjä, joka vaihtaa roolia, tiimiä, osastoa tai tehtävää. Vanhoja oikeuksia pitää tarkistaa, ettei niitä jää turhaan.

**Esimerkkitilanne:**  
Iines Ankka siirtyy asiakaspalvelusta HR-tiimiin. Hän tarvitsee HR-järjestelmän oikeudet, mutta asiakaspalvelun vanhat oikeudet pitää tarkistaa ja poistaa, jos niitä ei enää tarvita.

**Elikkäs:**  
Mover = käyttäjä vaihtaa paikkaa talon sisällä. Uusia avaimia annetaan, vanhat pitää tarkistaa.

---

## Leaver

**Leaver** - Käyttäjä, joka lähtee organisaatiosta. Tilit ja oikeudet pitää poistaa tai sulkea hallitusti.

**Esimerkkitilanne:**  
Hannu Hanhi lopettaa työt Ankkalinna Oy:ssä. Hänen käyttäjätilinsä suljetaan ja pääsy sähköpostiin, tiedostoihin ja järjestelmiin poistetaan.

**Elikkäs:**  
Leaver = käyttäjä lähtee talosta, joten avaimet pitää ottaa pois.

---

## Provisioning

**Provisioning** - Käyttäjän tai oikeuksien luominen järjestelmiin. Esimerkiksi uuden käyttäjätilin tekeminen tai käyttöoikeuden lisääminen.

**Esimerkkitilanne:**  
Kun Tupu Ankka aloittaa työn, hänelle luodaan käyttäjätili Entra ID:hen, sähköposti Microsoft 365:een ja pääsy tarvittaviin ryhmiin.

**Elikkäs:**  
Provisioning = tehdään käyttäjälle tunnukset ja pääsyt valmiiksi.

---

## Deprovisioning

**Deprovisioning** - Käyttäjän tai oikeuksien poistaminen. Esimerkiksi lähtevän työntekijän tilin sulkeminen ja pääsyjen poistaminen.

**Esimerkkitilanne:**  
Kun Hannu Hanhi lähtee Ankkalinna Oy:stä, hänen tilinsä poistetaan käytöstä ja oikeudet järjestelmiin suljetaan.

**Elikkäs:**  
Deprovisioning = otetaan digitaaliset avaimet pois.

---

## Access Request

**Access Request** - Käyttöoikeuspyyntö. Käyttäjä pyytää pääsyä johonkin järjestelmään tai resurssiin.

**Esimerkkitilanne:**  
Aku Ankka tarvitsee pääsyn raportointijärjestelmään. Hän ilmoittaa tarpeesta esihenkilölleen tai tekee pyynnön yrityksen/service deskin tikettijärjestelmään, esimerkiksi ServiceNow’hun.

Pelkkä käyttäjän oma pyyntö ei saisi automaattisesti riittää. Oikeuden pitäisi mennä hyväksynnän kautta, esimerkiksi esihenkilölle tai järjestelmän omistajalle.

**Elikkäs:**  
Access request = “Saanko avaimen tähän oveen?” ( = käyttäjä tarvitsee pääsyn, mutta joku vastuuhenkilö varmistaa että pyyntö on perusteltu.)

---

## Access Approval

**Access Approval** - Käyttöoikeuden hyväksyntä. Esihenkilö, järjestelmän omistaja tai muu vastuuhenkilö hyväksyy käyttöoikeuspyynnön.

**Esimerkkitilanne:**  
Aku pyytää pääsyä raportointijärjestelmään. Hänen esihenkilönsä tarkistaa tarpeen ja hyväksyy pyynnön.

**Elikkäs:**  
Access approval = joku vastuuhenkilö sanoo: “Kyllä, tämä pääsy on perusteltu.”

---

## Access Review

**Access Review** - Käyttöoikeuksien tarkistus. Tarkistetaan, tarvitseeko käyttäjä edelleen hänellä olevia oikeuksia.

**Esimerkkitilanne:**  
Ankkalinna Oy käy kerran puolessa vuodessa läpi, ketkä pääsevät palkkahallinnon järjestelmään. Roope Ankka tarkistaa listan ja poistaa käyttäjät, jotka eivät enää tarvitse pääsyä.

**Elikkäs:**  
Access review = katsotaan, onko käyttäjällä vielä oikea avain oikeaan oveen.

---

## Access Certification

**Access Certification** - Käyttöoikeuksien virallisempi tarkastus ja vahvistus. Usein osa governance- tai auditointiprosessia.

**Esimerkkitilanne:**  
Ankkalinna Oy:n auditoinnissa pitää todistaa, että järjestelmäomistajat ovat tarkistaneet käyttäjien oikeudet ja vahvistaneet, että ne ovat edelleen tarpeellisia.

**Elikkäs:**  
Access certification = virallisempi “kyllä, nämä oikeudet on tarkistettu ja hyväksytty” -leima.

---

## Access Drift

**Access Drift** - Tilanne, jossa käyttäjälle kertyy ajan mittaan liikaa tai vanhoja oikeuksia. Esimerkiksi roolinvaihdon jälkeen vanhat pääsyt jäävät voimaan.

**Esimerkkitilanne:**  
Iines on ollut ensin asiakaspalvelussa, sitten HR:ssä ja lopulta taloushallinnossa. Jokaisesta roolista on jäänyt vähän oikeuksia päälle. Lopulta hänellä on pääsy paikkoihin, joihin hänen ei enää pitäisi päästä.

**Elikkäs:**  
Access drift = oikeudet alkavat ajelehtia pois järkevästä hallinnasta.

---

## Role Creep

**Role Creep** - Tilanne, jossa käyttäjälle kertyy oikeuksia vähitellen enemmän kuin hän oikeasti tarvitsee. Käytännössä hyvin lähellä access drift -ajatusta.

**Esimerkkitilanne:**  
Aku saa ensin varaston oikeudet, sitten asiakaspalvelun oikeudet, sitten raportointioikeudet. Mitään vanhaa ei poisteta, koska “ehkä hän joskus tarvitsee niitä”. Lopulta Akulla on järjetön määrä pääsyjä.

**Elikkäs:**  
Role creep = oikeuksia kertyy käyttäjälle kuin pölyä nurkkiin.

---

## Least Privilege

**Least Privilege** - Vähimmän oikeuden periaate. Käyttäjällä pitäisi olla vain ne oikeudet, joita hän oikeasti tarvitsee työn tekemiseen.

**Esimerkkitilanne:**  
Aku tarvitsee raportista vain lukuoikeuden. Hänelle ei anneta muokkaus- tai admin-oikeuksia, koska hän ei tarvitse niitä.

**Elikkäs:**  
Least privilege = annetaan vain tarvittavat avaimet, ei koko talon yleisavainta.

---

## Need to Know

**Need to Know** - Käyttäjälle annetaan pääsy vain tietoihin, joita hän tarvitsee tehtävässään.

**Esimerkkitilanne:**  
Varastotyöntekijä ei tarvitse pääsyä työntekijöiden palkkatietoihin. HR-tiimi voi tarvita sen, mutta varasto ei.

**Elikkäs:**  
Need to know = pääset näkemään vain sen, mitä sinun oikeasti tarvitsee tietää.

---

## Segregation of Duties

**Segregation of Duties** - Työtehtävien eriyttäminen. Yhdellä ihmisellä ei pitäisi olla liikaa valtaa tehdä koko prosessia yksin, jos se aiheuttaa riskin.

**Esimerkkitilanne:**  
Ankkalinna Oy ostaa työvaatteita VaateVarasto Oy:ltä. VaateVarasto Oy on toimittaja, koska se myy yritykselle tavaraa ja lähettää siitä laskun.

Jos sama työntekijä voisi lisätä uuden toimittajan järjestelmään ja hyväksyä laskut maksuun, hän voisi pahimmillaan keksiä oman valeyrityksen ja maksattaa sille rahaa.

Siksi tehtävät erotetaan: yksi voi lisätä toimittajan, mutta toinen henkilö tarkistaa ja hyväksyy maksun.

**Elikkäs:**  
Segregation of Duties = kaikkia vaarallisia nappeja ei anneta samalle ihmiselle.

---

## SoD

**SoD** - Segregation of Duties. Lyhenne työtehtävien eriyttämisestä.

**Esimerkkitilanne:**  
Jos yksi henkilö voi sekä luoda käyttäjän, antaa itselleen admin-oikeudet että hyväksyä muutoksen, SoD ei toteudu kovin hyvin. Siinä kohtaa auditorilla alkaa silmä nykiä.

**Elikkäs:**  
SoD = varmistetaan, ettei yhdellä ihmisellä ole liikaa valtaa koko ketjussa.
