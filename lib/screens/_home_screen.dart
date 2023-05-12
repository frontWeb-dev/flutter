import 'dart:async'; // Timer
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const times = {
    '15': 1,
    '20': 1200,
    '25': 1500,
    '30': 1800,
    '35': 2100
  };

  String setmin = '25';
  int totalSecond = 1500; // 25min
  int rest = 2; // 5min
  int totalPomodoros = 0;
  int totalRound = 0;
  bool isRunning = false;
  bool isRest = false;

  late Timer timer;

  void onTick(Timer timer) {
    // reset
    if (totalSecond == 0) {
      if (!isRest) {
        setState(() {
          totalRound = totalRound + 1;
          isRunning = false;
          totalSecond = times[setmin] as int;
        });
      } else {
        setState(() {
          isRunning = false;
          isRest = false;
          totalSecond = times[setmin] as int;
        });
      }

      if (totalRound == 4) {
        totalRound = 0;
        totalPomodoros = totalPomodoros + 1;

        setState(() {
          isRest = true;
          totalSecond = rest;
        });
      }

      timer.cancel();
    } else {
      setState(() {
        totalSecond = totalSecond - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel(); // 일시정지
    setState(() {
      isRunning = false;
    });
  }

  void onStopPressed() {
    timer.cancel();
    totalSecond = times[setmin] as int;
    setState(() {
      isRunning = false;
    });
  }

  void selectMin(e) {
    setState(() {
      setmin = e;
      totalSecond = times[setmin] as int;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds); // 0:00:00.00000
    return (duration.toString().split(".").first.substring(2)); // 00:00
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "POMOTIMER",
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3, // default
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isRest ? 'Take a Rest !' : "",
                  style: TextStyle(
                      color: Theme.of(context).cardColor, fontSize: 18),
                ),
                Text(
                  format(totalSecond),
                  style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 90,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: times.entries.map((e) {
                    var key = e.key;

                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextButton(
                        onPressed: () => selectMin(key),
                        style: TextButton.styleFrom(
                          backgroundColor: setmin == key
                              ? Theme.of(context).cardColor
                              : Theme.of(context).colorScheme.background,
                          side: BorderSide(
                              width: 2.0, color: Theme.of(context).cardColor),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: Text(
                          key,
                          style: TextStyle(
                            color: setmin == key
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context).cardColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning ? Icons.pause_circle : Icons.play_circle,
                    ),
                    iconSize: 90,
                    color: Theme.of(context).cardColor,
                  ),
                  IconButton(
                    onPressed: onStopPressed,
                    icon: const Icon(
                      Icons.stop_circle,
                    ),
                    iconSize: 90,
                    color: Theme.of(context).cardColor,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$totalRound / 4",
                              style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).cardColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "ROUND",
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).cardColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$totalPomodoros / 12",
                              style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).cardColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "GOAL",
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).cardColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), // UI를 비율에 기반해서 유연하게 만들어줌
        ],
      ),
    );
  }
}
