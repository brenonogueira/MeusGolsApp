import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meus_gols_app/ui/goals/goals.dart';
import 'package:meus_gols_app/ui/matches_screen.dart';

class Routes extends StatelessWidget {
  Routes({super.key});

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Goals();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'matches',
          builder: (BuildContext context, GoRouterState state) {
            return const MatchesScreen();
          },
        ),
      ],
    ),
  ],
);


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}