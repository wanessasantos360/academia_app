import 'package:flutter/material.dart';
import '../../services/user_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  String tipoUsuario = "aluno"; // Valor padrão
  bool isLoading = false;

  Future<void> register() async {
    setState(() => isLoading = true);

    final result = await UserService().registerUser(
      nomeController.text.trim(),
      emailController.text.trim(),
      senhaController.text.trim(),
      tipoUsuario,
    );

    setState(() => isLoading = false);

    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso! Faça login.')),
      );
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result ?? 'Erro desconhecido ao cadastrar!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuário'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Nome Completo'),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'E-mail'),
                  ),
                  TextField(
                    controller: senhaController,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                  ),
                  DropdownButtonFormField<String>(
                    value: tipoUsuario,
                    onChanged: (String? newValue) {
                      setState(() {
                        tipoUsuario = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'aluno',
                        child: Text('Aluno'),
                      ),
                      DropdownMenuItem(
                        value: 'instrutor',
                        child: Text('Instrutor'),
                      ),
                      DropdownMenuItem(
                        value: 'gestao',
                        child: Text('Gestão'),
                      ),
                    ],
                    decoration: const InputDecoration(labelText: 'Tipo de Usuário'),
                  ),
                  const SizedBox(height: 24),
                  isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: register,
                          child: const Text('Cadastrar'),
                        ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text('Já tenho conta'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
