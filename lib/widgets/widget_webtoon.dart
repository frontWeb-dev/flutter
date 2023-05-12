import '../screens/detail_screen.dart';
import 'widget_image.dart';
import 'package:flutter/material.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (
              context,
            ) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            // fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: WebtoonImage(
              thumb: thumb,
              large: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'SCDream',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
