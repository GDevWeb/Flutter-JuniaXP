# Cours Flutter

## Table des Matières

1. [Introduction à Flutter et au squelette d'une application](#chapitre-1-squelette-dune-première-application)
2. [Gestion de l'AppBar, du Body et du Container](#chapitre-2-appbar-body-container)
3. [Affichages élémentaires et mise en forme](#chapitre-3-affichages-élémentaires)
4. [Les Boutons et la Gestion des États](#chapitre-4-les-boutons)
5. [Navigation entre plusieurs écrans](#chapitre-5-naviguer-sur-plusieurs-écrans)

---

### Chapitre 1 : Squelette d’une première application

Ce chapitre couvre la structure de base d'une application Flutter en utilisant les classes `StatelessWidget` et `StatefulWidget`.

#### 1.1 Squelette de base (StatelessWidget)

Le code d’une application minimale, avec un widget sans état, affiche "Hello World!" au centre de l'écran.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
```

#### 1.2 Gestion des états avec StatefulWidget

Les widgets avec état permettent de gérer des changements d'état (par exemple, en réponse à une interaction utilisateur).

```dart
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
```

#### 1.3 Utilisation de `const` dans Dart

Les constantes (`const`) permettent des optimisations de performance et garantissent que l'objet ne changera pas après sa création.

---

### Chapitre 2 : AppBar – Body – Container

Ce chapitre présente la création de l'en-tête de l'application (AppBar), la structure du contenu principal (Body), et l'utilisation de Container pour la mise en page.

#### 2.1 Création de l'AppBar

L'AppBar est l'en-tête de l'application, contenant des éléments comme le titre et des icônes.

```dart
appBar: AppBar(
  title: const Text('Flutter', style: TextStyle(color: Colors.white)),
  leading: const Icon(Icons.access_alarm, color: Color(0xFFFF00FF)),
  actions: const <Widget>[
    Icon(Icons.add_to_photos, color: Colors.white),
  ],
  elevation: 10.0,
  centerTitle: true,
),
```

#### 2.2 Création du Body avec un Container

Un `Container` permet de structurer et styliser les éléments du `body`.

```dart
body: Container(
  color: Colors.lightBlue,
  padding: const EdgeInsets.all(20.0),
  margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
),
```

---

### Chapitre 3 : Affichages élémentaires

Ce chapitre traite des éléments d'affichage de base, tels que les lignes (`Row`), les colonnes (`Column`), les cartes (`Card`), les images et le texte.

#### 3.1 Centrer un élément

Utilisez `Center` pour centrer un élément sur l'écran.

```dart
body: Center(
  child: Container(
    width: 150.0,
    height: 150.0,
    color: Colors.blue,
    child: const Text('Hello World'),
  ),
),
```

#### 3.2 Les cartes (Card)

Les cartes sont utilisées pour les éléments qui nécessitent un style `Material Design`.

```dart
body: const Center(
  child: Card(
    elevation: 15.0,
    color: Colors.red,
    child: SizedBox(width: 300.0, height: 300.0),
  ),
),
```

#### 3.3 Lignes et Colonnes

Les `Row` et `Column` organisent les widgets en lignes et colonnes.

---

### Chapitre 4 : Les boutons

Ce chapitre explique les types de boutons disponibles et la gestion des états via des boutons.

#### 4.1 Différents types de boutons

Flutter offre plusieurs types de boutons, chacun adapté à des contextes spécifiques.

- **TextButton** : Bouton de texte simple.
- **ElevatedButton** : Bouton en relief, souvent utilisé pour les actions primaires.
- **OutlinedButton** : Bouton avec bordure, pour des actions secondaires.

#### 4.2 Exemples de boutons

```dart
TextButton(
  onPressed: btDown,
  child: const Text("TextButton"),
),
ElevatedButton(
  onPressed: () {},
  child: const Text('ElevatedButton'),
),
OutlinedButton(
  onPressed: btDown,
  child: const Text("OutlinedButton"),
),
```

#### 4.3 Gestion des états avec des FloatingActionButton

Les FloatingActionButton sont des boutons flottants, souvent utilisés pour des actions rapides.

```dart
floatingActionButton: FloatingActionButton(
  onPressed: _incrementCounter,
  tooltip: 'Increment',
  child: const Icon(Icons.add),
),
```

---

### Chapitre 5 : Naviguer sur plusieurs écrans

Ce chapitre montre comment structurer une application pour naviguer entre plusieurs écrans.

#### 5.1 Création d'un second écran

L'exemple suivant montre comment définir et accéder à un écran secondaire depuis l'écran principal.

**HomeScreen (Écran principal)**

```dart
void btAbout() {
  Navigator.pushNamed(context, '/about');
}
```

**AboutScreen (Écran secondaire)**

```dart
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text("À propos"),
      ),
    );
  }
}
```

#### 5.2 Passer des paramètres à un écran

Pour passer un message à un écran, utilisez les arguments de route.

```dart
Navigator.pushNamed(
  context,
  '/message',
  arguments: 'Message passé en paramètre',
);
```

**MessageScreen**

```dart
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    final message = args ?? 'No message provided';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Message', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
```

---

Ce cours structuré couvre les bases essentielles de Flutter et des widgets courants, offrant une approche progressive pour comprendre le développement d'interfaces avec Flutter.
