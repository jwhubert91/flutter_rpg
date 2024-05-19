// packages
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:uuid/uuid.dart';

// theme
import 'package:flutter_rpg/theme.dart';

// models
import 'package:flutter_rpg/models/vocation.dart';

// widgets
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  // private methods (text controllers)
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  // public vocation state
  Vocation selectedVocation = Vocation.junkie;

  // custom dispose function for text controllers
  // (fires when screen is no longer in view)
  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // handle vocation state variable selection
  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // form submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      // show error dialog - missing name
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      // show error dialog - missing slogan
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Character Creation"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            // welcome message
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            const Center(child: StyledHeading("Welcome, new player")),
            const Center(
                child:
                    StyledText("Create a name and slogan for your character")),
            const SizedBox(height: 30),

            // inputs for name and slogan
            TextField(
              controller: _nameController,
              style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium),
              cursorColor: AppColors.textColor,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_2),
                label: StyledText('Character name'),
              ),
            ),
            const SizedBox(height: 0),
            TextField(
              controller: _sloganController,
              style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText("Character slogan")),
            ),
            const SizedBox(height: 30),

            // select vocation title
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            const Center(child: StyledHeading("Choose a vocation")),
            const Center(
                child: StyledText("This determines your available skills")),
            const SizedBox(height: 30),

            // vocation cards
            VocationCard(
              onTap: updateVocation,
              vocation: Vocation.junkie,
              selected: selectedVocation == Vocation.junkie,
            ),
            VocationCard(
              onTap: updateVocation,
              vocation: Vocation.ninja,
              selected: selectedVocation == Vocation.ninja,
            ),
            VocationCard(
              onTap: updateVocation,
              vocation: Vocation.raider,
              selected: selectedVocation == Vocation.raider,
            ),
            VocationCard(
              onTap: updateVocation,
              vocation: Vocation.wizard,
              selected: selectedVocation == Vocation.wizard,
            ),

            // submit button
            Center(
              child: StyledButton(
                  onPressed: handleSubmit,
                  child: const StyledHeading('Create a name')),
            )
          ]),
        ),
      ),
    );
  }
}
