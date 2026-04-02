import 'package:budget_rpg/models/game_action.dart';

class Character {
  const Character({
    required this.money,
    required this.happiness,
    required this.energy,
    required this.financialIQ,
    required this.day,
    required this.points,
  });

  factory Character.initial() => const Character(
        money: 50000,
        happiness: 60,
        energy: 70,
        financialIQ: 20,
        day: 1,
        points: 0,
      );

  static const int goal = 100000;

  final int money;
  final int happiness;
  final int energy;
  final int financialIQ;
  final int day;
  final int points;

  Character copyWith({
    int? money,
    int? happiness,
    int? energy,
    int? financialIQ,
    int? day,
    int? points,
  }) {
    return Character(
      money: money ?? this.money,
      happiness: happiness ?? this.happiness,
      energy: energy ?? this.energy,
      financialIQ: financialIQ ?? this.financialIQ,
      day: day ?? this.day,
      points: points ?? this.points,
    );
  }

  Character applyAction(GameAction action) {
    return copyWith(
      money: money + action.moneyDelta,
      happiness: (happiness + action.happinessDelta).clamp(0, 100),
      energy: (energy + action.energyDelta).clamp(0, 100),
      financialIQ: (financialIQ + action.financialIQDelta).clamp(0, 100),
      day: day + 1,
      points: points + action.points,
    );
  }

  Character applyDeltas({
    int moneyDelta = 0,
    int happinessDelta = 0,
    int energyDelta = 0,
  }) {
    return copyWith(
      money: money + moneyDelta,
      happiness: (happiness + happinessDelta).clamp(0, 100),
      energy: (energy + energyDelta).clamp(0, 100),
    );
  }

  bool get isWin => day >= 30 && money >= goal;
  bool get isLose =>
      money < -20000 || happiness == 0 || energy == 0;
}
