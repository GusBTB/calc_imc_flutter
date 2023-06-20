import 'package:calc_imc_flutter/boxes/boxes.dart';
import 'package:calc_imc_flutter/models/imc_hive.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView.builder(
            itemCount: boxImc.length,
            itemBuilder: (context, index) {
              ImcHive imc = boxImc.getAt(index);
              return ListTile(
                title: Text("Peso: ${imc.weight} kg, Altura: ${imc.height} m"),
                subtitle: Text(imc.imc),
              );
            }));
  }
}
