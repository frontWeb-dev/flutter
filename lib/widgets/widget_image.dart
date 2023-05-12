import 'package:flutter/material.dart';

class WebtoonImage extends StatelessWidget {
  final String thumb;
  final bool large;

  const WebtoonImage({super.key, required this.thumb, required this.large});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          offset: const Offset(2, 2),
          color: Colors.black.withOpacity(0.5),
          blurRadius: 10,
        )
      ]),
      width: large ? 250 : 200,
      child: Image(image: NetworkImage(thumb)),
    );
  }
}
