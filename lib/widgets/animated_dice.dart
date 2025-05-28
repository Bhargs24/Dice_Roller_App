import 'package:flutter/material.dart';

class AnimatedDice extends StatelessWidget {
  final int diceNumber;
  final bool rolling;

  const AnimatedDice({
    super.key,
    required this.diceNumber,
    required this.rolling,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: rolling ? 1.15 : 1.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Center(
          child: DiceFace(number: diceNumber),
        ),
      ),
    );
  }
}

class DiceFace extends StatelessWidget {
  final int number;
  const DiceFace({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    // Simple dot layout for dice faces
    List<Widget> dots(int count) => List.generate(
      count,
      (i) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.black87,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );

    switch (number) {
      case 1:
        return Center(child: dots(1)[0]);
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.topLeft, child: dots(1)[0]),
            Align(alignment: Alignment.bottomRight, child: dots(1)[0]),
          ],
        );
      case 3:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(alignment: Alignment.topLeft, child: dots(1)[0]),
            Center(child: dots(1)[0]),
            Align(alignment: Alignment.bottomRight, child: dots(1)[0]),
          ],
        );
      case 4:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [dots(1)[0], dots(1)[0]],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [dots(1)[0], dots(1)[0]],
            ),
          ],
        );
      case 5:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [dots(1)[0], dots(1)[0]],
            ),
            Center(child: dots(1)[0]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [dots(1)[0], dots(1)[0]],
            ),
          ],
        );
      case 6:
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [dots(1)[0], dots(1)[0]],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [dots(1)[0], dots(1)[0]],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [dots(1)[0], dots(1)[0]],
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}