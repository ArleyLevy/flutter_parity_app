import 'package:flutter/material.dart';

class ButtonPage1 extends StatefulWidget {
  const ButtonPage1({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  State<ButtonPage1> createState() => _ButtonPage1State();
}

class _ButtonPage1State extends State<ButtonPage1> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStateProperty.all(Colors.green),
        elevation: WidgetStateProperty.all(6),
        fixedSize: WidgetStateProperty.all(Size.fromWidth(330)),
        overlayColor: WidgetStateProperty.all(Colors.blue),
      ),
      onPressed: widget.onPressed,
      child: Text("Confirmar"),
    );
  }
}
