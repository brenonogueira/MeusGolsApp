import 'package:flutter/material.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';
import 'package:meus_gols_app/infra/repository/match_repository_impl.dart';
import 'package:meus_gols_app/routes.dart';
import 'package:provider/provider.dart';

import 'data/provider_service/match_provider.dart';

void main() {
  runApp(
 MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MatchProvider(MatchUseCase(MatchRepositoryImpl())), // Instancie o MatchProvider e passe o MatchUseCase como argumento
        ),
      ],
      child: Routes(),
    ),

  );
}
