import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/models/random_event.dart';
import 'package:budget_rpg/router/app_router.dart';
import 'package:budget_rpg/state/game_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EventScreen extends StatelessWidget {
  const EventScreen({super.key, required this.event});

  final RandomEvent event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Событие')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(event.title,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text(event.description),
            const SizedBox(height: 8),
            _EffectChip(event),
            const Spacer(),
            FilledButton(
              onPressed: () {
                context.read<GameState>().applyEvent(event);
                context.router.replace(const ActionsRoute());
              },
              child: const Text('Принять и продолжить'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EffectChip extends StatelessWidget {
  const _EffectChip(this.event);
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
