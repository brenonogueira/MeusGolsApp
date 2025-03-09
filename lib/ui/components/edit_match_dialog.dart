import 'package:flutter/material.dart';
import 'package:meus_gols_app/data/interface/match_repository.dart';
import 'package:meus_gols_app/data/models/match_soccer.dart';
import 'package:meus_gols_app/data/provider_service/match_provider.dart';
import 'package:meus_gols_app/data/usecases/match_use_case.dart';
import 'package:meus_gols_app/infra/repository/match_repository_impl.dart';
import 'package:provider/provider.dart';

class EditMatchDialog extends StatefulWidget {
  final MatchSoccer? match;
  const EditMatchDialog({super.key, required this.match});

  @override
  State<EditMatchDialog> createState() => _EditMatchDialogState();
}

class _EditMatchDialogState extends State<EditMatchDialog> {
  late TextEditingController futDescriptionTextEditingController;
  late TextEditingController goalsTextEditingController;
  late TextEditingController assistsTextEditingController;
  late TextEditingController dateTextEditingController;

  final MatchRepository _matchRepository = MatchRepositoryImpl();
  late final MatchUseCase _matchUseCase;

  @override
  void initState() {
    super.initState();
    futDescriptionTextEditingController = TextEditingController(
      text: widget.match?.fut_description,
    );
    goalsTextEditingController = TextEditingController(
      text: widget.match?.goals_amount.toString(),
    );
    assistsTextEditingController = TextEditingController(
      text: widget.match?.assists_amount.toString(),
    );
    dateTextEditingController = TextEditingController(
      text: widget.match?.match_date,
    );

    _matchUseCase = MatchUseCase(_matchRepository);
  }

  void _updateMatch() {
    if (dateTextEditingController.text.isNotEmpty &&
        futDescriptionTextEditingController.text.isNotEmpty) {
      MatchSoccer editedMatch = MatchSoccer(
        id: widget.match!.id!,
        fut_description: futDescriptionTextEditingController.text,
        goals_amount: int.parse(goalsTextEditingController.text),
        assists_amount: int.parse(assistsTextEditingController.text),
        match_date: dateTextEditingController.text,
      );

      setState(() {
        _matchUseCase.updateMatch(editedMatch, widget.match!.id!);
        context.read<MatchProvider>().changeGoalsValue();
        Navigator.of(context).pop(editedMatch);
      });
    } else {
      showCustomSnackbar(context, 'Preencha todos os campos', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Editar Partida"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: futDescriptionTextEditingController,
            decoration: const InputDecoration(labelText: "Descrição"),
          ),
          TextField(
            controller: goalsTextEditingController,
            decoration: const InputDecoration(labelText: "Gols"),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: assistsTextEditingController,
            decoration: const InputDecoration(labelText: "Assistências"),
          ),
          Padding(
						padding: const EdgeInsets.all(16.0),
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
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(widget.match),
          child: const Text("Cancelar"),
        ),
        ElevatedButton(onPressed: _updateMatch, child: const Text("Atualizar")),
      ],
    );
  }

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
