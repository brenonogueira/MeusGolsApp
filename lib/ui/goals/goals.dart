import 'package:flutter/material.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  
 TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Meus gols'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'goals',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _handleButtonPress,
                    child: Text('test'),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

void _handleButtonPress() {
  print('Botão pressionado!');
}
