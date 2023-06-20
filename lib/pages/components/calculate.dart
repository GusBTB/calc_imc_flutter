import 'dart:math';

import 'package:calc_imc_flutter/boxes/boxes.dart';
import 'package:calc_imc_flutter/models/history.dart';
import 'package:calc_imc_flutter/models/imc.dart';
import 'package:calc_imc_flutter/models/imc_hive.dart';
import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  TextEditingController weigthController = TextEditingController(text: "");
  TextEditingController heightController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text("Calcule seu IMC", style: TextStyle(fontSize: 25)),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(child: Container()),
            Expanded(
                flex: 8,
                child: TextField(
                  controller: weigthController,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 102, 0, 204))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 102, 0, 204))),
                    hintText: "Digite seu peso",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                )),
            Expanded(child: Container()),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(child: Container()),
            Expanded(
                flex: 8,
                child: TextField(
                  controller: heightController,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 102, 0, 204))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 102, 0, 204))),
                    hintText: "Digite sua altura",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                )),
            Expanded(child: Container()),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () {
            debugPrint(weigthController.text);
            debugPrint(heightController.text);
            if (weigthController.text == "" ||
                heightController.text == "" ||
                weigthController.text == "0" ||
                heightController.text == "0") {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Digite o peso e altura para calcular")));
            } else {
              var weight = double.parse(weigthController.text);
              var height =
                  double.parse(heightController.text.replaceAll(",", "."));

              var imc = Imc(weight, height);

              String result = imc.calculateImc();

              Random rand = Random();

              int random = rand.nextInt(1000000);

              boxImc.put(
                  random, ImcHive(weight: weight, height: height, imc: result));

              // widget.his.addImc(result);

              FocusManager.instance.primaryFocus?.unfocus();
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    height: 200,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Seu IMC é',
                          style: TextStyle(fontSize: 25),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          result,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(flex: 2, child: Container()),
                            Expanded(
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 102, 0, 204))),
                                child: const Text('Fechar'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 102, 0, 204))),
          child: const Text('Calcular'), // <-- Text
        ),
      ],
    );
  }
}
