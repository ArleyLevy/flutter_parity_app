import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto1/domain/usecases/calculate_parity_usecase.dart';
import 'package:projeto1/presentation/components/page1/button_page1.dart';
import 'package:projeto1/presentation/components/page1/custom_alert.dart';
import 'package:projeto1/presentation/components/page1/custom_textfield.dart';
import 'package:projeto1/presentation/components/page1/layout_circle.dart';
import 'package:projeto1/presentation/controllers/parity_controller.dart';
import 'page2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

int teste = 0;

class _Page1State extends State<Page1> {
  int currentPageIndex = 0;
  final controller = ParityController(CalculateParityUseCase());
  var bin = TextEditingController();
  var par = TextEditingController();
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
              Positioned(
                bottom: 15,
                right: 15,
                child: FloatingActionButton(
                  child: Icon(FontAwesomeIcons.gear),
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => CustomAlert(),
                    );
                  },
                ),
              ),
              LayoutCircle(),
              Center(
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: 330,
                  height: 330,
                  child: Column(
                    children: [
                      Text("Trasmissor", style: TextStyle(fontSize: 20)),
                      Text(
                        "Digite os dados abaixo:",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 15),
                      CustomTextfield(
                        controller: bin,
                        labelText: "Entre com a paridade",
                        formatter: [
                          FilteringTextInputFormatter.allow(RegExp('[01]')),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Digite a paridade desejada:",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 15),
                      CustomTextfield(
                        controller: par,
                        labelText: "Paridade desejada",
                      ),
                      SizedBox(height: 15),
                      ButtonPage1(
                        onPressed: () {
                          final newPar = controller.calculate(
                            bin.text,
                            par.text,
                          );

                          if (newPar == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Digite "Par" ou "Impar" corretamente!',
                                ),
                              ),
                            );
                            return;
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Page2(newPar: newPar, par: par),
                            ),
                          );
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
