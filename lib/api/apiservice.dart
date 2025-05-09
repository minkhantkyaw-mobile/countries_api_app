// import 'package:countries_app/model/country.dart';
// import 'package:retrofit/http.dart';
// import 'package:dio/dio.dart';
// part 'apiservice.g.dart';

// @RestApi(baseUrl: 'https://restcountries.com/v3.1/')
// abstract class ApiService {
//   factory ApiService(Dio dio) = _ApiService;

//   @GET("all")
//   Future<List<Country>> getCountries();
// }
import 'dart:convert';
import 'package:countries_app/model/detail.dart';
import 'package:http/http.dart' as http;
import 'package:countries_app/model/country.dart';

class Apiservice {
  Future<List<Country>> getCountries() async {
    final response = await http.get(
      Uri.parse('https://restcountries.com/v3.1/all'),
    );
    print("object");
    print(response.body);
    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> jsonList = json.decode(response.body);
      print(jsonList);
      return jsonList.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<List<Detail>> getDetail(String name) async {
    try {
      final response = await http.get(
        Uri.parse('https://restcountries.com/v3.1/name/$name?fullText=true'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Detail.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load countries: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load countries');
    }
  }
}
