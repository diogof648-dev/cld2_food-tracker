# CLD2 - FOOD TRACKER

## Description

Ce project consiste à créer une application de tracking alimentaire durant le module CLD2. Le projet est basé sur la structure du projet suivant : https://github.com/CPNV-ES/nos1_ddj.git

## Mise en route

### Prérequis

Listez toutes les dépendances et leur version nécessaires au projet en tant que :

- OS supportées :
  - [Debian 11 (bullseye)](https://www.debian.org/releases/bullseye/debian-installer/index)
  - [macOS (Sonoma 14.5)](https://www.iclarified.com/91544/where-to-download-macos-sonoma)
  - [Windows (10.22H2)](https://www.microsoft.com/fr-fr/software-download/windows10%20)
- Langage :
  - [Ruby (3.1.2)](https://www.ruby-lang.org/en/documentation/installation/)
- Extensions :
  - [RubyLSP (v0.8.16)](https://shopify.github.io/ruby-lsp/#with-vs-code)

### Configuration

1. Installer Ruby
   1. [macOS](https://www.ruby-lang.org/en/documentation/installation/#homebrew)
   2. [Windows](https://www.ruby-lang.org/en/documentation/installation/#winget)
   3. [Debian, Ubuntu, ...](https://www.ruby-lang.org/en/documentation/installation/#apt)
2. [Installer Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Pour Git Flow, cela dépend du système d'exploitation que vous utilisez. Si vous utilisez Windows, tout va bien, il est déjà installé avec git. Pour les autres, [suivre ce tutoriel](https://skoch.github.io/Git-Workflow/).

Dans ce projet, nous avons utilisé Visual Studio Code comme IDE principal.

## Déploiement

### Environnement de développement

1. Cloner le dépôt git

```bash
git clone https://github.com/diogof648-dev/cld2_food-tracker.git
cd cld2_food-tracker
```

2. Setup la branche `main` et initialiser Git Flow pour le projet

```bash
git switch main

git flow init
```

3. Mise en place de la base de données et du fichier de configuration

> Créer le fichier de configuration pour MariaDB et modifier le nom du fichier

```bash
cp config/database.example.yml config/database.yml
```

4. Installer les dépendances de MariaDB/MySQL

> MacOS :

```bash
brew install mariadb
```

> Linux :

```bash
sudo apt update
sudo apt install ruby-dev

sudo apt install libmariadb-dev
```

5. Installer les gems du projet

```bash
gem install bundler

bundle install
```

6. Base de données

   1. Créer et migrer la base de données SQL

   ```bash
   bundle exec rake db:create

   bundle exec rake db:migrate
   ```

   2. Démarrer mongodb

   ```bash
   sudo systemctl start mongod
   ```

7. Lancer le serveur Ruby

```bash
rerun app.rb
```

> http://127.0.0.1:4567/

#### Comment exécuter les tests ?

```bash
# aucun test actuellement
```

## Structure des répertoires

```bash
./cld2_food-tracker
├── app
│   ├── controllers                     # Controllers
│   │   ├── meals_controller.rb
│   │   ├── products_controller.rb
│   │   └── users_controller.rb
│   ├── middlewares                     # Middlewares
│   │   └── auth.rb
│   ├── models                          # Models
│   │   ├── meal_type.rb
│   │   ├── meal.rb
│   │   ├── product_type.rb
│   │   ├── product.rb
│   │   ├── user.rb
│   │   └── weight.rb
│   ├── services                        # Services
│   │   └── db_connection.rb
│   └── views                           # Views
│       ├── account
│       ├── login
│       ├── meals
│       ├── products
│       ├── register
│       ├── weight
│       └── layout.erb
├── app.rb                              # Point d'entrée de l'application
├── config                              # Configuration
│   ├── database.example.yml
│   ├── irb.rb
│   └── logger.rb
├── db                                  # Database
│   ├── migrate                         # Migration
│   └── schema.rb
├── logs                                # Logs
│   └── 2025-xx-xx.log
├── Gemfile
├── Gemfile.lock
├── LICENSE
├── Rakefile
└── README.md
```

## Collaborer

- Prenez le temps de lire le readme et de trouver la façon dont vous souhaitez aider les autres développeurs à collaborer avec vous.

- Ils ont besoin de savoir :
  - [Comment proposer une nouvelle fonctionnalité (issue, pull request)](https://github.com/CPNV-ES/nos1_ddj/issues)
  - [Comment écrire du code](https://www.php-fig.org/psr/psr-12/)
  - [Comment commit](https://www.conventionalcommits.org/en/v1.0.0/)
  - [Comment utiliser votre workflow - GitFlow](https://nvie.com/posts/a-successful-git-branching-model/)

## License

- [MIT License](LICENSE).

## Contact

- Diogo : <diogosilvafernandes85@gmail.com>, [GitHub](https://github.com/diogof648-dev)
