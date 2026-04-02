enum ActionCategory { basic, financial, work, rest }

class GameAction {
  const GameAction({
    required this.id,
    required this.name,
    required this.category,
    this.moneyDelta = 0,
    this.happinessDelta = 0,
    this.energyDelta = 0,
    this.financialIQDelta = 0,
    this.points = 0,
    this.tip,
  });

  final String id;
  final String name;
  final ActionCategory category;
  final int moneyDelta;
  final int happinessDelta;
  final int energyDelta;
  final int financialIQDelta;
  final int points;
  final String? tip;
}
