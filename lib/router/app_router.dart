import 'package:auto_route/auto_route.dart';
import 'package:budget_rpg/models/random_event.dart';
import 'package:budget_rpg/screens/actions/actions_screen.dart';
import 'package:budget_rpg/screens/dashboard/dashboard_screen.dart';
import 'package:budget_rpg/screens/event/event_screen.dart';
import 'package:budget_rpg/screens/result/result_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, initial: true),
        AutoRoute(page: ActionsRoute.page),
        AutoRoute(page: EventRoute.page),
        AutoRoute(page: ResultRoute.page),
      ];
}
