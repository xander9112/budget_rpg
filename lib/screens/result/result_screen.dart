import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/models/character.dart';
import 'package:budget_rpg/router/app_router.dart';
import 'package:budget_rpg/state/game_state.dart';
import 'package:budget_rpg/widgets/result_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameState>();
    final won = state.isWin;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Text(
                won ? '🏆 Победа!' : '💀 Поражение',
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                won
                    ? 'Ты достиг цели за ${state.day} дней!'
                    : _loseReason(state),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ResultRow('💰 Итоговые деньги', '${state.money} ₽'),
              ResultRow(
                '🎯 Цель',
                '${Character.goal} ₽ — ${won ? "достигнута ✅" : "не достигнута ❌"}',
              ),
              ResultRow('😊 Счастье', '${state.happiness}'),
              ResultRow('⚡ Энергия', '${state.energy}'),
              ResultRow('🧠 Фин. IQ', '${state.financialIQ}'),
              ResultRow('⭐ Очки', '${state.points}'),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  context.read<GameState>().resetGame();
                  context.router.replaceAll([const DashboardRoute()]);
                },
                child: const Text('Играть снова'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _loseReason(GameState s) {
    if (s.money < -20000) return 'Ты обанкротился 💸';
    if (s.happiness == 0) return 'Ты потерял всю радость жизни 😞';
    if (s.energy == 0) return 'У тебя закончились силы 😴';
    return 'Игра окончена';
  }
}
