import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/data/actions_data.dart';
import 'package:budget_rpg/models/game_action.dart';
import 'package:budget_rpg/widgets/action_card.dart';
import 'package:flutter/material.dart';

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
              ...actions.map((a) => ActionCard(action: a)),
            ],
          );
        }).toList(),
      ),
    );
  }
}
