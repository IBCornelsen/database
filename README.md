<div align="center">
  <a href="https://github.com/IBCornelsen/database">
    <img src="https://online-energieausweis.org/images/header/logo-big.png" alt="Logo" width="240" height="80">
  </a>

<h3 align="center">IBC Datenbank</h3>

  <p align="center">
    Die Datenbankarchitektur des IBC.
    <br />
    <a href="https://docs.ibcornelsen.de/storage/"><strong>Dokumentation »</strong></a>
    <br />
    <br />
    <a href="https://github.com/IBCornelsen/database">Demo</a>
    ·
    <a href="https://github.com/IBCornelsen/database/issues">Bug gefunden?</a>
    ·
    <a href="https://github.com/IBCornelsen/database/issues">Feature Anfordern</a>
  </p>
</div>

- [Beschreibung](#beschreibung)
	- [Anforderungen](#anforderungen)
	- [Installation](#installation)
- [Nächste Schritte](#nächste-schritte)
- [Beiträge zu unserer Arbeit](#beiträge-zu-unserer-arbeit)
- [License](#license)
- [Kontakt](#kontakt)


## Beschreibung

Dies ist das Repository für die Datenbank des IBCornelsen. Eine Demo kann direkt über GitHub heruntergeladen und mit **Docker** gestartet werden.

Momentan arbeiten wir an der Umsetzung einer neuen, verbesserten Datenbankstruktur die aktuelle Probleme mit Hinsicht auf die Skalierung unserer Architektur lösen wird.

### Anforderungen

Die meisten unserer Systeme sind für Ubuntu gedacht und darauf getestet worden. Viele Funktionen werden ebenfalls auf Windows verfügbar sein, allerdings können unerwartetes Verhalten und Fehler nicht ausgeschlossen werden.

Für dieses Projekt benötigst du:

* docker
  * Installationsanleitungen für **docker** kannst du [hier](https://docs.docker.com/engine/install/) finden.
* NodeJS
  * Downloads für Node stehen [hier](https://nodejs.org/en) zur Verfügung.
* Als Package Manager benutzen wir **bun**.
	* Installationsanleitungen für **bun** kannst du [hier](https://bun.sh) finden.

### Installation

1. Klone das Repository

   ```sh
   git clone https://github.com/IBCornelsen/database.git
   ```

2. Führe `docker-compose` aus.

   ```bash
   docker-compose up --build
   ```

## Nächste Schritte

* [x] Verteilte Datenbankstruktur
* [ ] Performance Optimierungen
* [x] Umstieg auf PostgreSQL
  * [ ] Umzug der alten Daten
* [x] Umstieg auf Prisma

See the [open issues](https://github.com/IBCornelsen/database/issues) for a full list of proposed features (and known issues).

## Beiträge zu unserer Arbeit

Wenn du Ideen, Vorschläge oder sonstige Anmerkungen haben solltest, schreck' nicht davor zurück dein Feature zu implementieren und eine Pull Request zu erstellen, wir sind **immer** offen für neues!

1. Erstelle einen **Fork** des Repos
2. Erstelle einen neuen Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Committe deine Änderungen (`git commit -m 'Add some AmazingFeature'`)
4. Pushe deine Änderungen auf den neuen Branch (`git push origin feature/AmazingFeature`)
5. Öffne eine Pull Request

## License

Veröffentlicht unter der GPL-3.0 Lizenz. Siehe `LICENSE` für mehr Information.

## Kontakt

IBCornelsen - [info@ibcornelsen.de](mailto://info@ibcornelsen.de)

Organisation: [https://github.com/IBCornelsen/database](https://github.com/IBCornelsen/database)