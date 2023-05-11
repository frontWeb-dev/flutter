import 'package:coin_flt/widgets/time_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        child: const Image(
                            image: NetworkImage(
                                'https://lh3.googleusercontent.com/ogw/AOLn63FlCKgV1hApYFZQJTDi4p7voJn_flVex7U5lYsp=s32-c-mo'),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover),
                      ),
                      const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("MONDAY 16",
                            style: TextStyle(color: Colors.white)),
                        const SizedBox(height: 8),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const Text(
                                'TODAY',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                '17',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                '18',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                '19',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Text(
                                '20',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: const [
                            TimeCard(
                              startHour: '11',
                              startMin: '30',
                              endHour: '12',
                              endMin: '20',
                              title: 'DESIGN\nMEETING',
                              names: ['ALEX', 'HELENA', 'NANA'],
                            ),
                            TimeCard(
                              startHour: '12',
                              startMin: '35',
                              endHour: '14',
                              endMin: '10',
                              title: 'DAILY\nPROJECT',
                              names: ['ALEX', 'HELENA', 'NANA'],
                            ),
                            TimeCard(
                              startHour: '11',
                              startMin: '30',
                              endHour: '12',
                              endMin: '20',
                              title: 'WEEKLY\nPLANNING',
                              names: ['ALEX', 'HELENA', 'NANA'],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
