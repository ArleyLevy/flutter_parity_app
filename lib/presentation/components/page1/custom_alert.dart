import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Informações do app'),
      content: const Text(
        'Versão:  alpha 1.0\n\nFeito por Levy Castro e Helberte',
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
