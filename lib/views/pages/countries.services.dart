import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.response.dart';
import 'countries.model.dart';

class CountryService {
  static const String url = 'https://restcountries.eu/rest/v2/region/africa';
  static Future<List<Countries>> getCountries() async {
    try {
      //getting the url and storing in response
      final response =
          await http.get('https://restcountries.eu/rest/v2/region/africa');
      //checking if the response is 200/successful
      List<Countries> list = parseCompanies(response.body);
      return list;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Countries> parseCompanies(String responseBody) {
    //return a list to users
    //convert json to string and map it
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    //call user from json and return the list
    return parsed.map<Countries>((json) => Countries.fromJson(json)).toList();
  }
}
