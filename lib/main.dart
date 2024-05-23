// packages
import 'package:flutter/material.dart';

// screens
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';

// theme
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      home: const Home(),
      theme: primaryTheme,
    ),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sandbox"),
        backgroundColor: Colors.grey,
      ),
      body: const Text("Sandbox"),
    );
  }
}

enum Priority { low, medium, high, urgent }

Priority p = Priority.medium;
