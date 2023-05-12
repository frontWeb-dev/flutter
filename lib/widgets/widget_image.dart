import 'package:flutter/material.dart';

class WebtoonImage extends StatelessWidget {
  final String thumb;

  const WebtoonImage({super.key, required this.thumb});

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
        width: 200,
        child: Image.network(thumb));
  }
}
