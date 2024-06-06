# bouncing

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<!-- ----------------------------------------------------------------------------------------------------------------------- -->

# Bouncing Balls

Ce projet en Dart/Flutter est une application qui simule le mouvement de balles rebondissantes à l'intérieur d'un cercle.

## Fonctionnalités

- Les balles quittent le centre du cercle dans une direction rectiligne aléatoire.
- Les balles rebondissent sur le bord du cercle et changent de direction.
- Un compteur affiche le nombre de balles générées.
- Contrôle du démarrage, de la pause et de la réinitialisation du mouvement des balles.

## Structure du Projet

Le projet est organisé en plusieurs fichiers pour une meilleure modularité :

- **model/ball.dart**: Définit la classe `Ball` représentant une balle avec ses propriétés et méthodes.
- **utils/painter.dart**: Contient la classe `BallPainter` qui gère le dessin des balles et du cercle dans le widget `CustomPaint`.
- **main.dart**: Fichier principal de l'application qui contient la logique de contrôle et l'interface utilisateur.

## Installation

1. Assurez-vous d'avoir Flutter installé sur votre machine.
2. Clonez ce dépôt GitHub sur votre machine locale.
3. Exécutez `flutter pub get` pour obtenir les dépendances du projet.

## Utilisation

1. Exécutez l'application en utilisant `flutter run`.
2. Observez le mouvement des balles à l'intérieur du cercle.
3. Utilisez les boutons pour démarrer, mettre en pause ou réinitialiser le mouvement des balles.

## Contribution

Les contributions sont les bienvenues ! Si vous souhaitez améliorer ce projet, vous pouvez :

- Proposer de nouvelles fonctionnalités.
- Améliorer le code existant.
- Corriger des bugs.

Pour contribuer, veuillez suivre ces étapes :

1. Fork ce dépôt sur GitHub.
2. Créez une nouvelle branche avec votre fonctionnalité/fix (`git checkout -b amelioration`)
3. Faites vos modifications et commit (`git commit -am 'Ajoute une nouvelle fonctionnalité'`)
4. Poussez vos modifications sur la branche (`git push origin amelioration`)
5. Créez une nouvelle Pull Request

## Auteurs

- [Jules TOUGLO](https://github.com/Julio-SISCO) - Développeur principal

## License
Pas de licence requise
