import 'package:cached_network_image/cached_network_image.dart';
import 'package:countries_app/api/apiservice.dart';
import 'package:countries_app/model/detail.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatefulWidget {
  final String countryName;

  CountryDetailScreen({required this.countryName});

  @override
  _CountryDetailScreenState createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  late Future<List<Detail>> futureDetails;

  @override
  void initState() {
    super.initState();
    futureDetails = Apiservice().getDetail(widget.countryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Country Details')),
      body: FutureBuilder<List<Detail>>(
        future: futureDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            final details = snapshot.data!;

            return ListView.builder(
              itemCount: details.length,
              itemBuilder: (context, index) {
                final detail = details[index];
                int? population = detail.population;
                double million = population! / 1_000_000;
                return Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          'https://flagsapi.com/${detail.cca2}/flat/64.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) =>
                              Center(child: CircularProgressIndicator()),
                    ),
                    Text(
                      detail.commonName.toString(),
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Official Name : " + detail.officialName.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Region : " + detail.region.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Sub Region : " + detail.subRegion.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Population : ${million.toStringAsFixed(1)}M",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Demonym : " + detail.demonym.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Country Code : " + detail.cca2.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                );

                // ListTile(
                //   leading: CachedNetworkImage(
                //     imageUrl: 'https://flagsapi.com/${detail.cca2}/flat/64.png',
                //     width: 100,
                //     height: 100,
                //     placeholder:
                //         (context, url) =>
                //             Center(child: CircularProgressIndicator()),
                //   ),
                //   title: Text(detail.commonName ?? 'N/A'),
                //   subtitle: Text('Region: ${detail.region ?? 'N/A'}'),
                // );
              },
            );
          }
        },
      ),
    );
  }
}
