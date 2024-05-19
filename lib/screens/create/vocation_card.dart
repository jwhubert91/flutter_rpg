import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class VocationCard extends StatelessWidget {
  const VocationCard(
      {super.key,
      required this.vocation,
      required this.selected,
      required this.onTap});

  final Vocation vocation;
  final void Function(Vocation) onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(vocation);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            color: selected ? AppColors.primaryColor : Colors.transparent,
            width: selected ? 2.0 : 0,
          ),
        ),
        color: selected ? AppColors.secondaryColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              // vocation image
              Image.asset(
                "assets/img/vocations/${vocation.image}",
                width: 80,
                colorBlendMode: BlendMode.color,
                color: !selected
                    ? Colors.black.withOpacity(0.8)
                    : Colors.transparent,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeading(vocation.title),
                  StyledText(vocation.description),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
