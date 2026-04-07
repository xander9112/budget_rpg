import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/models/character.dart';
import 'package:budget_rpg/router/app_router.dart';
import 'package:budget_rpg/state/game_state.dart';
import 'package:budget_rpg/widgets/stat_row.dart';
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
            StatRow('💰 Деньги', '${state.money} ₽'),
            StatRow('🎯 Цель', '${Character.goal} ₽'),
            StatRow('😊 Счастье', '${state.happiness} / 100'),
            StatRow('⚡ Энергия', '${state.energy} / 100'),
            StatRow('🧠 Фин. IQ', '${state.financialIQ} / 100'),
            StatRow('⭐ Очки', '${state.points}'),
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
