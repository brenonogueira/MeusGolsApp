import 'package:flutter/material.dart';

class Goals extends StatefulWidget {
  const Goals({super.key});

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Meus gols'),
          ),
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("10", style: TextStyle(
                  fontSize: 100
                ),)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _handleButtonPress,
                    child: Text('Meu Botão'),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

void _handleButtonPress() {
  // Sua lógica aqui quando o botão é pressionado
  print('Botão pressionado!');
}
