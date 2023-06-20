import 'package:calc_imc_flutter/models/history.dart';
import 'package:calc_imc_flutter/pages/components/calculate.dart';
import 'package:calc_imc_flutter/pages/components/history.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HistoryRepository his = HistoryRepository();
  PageController pageController = PageController(initialPage: 0);
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Calculadora IMC"),
            backgroundColor: const Color.fromARGB(255, 102, 0, 204),
          ),
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height - 80),
                child: Column(
                  children: [
                    Expanded(
                        child: PageView(
                      controller: pageController,
                      onPageChanged: (value) {
                        setState(() {
                          page = value;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                      children: const [Calculate(), History()],
                    )),
                    BottomNavigationBar(
                        onTap: (value) {
                          pageController.jumpToPage(value);
                        },
                        currentIndex: page,
                        items: const [
                          //controlar current index conforme pages mudam
                          BottomNavigationBarItem(
                              label: "Home", icon: Icon(Icons.home)),
                          BottomNavigationBarItem(
                              label: "Historico", icon: Icon(Icons.history)),
                        ])
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
