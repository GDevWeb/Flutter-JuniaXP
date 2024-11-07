import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Application principale
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}

// Écran d'accueil avec gestion des états et navigation
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  // Fonction pour incrémenter le compteur
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        centerTitle: true,
        actions: const [
          Icon(Icons.settings),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Affichage du compteur
            const Text('Vous avez appuyé ce bouton autant de fois :'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // Bouton pour incrémenter le compteur
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Incrémenter'),
            ),
            const SizedBox(height: 20),
            // Bouton pour aller à l'écran de détails
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsScreen(),
                  ),
                );
              },
              child: const Text('Aller aux détails'),
            ),
            const SizedBox(height: 20),
            // Bouton pour envoyer un message à l'écran de détails
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageScreen(
                        message: 'Hello depuis l\'écran d\'accueil!'),
                  ),
                );
              },
              child: const Text('Envoyer un message'),
            ),
          ],
        ),
      ),
    );
  }
}

// Écran de détails
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Ceci est l\'écran de détails',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Écran pour afficher un message reçu en paramètre
class MessageScreen extends StatelessWidget {
  final String message;

  const MessageScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
