import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';
import 'package:meus_gols_app/infra/repository/match_repository_impl.dart';
import 'package:meus_gols_app/routes.dart';
import 'package:provider/provider.dart';

import 'data/provider_service/match_provider.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MatchProvider(MatchUseCase(MatchRepositoryImpl())),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
          ),
        ),
        routerConfig: router,
      ),
    ),
  );
}
