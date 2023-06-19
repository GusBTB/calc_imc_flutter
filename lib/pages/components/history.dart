import 'package:calc_imc_flutter/models/history.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key, required this.his});
  final HistoryRepository his;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: ListView(
          children: widget.his
              .listHistory()
              .map((h) => ListTile(
                    title: Text(h),
                  ))
              .toList()),
    );
  }
}
