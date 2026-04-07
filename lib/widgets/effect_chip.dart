import 'package:budget_rpg/models/random_event.dart';
import 'package:flutter/material.dart';

class EffectChip extends StatelessWidget {
  const EffectChip(this.event, {super.key});

  final RandomEvent event;

  @override
  Widget build(BuildContext context) {
    final money = event.moneyDelta;
    final sign = money >= 0 ? '+' : '';
    final color = money >= 0 ? Colors.green : Colors.red;
    return Chip(
      label: Text('$sign$money ₽', style: TextStyle(color: color)),
    );
  }
}
