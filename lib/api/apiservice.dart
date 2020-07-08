//definir metodos
import 'package:consumir_web_api/models/materia.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  final String baseUrl = 'https://studentapi20200625220726.azurewebsites.net';

  Client client = Client();

  Future<List<Materia>> getProfiles() async {
    final response = await client.get('$baseUrl/api/materias');
    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<bool> createProfile(Materia data) async {
    final response = await client.post('$baseUrl/api/materias',
        headers: {"content-type": "application/json"},
        body: profileToJson(data));

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(Materia data) async {
    final response = await client.put('$baseUrl/api/materias/${data.id}', //
        headers: {"content-type": "application/json"},
        body: profileToJson(data));
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProfile(int id) async {
    final response = await client.delete('$baseUrl/api/materias/$id', //
        headers: {"content-type": "application/json"});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
