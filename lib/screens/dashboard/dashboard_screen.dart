import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/models/character.dart';
import 'package:budget_rpg/router/app_router.dart';
import 'package:budget_rpg/state/game_state.dart';
import 'package:budget_rpg/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameState>();

    // TODO: кнопка «Следующий день» — rollRandomEvent() → EventRoute или ActionsRoute

    return Scaffold(
      appBar: AppBar(title: const Text('Budget RPG')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Text(
                'День: ${state.day} / 30',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),

            UiInfoRow(title: 'Деньги', value: '${state.money}'),
            UiInfoRow(title: 'Цель', value: '${Character.goal}'),
            UiInfoRow(title: 'Счастье', value: '${state.happiness}'),
            UiInfoRow(title: 'энергию', value: '${state.energy}'),
            UiInfoRow(title: 'IQ', value: '${state.financialIQ}'),
            UiInfoRow(title: 'Очки', value: '${state.points}'),
            Spacer(),
            ElevatedButton(
              onPressed: () => _onPressed(context, state),
              child: Text('Следующий день'),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressed(BuildContext context, GameState state) {
    final event = state.rollRandomEvent();

    if (event != null) {
      context.replaceRoute(EventRoute(event: event));
    } else {
      context.replaceRoute(ActionsRoute());
    }
  }
}
