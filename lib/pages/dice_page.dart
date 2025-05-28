import 'package:flutter/material.dart';
import '../widgets/animated_dice.dart';
import '../widgets/gradient_container.dart';
import '../utils/dice_roller.dart';

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;
  bool rolling = false;

  void rollDice() async {
    if (rolling) return;
    setState(() => rolling = true);

    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 60));
      setState(() {
        leftDice = DiceRoller.roll();
        rightDice = DiceRoller.roll();
      });
    }

    setState(() => rolling = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white.withOpacity(0.85)),
      ),
      body: GradientContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedDice(
                    diceNumber: leftDice,
                    rolling: rolling,
                  ),
                  const SizedBox(width: 24),
                  AnimatedDice(
                    diceNumber: rightDice,
                    rolling: rolling,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF198D61),
                  padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  elevation: 8,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                onPressed: rolling ? null : rollDice,
                child: Text(rolling ? 'Rolling...' : 'Roll'),
              ),
              const SizedBox(height: 24),
              if (!rolling)
                Text(
                  'Result: ${leftDice + rightDice}',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}