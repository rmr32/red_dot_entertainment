import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:red_dot_entertainment/utils/constants/colors.dart';

class ECardGlass extends StatelessWidget {
  const ECardGlass({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              opacity: 0.025,
              image: NetworkImage(
                  'https://img.freepik.com/free-photo/glass-background-with-frosted-pattern_53876-132924.jpg?size=626&ext=jpg&ga=GA1.1.553209589.1714435200&semt=ais'),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 25,
                  spreadRadius: -5),
            ],
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white60,
                  Colors.white10,
                ]),
            color: EColors.secondary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
            border:
                Border.all(width: 2, color: Colors.white30.withOpacity(0.05)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
