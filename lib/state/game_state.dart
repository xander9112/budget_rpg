import 'dart:math';

import 'package:budget_rpg/data/events_data.dart';
import 'package:budget_rpg/models/character.dart';
import 'package:budget_rpg/models/game_action.dart';
import 'package:budget_rpg/models/random_event.dart';
import 'package:flutter/foundation.dart';

/// Центральное хранилище состояния игры (ChangeNotifier / Provider-паттерн).
///
/// Хранит текущего персонажа [_char] и ожидающее случайное событие
/// [_pendingEvent]. Все изменения состояния проходят через методы этого
/// класса; после каждого изменения вызывается [notifyListeners], что
/// заставляет виджеты-подписчики перестроиться.
class GameState extends ChangeNotifier {
  GameState() : _char = Character.initial();

  Character _char;
  RandomEvent? _pendingEvent;

  // ---------------------------------------------------------------------------
  // Getters
  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  // Getters — читаемые снаружи поля без прямого доступа к приватным полям
  // ---------------------------------------------------------------------------

  /// Полный объект персонажа (используется там, где нужно передать всё сразу).
  Character get character => _char;

  /// Текущее нерешённое событие; виджеты проверяют это поле, чтобы показать экран события.
  RandomEvent? get pendingEvent => _pendingEvent;

  /// Текущий баланс персонажа в рублях.
  int get money => _char.money;

  /// Уровень счастья (0–100). При 0 — проигрыш.
  int get happiness => _char.happiness;

  /// Уровень энергии (0–100). При 0 — проигрыш.
  int get energy => _char.energy;

  /// Финансовый IQ персонажа (0–100). Влияет на эффективность финансовых действий.
  int get financialIQ => _char.financialIQ;

  /// Текущий игровой день (1–30).
  int get day => _char.day;

  /// Накопленные RPG-очки за финансово грамотные решения.
  int get points => _char.points;

  /// true, если выполнено условие победы: day >= 30 AND money >= 100 000.
  bool get isWin => _char.isWin;

  /// true, если выполнено условие поражения: money < −20 000, happiness == 0 или energy == 0.
  bool get isLose => _char.isLose;

  /// true, если игра завершена (победа или поражение).
  bool get isGameOver => isWin || isLose;

  final _rng = Random();

  // ---------------------------------------------------------------------------

  /// Бросает «кубик» на случайное событие в начале нового дня.
  /// Вероятность события — 30%. Возвращает событие или null.
  /// После изменения вызвать notifyListeners().
  RandomEvent? rollRandomEvent() {
    if (_rng.nextDouble() < 0.30) {
      _pendingEvent = kAllEvents[_rng.nextInt(kAllEvents.length)];
    } else {
      _pendingEvent = null;
    }

    notifyListeners();

    return _pendingEvent;
  }

  /// Применяет эффекты случайного [event] к персонажу.
  /// Использовать _char.applyDeltas(...). Сбросить _pendingEvent.
  void applyEvent(RandomEvent event) {
    _char = _char.applyDeltas(
      moneyDelta: event.moneyDelta,
      happinessDelta: event.happinessDelta,
      energyDelta: event.energyDelta,
    );

    _pendingEvent = null;

    notifyListeners();
  }

  /// Применяет выбранное игроком [action] к персонажу.
  /// Использовать _char.applyAction(action).
  /// Бонус: +5 очков если баланс после действия остался положительным.
  void applyAction(GameAction action) {
    _char = _char.applyAction(action);

    // Положительный баланс после действия — +5 очков
    if (_char.money > 0) {
      _char = _char.copyWith(points: _char.points + 5);
    }

    notifyListeners();
  }

  /// Сбрасывает игру в начальное состояние.
  void resetGame() {
    _char = Character.initial();
    _pendingEvent = null;

    notifyListeners();
  }
}
