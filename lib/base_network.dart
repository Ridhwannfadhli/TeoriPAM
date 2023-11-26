
import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiSource {
  static const String baseUrl =
      'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?s=Soccer&c=Indonesia';

  Future<Map<String, dynamic>> getTeams() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
