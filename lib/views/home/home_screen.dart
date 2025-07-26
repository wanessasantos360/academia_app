import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String? userEmail;
  const HomeScreen({Key? key, this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo(a) à Academia!'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Apenas para exemplo, adicionaremos logout depois
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userEmail != null
                ? 'Bem-vindo(a), $userEmail!'
                : 'Bem-vindo(a)!',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                // Exemplo de navegação, depois podemos trocar por telas reais
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Funcionalidade em breve!')),
                );
              },
              icon: const Icon(Icons.fitness_center),
              label: const Text('Ver meus treinos'),
            ),
          ],
        ),
      ),
    );
  }
}
