import 'package:countries_app/api/apiservice.dart';
import 'package:countries_app/detail_screen.dart';
import 'package:countries_app/model/country.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Country>> futureCountries;

  void initState() {
    super.initState();
    futureCountries = Apiservice().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries')),
      body: FutureBuilder<List<Country>>(
        future: futureCountries,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error1: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No countries found.'));
          } else {
            // Print the results to the console
            for (var country in snapshot.data!) {
              print(
                'Country: ${country.common}, Region: ${country.official}, Languages: ${country.cca2}',
              );
            }

            // Display the results in a ListView
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final country = snapshot.data![index];
                return item(country);
              },
            );
          }
        },
      ),
    );
  }

  Widget item(Country country) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    CountryDetailScreen(countryName: country.common.toString()),
          ),
        );
      },
      leading: CachedNetworkImage(
        imageUrl: 'https://flagsapi.com/${country.cca2}/flat/64.png',
        width: 100,
        height: 100,
        placeholder:
            (context, url) => Center(child: CircularProgressIndicator()),
      ),
      title: Text(country.common.toString()),
      subtitle: Text('Region: ${country.official}'),
    );
  }
}
