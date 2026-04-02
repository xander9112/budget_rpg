// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ActionsScreen]
class ActionsRoute extends PageRouteInfo<void> {
  const ActionsRoute({List<PageRouteInfo>? children})
    : super(ActionsRoute.name, initialChildren: children);

  static const String name = 'ActionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ActionsScreen();
    },
  );
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
}

/// generated route for
/// [EventScreen]
class EventRoute extends PageRouteInfo<EventRouteArgs> {
  EventRoute({
    Key? key,
    required RandomEvent event,
    List<PageRouteInfo>? children,
  }) : super(
         EventRoute.name,
         args: EventRouteArgs(key: key, event: event),
         initialChildren: children,
       );

  static const String name = 'EventRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventRouteArgs>();
      return EventScreen(key: args.key, event: args.event);
    },
  );
}

class EventRouteArgs {
  const EventRouteArgs({this.key, required this.event});

  final Key? key;

  final RandomEvent event;

  @override
  String toString() {
    return 'EventRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [ResultScreen]
class ResultRoute extends PageRouteInfo<void> {
  const ResultRoute({List<PageRouteInfo>? children})
    : super(ResultRoute.name, initialChildren: children);

  static const String name = 'ResultRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResultScreen();
    },
  );
}
