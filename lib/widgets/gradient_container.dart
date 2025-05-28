import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final Alignment begin;
  final Alignment end;
  final List<Color> colors;

  const GradientContainer({
    super.key,
    required this.child,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.colors = const [
      Color(0xFF198D61),
      Color(0xFF1F5F8A),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: begin,
          end: end,
        ),
      ),
      child: child,
    );
  }
}