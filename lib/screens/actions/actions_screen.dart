import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: вывести список действий из kAllActions, сгруппированных по категории
    // TODO: карточка действия — название, эффекты (деньги/счастье/энергия/IQ)
    // TODO: кнопка «Выбрать» — applyAction(), затем ResultRoute или DashboardRoute
    return Scaffold(
      appBar: AppBar(title: const Text('Выбери действие')),
      body: const Center(child: Text('TODO: Actions')),
    );
  }
}
