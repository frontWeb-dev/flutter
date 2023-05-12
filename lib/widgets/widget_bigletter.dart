import 'package:flutter/material.dart';

class Bigletter extends StatelessWidget {
  final String string;

  const Bigletter({super.key, required this.string});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: string[0],
                  style: const TextStyle(fontSize: 32, color: Colors.black),
                ),
                TextSpan(
                  text: string.substring(1),
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
