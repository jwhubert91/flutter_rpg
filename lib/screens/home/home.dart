// packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// models
import 'package:flutter_rpg/models/character.dart';

// screens
import 'package:flutter_rpg/screens/create/create.dart';

// widgets
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return CharacterCard(value.characters[index]);
                    },
                  );
                },
              ),
            ),
            StyledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context2) => const CreateScreen()));
                },
                child: const StyledHeading("Create New"))
          ],
        ),
      ),
    );
  }
}
