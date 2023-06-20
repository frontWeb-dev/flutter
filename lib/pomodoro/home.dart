import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer timer;
  static const times = {
    '15': 1,
    '20': 1200,
    '25': 1500,
    '30': 1800,
    '35': 2100
  };

  String setmin = '25';
  int totalSecond = 1500; // 25min

  void onTick(Timer timer) {
    setState(() {
      totalSecond = totalSecond - 1;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  String formatMin(int seconds) {
    var duration = Duration(seconds: seconds); // 0:00:00.00000
    return (duration.toString().split(".").first.substring(2, 4)); // 00:00
  }

  String formatSec(int seconds) {
    var duration = Duration(seconds: seconds); // 0:00:00.00000
    return (duration.toString().split(".").first.substring(5)); // 00:00
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              'Pomodoros',
              style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 20,
                  letterSpacing: -0.5,
                  fontWeight: FontWeight.w600),
            ),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            formatMin(totalSecond),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 48,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          ':',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 48,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            formatSec(totalSecond),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 48,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: times.entries.map((time) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                side: BorderSide(
                                    width: 2.0,
                                    color: Theme.of(context).cardColor),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                              ),
                              child: Text(
                                time.key,
                                style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: IconButton(
                  iconSize: 120,
                  icon: const Icon(Icons.play_circle_outline),
                  color: Colors.white,
                  onPressed: onStartPressed,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0 / 4',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'ROUND',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0 / 12',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'GOAL',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
