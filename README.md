# Eventsystem
Event-Management-System

Staging: [![Build Status](https://travis-ci.com/eventsurfer/eventsurfer.svg?branch=staging)](https://travis-ci.com/eventsurfer/eventsurfer)

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/7125f48349bb4213931d0d42a42f4c1f)](https://www.codacy.com/app/florianfynnweber/eventsurfer?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=eventsurfer/eventsurfer&amp;utm_campaign=Badge_Grade)

[Production](http://eventsurfer.online)

[Etherpad](https://medienpad.de/p/Y3pAwhZhbP)


Install bundle:
```
gem install bundle
```

Initialisieren des Programms:
```
git clone hhttps://github.com/eventsurfer/eventsurfer.git
bundle install --path=vendor/bundle
```

Verändern der Datei *yourpath\Eventsystem\config\database.yml*

Starten des Servers über die Konsole:
```
bundle exec rails s
```


Starten der Webconsole:
```
bundle exec rails console
```

Generieren einer Migration:
```
bundle exec rails generate migration nameofmigration
```

Migrieren von Änderungen:
```
bundle exec rails db:migrate
```

Rubocop ausführen:
```
bundle exec rubocop
```
