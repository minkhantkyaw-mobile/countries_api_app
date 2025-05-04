import 'package:countries_app/api/apiservice.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Apiservice apiservice;
  final String country_name;
  const DetailScreen({required this.apiservice, required this.country_name});

  @override
  Widget build(BuildContext context) {
    print(apiservice);
    print(country_name);
    return Scaffold(appBar: AppBar(title: Text("Detail")));
  }
}
