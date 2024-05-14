import 'package:flutter/material.dart';
import 'package:meus_gols_app/ui/components/button_widget.dart';

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

	TextEditingController _controller_fut_description = TextEditingController();
  TextEditingController _controller_goals = TextEditingController();
  TextEditingController _controller_data_fut = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add match"),
        ),
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
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
									controller: _controller_goals,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Goals',
                      border: OutlineInputBorder(),
                    )),
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
							)
            ],
          ),
        ),
      ),
    );
  }

	Widget buttonSubmit() => Builder(builder: (context) => ButtonWidget(text: "Add", onClicked: () {}));

	Future<void> _selectDate() async {
		DateTime? _picked = await showDatePicker(
			context: context,
			initialDate: DateTime.now(),
			firstDate: DateTime(2000), 
			lastDate: DateTime(2100)
		);

		if (_picked != null) {
		  setState(() {
		    _controller_data_fut.text = _picked.toString().split(" ")[0];
		  });
		}
	}

}
