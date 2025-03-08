import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meus_gols_app/ui/screens/add_match.dart';
import 'package:meus_gols_app/ui/screens/get_db.dart';
import 'package:meus_gols_app/ui/screens/goals.dart';
import 'package:meus_gols_app/ui/screens/match_info.dart';
import 'package:meus_gols_app/ui/screens/matches_screen.dart';

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Goals();
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'Matches',
            path: 'matches',
            builder: (BuildContext context, GoRouterState state) {
              return const MatchesScreen();
            },
          ),
           GoRoute(
            name: 'Add Match',
            path: 'add_match',
            builder: (BuildContext context, GoRouterState state) {
              return const AddMatch();
            },
          ),
           GoRoute(
            name: 'Get db',
            path: 'get_db',
            builder: (BuildContext context, GoRouterState state) {
              return BackupDatabase();
            },
          ),
          GoRoute(
            name: 'Match Info',
            path: 'match_info/:id',
            builder: (BuildContext context, GoRouterState state) {
              final id = state.pathParameters['id'];
              return MatchInfo(id: id);
            },
          ),
        ],
      ),
    ],
  );
