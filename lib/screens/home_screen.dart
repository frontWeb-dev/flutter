import 'dart:async'; // Timer
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSecond = 1500; // 25min
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      totalSecond = totalSecond - 1;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1, // default
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "$totalSecond",
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 90,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: IconButton(
                onPressed: onStartPressed,
                icon: const Icon(
                  Icons.play_circle_outline,
                ),
                iconSize: 120,
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pomodoros",
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: 60,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ), // UI를 비율에 기반해서 유연하게 만들어줌
        ],
      ),
    );
  }
}
