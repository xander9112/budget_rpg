import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/models/character.dart';
import 'package:budget_rpg/router/app_router.dart';
import 'package:budget_rpg/state/game_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Budget RPG')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('День ${state.day} / 30',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            _StatRow('💰 Деньги', '${state.money} ₽'),
            _StatRow('🎯 Цель', '${Character.goal} ₽'),
            _StatRow('😊 Счастье', '${state.happiness} / 100'),
            _StatRow('⚡ Энергия', '${state.energy} / 100'),
            _StatRow('🧠 Фин. IQ', '${state.financialIQ} / 100'),
            _StatRow('⭐ Очки', '${state.points}'),
            const Spacer(),
            FilledButton(
              onPressed: () => _onNextDay(context, state),
              child: const Text('Следующий день'),
            ),
          ],
        ),
      ),
    );
  }

  void _onNextDay(BuildContext context, GameState state) {
    final event = state.rollRandomEvent();
    if (event != null) {
      context.router.push(EventRoute(event: event));
    } else {
      context.router.push(const ActionsRoute());
    }
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
