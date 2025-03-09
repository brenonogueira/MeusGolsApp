import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';
import 'package:meus_gols_app/data/provider_service/match_provider.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';
import 'package:meus_gols_app/infra/repository/match_repository_impl.dart';
import 'package:meus_gols_app/ui/components/button_widget.dart';
import 'package:provider/provider.dart';

class AddMatch extends StatefulWidget {
  const AddMatch({super.key});

  @override
  State<AddMatch> createState() => _AddMatchState();
}

class _AddMatchState extends State<AddMatch> {
  final formKey = GlobalKey<FormState>();
  String futDescription = '';
  int goals = 0;
  String dateFut = '';

  final MatchRepository _matchRepository = MatchRepositoryImpl();
  late final MatchUseCase _matchUseCase;

  TextEditingController futDescriptionTextEditingController = TextEditingController();
  TextEditingController goalsTextEditingController = TextEditingController();
  TextEditingController assistsTextEditingController = TextEditingController();
  TextEditingController dateTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    assistsTextEditingController.text = "0";
    goalsTextEditingController.text = "0";
    _matchUseCase = MatchUseCase(_matchRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adicionar partida")),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: futDescriptionTextEditingController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: goalsTextEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Gols',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: assistsTextEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Assistências',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: dateTextEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month),
                  labelText: 'Data do fut',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: buttonSubmit()),
          ],
        ),
      ),
    );
  }

  Widget buttonSubmit() => Builder(
    builder:
        (context) => ButtonWidget(
          text: "Adicionar",
          onClicked: () {
            try {
              if (dateTextEditingController.text.isNotEmpty && futDescriptionTextEditingController.text.isNotEmpty) {
                _matchUseCase
                    .saveMatch(
                      MatchSoccer(
                        fut_description: futDescriptionTextEditingController.text,
                        goals_amount: int.parse(goalsTextEditingController.text),
                        assists_amount: int.parse(assistsTextEditingController.text),
                        match_date: dateTextEditingController.text,
                      ),
                    )
                    .then(
                      (value) => {
                        showCustomSnackbar(
                          context,
                          'Partida inserida com sucesso!',
                          true,
                        ),
                        context.read<MatchProvider>().changeGoalsValue(),
                        context.go('/matches'),
                      },
                    );
              } else {
                 showCustomSnackbar(
                context,
                'Preencha todos os campos',
                false,
              );
              }
            } catch (e) {
              showCustomSnackbar(
                context,
                'Erro ao inserir partida: ${e.toString()}',
                false,
              );
            }
          },
        ),
  );

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        dateTextEditingController.text = picked.toString().split(" ")[0];
      });
    }
  }

  void showCustomSnackbar(
    BuildContext context,
    String message,
    bool isSuccess,
  ) {
    final snackBar = SnackBar(
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      content: Text(message),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
