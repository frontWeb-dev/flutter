import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const times = {
    '15': 900,
    '20': 1200,
    '25': 1500,
    '30': 1800,
    '35': 2100
  };

  late Timer timer;
  String setmin = '25';
  int totalSecond = 1500; // 25min
  int rest = 300; // 5min

  int totalPomodoros = 0;
  int totalRound = 0;

  bool isRunning = false;
  bool isRest = false;

  void onTick(Timer timer) {
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

        // reset
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
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

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
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isRest ? 'Take a Rest !' : "",
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
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
                              onPressed: () => selectMin(time.key),
                              style: TextButton.styleFrom(
                                backgroundColor: setmin == time.key
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.background,
                                side: BorderSide(
                                    width: 2.0,
                                    color: Theme.of(context).cardColor),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                              ),
                              child: Text(
                                time.key,
                                style: TextStyle(
                                  color: setmin == time.key
                                      ? Theme.of(context).colorScheme.background
                                      : Theme.of(context).cardColor,
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
                  iconSize: 100,
                  icon: Icon(
                    isRunning ? Icons.pause_circle : Icons.play_circle,
                  ),
                  color: Colors.white,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
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
                            "$totalRound / 4",
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
                            "$totalPomodoros / 12",
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
