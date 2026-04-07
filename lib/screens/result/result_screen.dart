import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: получить GameState через context.watch<GameState>()
    // TODO: отобразить победу/поражение (isWin) с описанием причины
    // TODO: итоговые деньги, цель, счастье, энергия, IQ, очки
    // TODO: кнопка «Играть снова» — resetGame(), затем DashboardRoute
    return const Scaffold(
      body: Center(child: Text('TODO: Result')),
    );
  }
}
