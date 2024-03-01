import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String ansText;
  final void Function() onTap;

  const OptionButton({
    super.key,
    required this.ansText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      child: Text(
        ansText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
