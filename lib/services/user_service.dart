import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  static const String apiUrl = 'http://SEU_IP_OU_DOMINIO_AQUI:PORTA/usuario/'; // ajuste o endereço

  Future<dynamic> registerUser(String nome, String email, String senha, String tipo) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nome': nome,
        'email': email,
        'senha': senha,
        'tipo': tipo,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      try {
        final data = jsonDecode(response.body);
        return data['detail'] ?? 'Falha ao cadastrar usuário';
      } catch (e) {
        return 'Falha ao cadastrar usuário';
      }
    }
  }
}
