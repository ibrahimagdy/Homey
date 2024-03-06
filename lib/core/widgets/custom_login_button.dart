import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  final Widget icon;
  final String iconText;

  const CustomLoginButton(
      {super.key, required this.icon, required this.iconText});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 13),
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 27,
            ),
            Text(
              iconText,
              style: theme.textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
