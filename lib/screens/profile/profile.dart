// packages
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';

// widgets
import 'package:flutter_rpg/shared/styled_text.dart';

// models
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledText(character.name)),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // basic info - image, vocation, description
          Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset(
                      "assets/img/vocations/${character.vocation.image}",
                      height: 140,
                      width: 140),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  ),
                ],
              )),

          // weapon and ability
          const SizedBox(height: 20),
          Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const StyledHeading('Slogan'),
                  StyledText(character.slogan),
                  const SizedBox(
                    height: 10,
                  ),
                  const StyledHeading('Weapon'),
                  StyledText(character.vocation.weapon),
                  const SizedBox(
                    height: 10,
                  ),
                  const StyledHeading('Unique Ability'),
                  StyledText(character.vocation.ability),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          // stats and skills
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [StatsTable(character), SkillList(character)],
            ),
          )
          // save button
        ],
      )),
    );
  }
}