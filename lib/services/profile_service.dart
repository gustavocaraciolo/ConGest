import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';
import 'package:congest/config/env_config.dart';

class ProfileService {
  static String get baseUrl => EnvConfig.apiBaseUrl;

  static Future<Profile?> getProfile() async {
    try {
      final token = await AuthService.getToken();
      if (token == null) return null;

      final response = await http.get(
        Uri.parse('$baseUrl/perfil/getPessoaSingular?flPerfil=S'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> lines = data['lines'];

        if (lines.isNotEmpty) {
          return Profile.fromJson(lines.first);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

class Profile {
  final int idPessoa;
  final String name;
  final String phoneNumber;
  final String birthday;
  final String nationality;
  final String nif;
  final String email;

  Profile({
    required this.idPessoa,
    required this.name,
    required this.phoneNumber,
    required this.birthday,
    required this.nationality,
    required this.nif,
    required this.email,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    String phoneNumber = '';
    String email = '';

    if (json['contatos'] != null) {
      final List<dynamic> contatos = json['contatos'];
      for (var contato in contatos) {
        final tpContato = contato['tpContato']['codigo'];
        final dsContato = contato['dsContato'] ?? '';

        if (tpContato == 'M') {
          phoneNumber = dsContato;
        } else if (tpContato == 'E') {
          email = dsContato;
        }
      }
    }

    return Profile(
      idPessoa: json['idPessoa'] ?? 0,
      name: json['noPessoa'] ?? '',
      phoneNumber: phoneNumber,
      birthday: json['dtNascimento']?.split('T').first ?? '',
      nationality: json['paisNacionalidade']?['nome'] ?? '',
      nif: json['documento']?['numero'] ?? json['numeroNIF'] ?? '',
      email: email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPessoa': idPessoa,
      'name': name,
      'phoneNumber': phoneNumber,
      'birthday': birthday,
      'nationality': nationality,
      'nif': nif,
      'email': email,
    };
  }

  Profile copyWith({
    int? idPessoa,
    String? name,
    String? phoneNumber,
    String? birthday,
    String? nationality,
    String? nif,
    String? email,
  }) {
    return Profile(
      idPessoa: idPessoa ?? this.idPessoa,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthday: birthday ?? this.birthday,
      nationality: nationality ?? this.nationality,
      nif: nif ?? this.nif,
      email: email ?? this.email,
    );
  }
}
