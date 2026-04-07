import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/models/random_event.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EventScreen extends StatelessWidget {
  const EventScreen({super.key, required this.event});

  final RandomEvent event;

  @override
  Widget build(BuildContext context) {
    // TODO: отобразить event.title, event.description
    // TODO: показать эффект события (moneyDelta) с цветом: зелёный/красный
    // TODO: кнопка «Принять и продолжить» — applyEvent(event), затем ActionsRoute
    return Scaffold(
      appBar: AppBar(title: const Text('Событие')),
      body: Center(child: Text('TODO: Event — ${event.title}')),
    );
  }
}
