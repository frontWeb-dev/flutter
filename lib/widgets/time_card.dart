import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  final String startHour, startMin, endHour, endMin, title;
  final List<String> names;

  const TimeCard(
      {super.key,
      required this.startHour,
      required this.startMin,
      required this.endHour,
      required this.endMin,
      required this.title,
      required this.names});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.amber[300]),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  startHour,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  startMin,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(
                  endHour,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  endMin,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
                Row(children: names.map((e) => Text(e)).toList())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
