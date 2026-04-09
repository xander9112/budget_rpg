import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/data/actions_data.dart';
import 'package:budget_rpg/models/game_action.dart';
import 'package:budget_rpg/widgets/_widgets.dart';
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
    // TODO: вывести список действий из kAllActions, сгруппированных по категории
    // TODO: карточка действия — название, эффекты (деньги/счастье/энергия/IQ)
    // TODO: кнопка «Выбрать» — applyAction(), затем ResultRoute или DashboardRoute
    return Scaffold(
      appBar: AppBar(title: const Text('Выбери действие')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _categoryLabels.entries.map((e) {
            final actions = kAllActions.where(
              (element) => element.category == e.key,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    e.value,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                ...actions.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: UiActionCard(action: e),
                  );
                }),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  // void _onSelect(BuildContext context) {
  //   final state = context.read<GameState>();
  //   state.applyAction(action);

  //   if (state.isGameOver) {
  //     context.router.replaceAll([const ResultRoute()]);
  //   } else {
  //     context.router.replaceAll([const DashboardRoute()]);
  //   }

  //   if (action.tip != null) {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('💡 ${action.tip}')));
  //   }
  // }
}
