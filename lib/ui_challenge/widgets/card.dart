import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String name, amount, code;
  final IconData icon;
  final bool isInverted;
  final int index;

  const Cards(
      {super.key,
      required this.name,
      required this.amount,
      required this.code,
      required this.icon,
      required this.isInverted,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, index * -20),
      child: Container(
        clipBehavior: Clip.hardEdge, // overflow : hidden
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isInverted ? Colors.white : const Color(0xFF1F2123),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted ? Colors.black : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? Colors.black : Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted
                              ? Colors.black
                              : Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2,
                child: Transform.translate(
                  offset: const Offset(-8, 12),
                  child: Icon(
                    icon,
                    color: isInverted ? Colors.black : Colors.white,
                    size: 98,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
