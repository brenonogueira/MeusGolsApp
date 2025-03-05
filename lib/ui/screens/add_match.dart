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
  String fut_description = '';
  int goals = 0;
  String data_fut = '';

  final MatchRepository _matchRepository = MatchRepositoryImpl();
  late final MatchUseCase _matchUseCase;

  TextEditingController _controller_fut_description = TextEditingController();
  TextEditingController _controller_goals = TextEditingController();
  TextEditingController _controller_assists = TextEditingController();
  TextEditingController _controller_data_fut = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller_assists.text = "0";
    _controller_goals.text = "0";
    _matchUseCase = MatchUseCase(_matchRepository);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Add match")),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller_fut_description,
                  decoration: InputDecoration(
                    labelText: 'Fut',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller_goals,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Goals',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller_assists,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Assists',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller_data_fut,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buttonSubmit(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonSubmit() => Builder(
    builder:
        (context) => ButtonWidget(
          text: "Add",
          onClicked: () {
            try {
              if (_controller_data_fut.text.isNotEmpty) {
                _matchUseCase
                    .saveMatch(
                      MatchSoccer(
                        fut_description: _controller_fut_description.text,
                        goals_amount: int.parse(_controller_goals.text),
                        assists_amount: int.parse(_controller_assists.text),
                        match_date: _controller_data_fut.text,
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
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_picked != null) {
      setState(() {
        _controller_data_fut.text = _picked.toString().split(" ")[0];
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
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
