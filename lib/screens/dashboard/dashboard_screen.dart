import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: получить GameState через context.watch<GameState>()
    // TODO: отобразить день, деньги, цель, счастье, энергию, IQ, очки
    // TODO: кнопка «Следующий день» — rollRandomEvent() → EventRoute или ActionsRoute
    return Scaffold(
      appBar: AppBar(title: const Text('Budget RPG')),
      body: const Center(child: Text('TODO: Dashboard')),
    );
  }
}
