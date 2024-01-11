import 'package:flutter/material.dart';

enum TypeButton { outline, fill }

class AppButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final TypeButton typeButton;

  const AppButton.outline({
    super.key,
    required this.title,
    required this.onTap,
    this.typeButton = TypeButton.outline,
  });

  const AppButton.fill({
    super.key,
    required this.title,
    required this.onTap,
    this.typeButton = TypeButton.fill,
  });

  @override
  Widget build(BuildContext context) {
    if (typeButton == TypeButton.outline) {
      return InkWell(
        child: Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          child: Text(title),
        ),
        onTap: () => onTap(),
      );
    }
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Text(title),
      ),
      onTap: () => onTap(),
    );
  }
}
