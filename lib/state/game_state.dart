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

  Character get character => _char;
  RandomEvent? get pendingEvent => _pendingEvent;

  int get money => _char.money;
  int get happiness => _char.happiness;
  int get energy => _char.energy;
  int get financialIQ => _char.financialIQ;
  int get day => _char.day;
  int get points => _char.points;

  bool get isWin => _char.isWin;
  bool get isLose => _char.isLose;
  bool get isGameOver => isWin || isLose;

  // ---------------------------------------------------------------------------
  // TODO: Реализовать методы изменения состояния
  // ---------------------------------------------------------------------------

  /// Бросает «кубик» на случайное событие в начале нового дня.
  /// Вероятность события — 30%. Возвращает событие или null.
  /// После изменения вызвать notifyListeners().
  RandomEvent? rollRandomEvent() {
    // TODO: реализовать
    throw UnimplementedError();
  }

  /// Применяет эффекты случайного [event] к персонажу.
  /// Использовать _char.applyDeltas(...). Сбросить _pendingEvent.
  void applyEvent(RandomEvent event) {
    // TODO: реализовать
    throw UnimplementedError();
  }

  /// Применяет выбранное игроком [action] к персонажу.
  /// Использовать _char.applyAction(action).
  /// Бонус: +5 очков если баланс после действия остался положительным.
  void applyAction(GameAction action) {
    // TODO: реализовать
    throw UnimplementedError();
  }

  /// Сбрасывает игру в начальное состояние.
  void resetGame() {
    // TODO: реализовать
    throw UnimplementedError();
  }
}
