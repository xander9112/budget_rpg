import 'package:budget_rpg/models/game_action.dart';
import 'package:flutter/material.dart';

class UiActionCard extends StatelessWidget {
  const UiActionCard({super.key, required this.action});

  final GameAction action;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(action.name),
        subtitle: Text(_buildEffectText()),
        trailing: FilledButton.tonal(
          // onPressed: () => _onSelect(context),
          onPressed: () {},
          child: const Text('Выбрать'),
        ),
      ),
    );
  }

  String _buildEffectText() {
    final parts = <String>[];

    if (action.moneyDelta != 0) parts.add('${_signed(action.moneyDelta)} ₽');
    if (action.happinessDelta != 0) parts.add(_signed(action.happinessDelta));
    if (action.energyDelta != 0) parts.add(_signed(action.energyDelta));
    if (action.financialIQDelta != 0)
      parts.add(_signed(action.financialIQDelta));
    return parts.join('  ');
  }

  String _signed(int v) => v >= 0 ? '+$v' : '$v';
}
