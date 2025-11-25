import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto1/domain/usecases/validate_parity_usecase.dart';
import 'package:projeto1/presentation/components/page1/button_page1.dart';
import 'package:projeto1/presentation/components/page1/custom_textfield.dart';
import 'package:projeto1/presentation/components/page1/layout_circle.dart';
import 'package:projeto1/presentation/controllers/receiver_controller.dart';

class Page2 extends StatefulWidget {
  final TextEditingController par;
  final String newPar;

  const Page2({required this.par, required this.newPar, super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  var newBin = TextEditingController();
  final controller = ReceiverController(ValidateParityUseCase());
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Atividade assincrona',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          Stack(
            children: [
              LayoutCircle(),
              Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: 330,
                  height: 330,
                  child: Column(
                    children: [
                      Text("Receptor", style: TextStyle(fontSize: 20)),
                      Text("Teste os dados:", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 15),
                      CustomTextfield(
                        controller: newBin,
                        textInput: TextInputType.number,
                        labelText: "Entre com a paridade",
                        formatter: [
                          FilteringTextInputFormatter.allow(RegExp('[01]')),
                        ],
                      ),
                      SizedBox(height: 15),
                      ButtonPage1(
                        onPressed: () {
                          final result = controller.validate(
                            newBin.text,
                            widget.par.text,
                          );

                          if (result == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Digite algo válido')),
                            );
                            return;
                          }

                          if (result == 1) {
                            showDialog(
                              context: context,
                              builder: (_) => const AlertDialog(
                                title: Text('Paridade correta'),
                                content: Text('O dado recebido está certo!'),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) => const AlertDialog(
                                title: Text('Paridade incorreta'),
                                content: Text(
                                  'O dado recebido está incorreto!',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
