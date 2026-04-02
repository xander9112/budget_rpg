class RandomEvent {
  const RandomEvent({
    required this.id,
    required this.title,
    required this.description,
    this.moneyDelta = 0,
    this.happinessDelta = 0,
    this.energyDelta = 0,
  });

  final String id;
  final String title;
  final String description;
  final int moneyDelta;
  final int happinessDelta;
  final int energyDelta;
}
