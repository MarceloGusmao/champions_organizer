import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:champions_organizer/utils/constants.dart';

Future<List<String>> fetchJogadoress() async {
  final response = await http.get(
    Uri.parse(PARSE_JOGADORES_URL),
    headers: {
      'X-Parse-Application-Id': PARSE_APP_ID,
      'X-Parse-REST-API-Key': PARSE_JOGADORES_KEY,
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> results = jsonResponse['results'];

    return results.map((dynamic item) => item['nome'] as String).toList();
  } else {
    throw Exception('Falha para carregar os Jogadores.');
  }
}