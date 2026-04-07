import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/models/game_action.dart';
import 'package:budget_rpg/router/app_router.dart';
import 'package:budget_rpg/state/game_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionCard extends StatelessWidget {
  const ActionCard({super.key, required this.action});

  final GameAction action;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text(action.name),
        subtitle: Text(_buildEffectText(action)),
        trailing: FilledButton.tonal(
          onPressed: () => _onSelect(context),
          child: const Text('Выбрать'),
        ),
      ),
    );
  }

  String _buildEffectText(GameAction a) {
    final parts = <String>[];
    if (a.moneyDelta != 0) parts.add('💰 ${_signed(a.moneyDelta)} ₽');
    if (a.happinessDelta != 0) parts.add('😊 ${_signed(a.happinessDelta)}');
    if (a.energyDelta != 0) parts.add('⚡ ${_signed(a.energyDelta)}');
    if (a.financialIQDelta != 0) parts.add('🧠 ${_signed(a.financialIQDelta)}');
    return parts.join('  ');
  }

  String _signed(int v) => v >= 0 ? '+$v' : '$v';

  void _onSelect(BuildContext context) {
    final state = context.read<GameState>();
    state.applyAction(action);

    if (state.isGameOver) {
      context.router.replaceAll([const ResultRoute()]);
    } else {
      context.router.replaceAll([const DashboardRoute()]);
    }

    if (action.tip != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('💡 ${action.tip}')),
      );
    }
  }
}
