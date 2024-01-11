import 'package:flutter/material.dart';

enum TypeButton { outline, fill }

class AppButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final TypeButton _typeButton;

  const AppButton.outline({
    super.key,
    required this.title,
    required this.onTap,
  }) : _typeButton = TypeButton.outline;

  const AppButton.fill({
    super.key,
    required this.title,
    required this.onTap,
  }) : _typeButton = TypeButton.fill;

  @override
  Widget build(BuildContext context) {
    if (_typeButton == TypeButton.outline) {
      return InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Ink(
            padding: const EdgeInsets.all(4),
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
        ),
        onTap: () => onTap(),
      );
    }
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Ink(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          child: Text(title),
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
