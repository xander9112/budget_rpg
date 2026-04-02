import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/data/actions_data.dart';
import 'package:budget_rpg/models/game_action.dart';
import 'package:budget_rpg/router/app_router.dart';
import 'package:budget_rpg/state/game_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  static const _categoryLabels = {
    ActionCategory.basic: 'Базовые',
    ActionCategory.financial: 'Финансы',
    ActionCategory.work: 'Работа',
    ActionCategory.rest: 'Отдых',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выбери действие')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: ActionCategory.values.map((cat) {
          final actions =
              kAllActions.where((a) => a.category == cat).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Text(_categoryLabels[cat]!,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              ...actions.map((a) => _ActionCard(action: a)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({required this.action});
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
