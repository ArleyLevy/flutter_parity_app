import 'package:flutter/material.dart';

class LayoutCircle extends StatelessWidget {
  const LayoutCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -50,
          right: -30,
          child: Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 115, 192, 255),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: -50,
          right: -20,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          left: -30,
          child: Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 115, 192, 255),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          left: -20,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
