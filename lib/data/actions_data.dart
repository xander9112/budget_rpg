import 'package:budget_rpg/models/game_action.dart';

const List<GameAction> kAllActions = [
  // --- Базовые ---
  GameAction(
    id: 'coffee',
    name: 'Купить кофе',
    category: ActionCategory.basic,
    moneyDelta: -300,
    happinessDelta: 3,
  ),
  GameAction(
    id: 'cafe',
    name: 'Сходить в кафе',
    category: ActionCategory.basic,
    moneyDelta: -1200,
    happinessDelta: 7,
  ),
  GameAction(
    id: 'clothes',
    name: 'Купить одежду',
    category: ActionCategory.basic,
    moneyDelta: -4000,
    happinessDelta: 10,
  ),

  // --- Финансовые ---
  GameAction(
    id: 'savings',
    name: 'Положить деньги в накопления',
    category: ActionCategory.financial,
    moneyDelta: -5000,
    points: 10,
    tip: 'Подушка безопасности должна покрывать 3–6 месяцев расходов.',
  ),
  GameAction(
    id: 'invest',
    name: 'Инвестировать',
    category: ActionCategory.financial,
    moneyDelta: -10000,
    financialIQDelta: 5,
    points: 15,
    tip: 'Диверсификация снижает инвестиционный риск.',
  ),
  GameAction(
    id: 'course',
    name: 'Пройти курс по финансам',
    category: ActionCategory.financial,
    moneyDelta: -2000,
    financialIQDelta: 10,
    points: 20,
    tip: 'Высокая кредитная нагрузка ухудшает финансовую устойчивость.',
  ),

  // --- Работа ---
  GameAction(
    id: 'work',
    name: 'Работать',
    category: ActionCategory.work,
    moneyDelta: 3000,
    energyDelta: -10,
  ),
  GameAction(
    id: 'freelance',
    name: 'Фриланс',
    category: ActionCategory.work,
    moneyDelta: 2000,
    energyDelta: -5,
  ),

  // --- Отдых ---
  GameAction(
    id: 'sport',
    name: 'Спорт',
    category: ActionCategory.rest,
    energyDelta: -5,
    happinessDelta: 6,
  ),
  GameAction(
    id: 'sleep',
    name: 'Сон',
    category: ActionCategory.rest,
    energyDelta: 15,
  ),
];
