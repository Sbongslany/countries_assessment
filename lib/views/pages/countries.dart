import 'package:countries_info/routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'countries.model.dart';
import 'countries.services.dart';
import 'countryDetail.dart';

// TODO: fetch list of countries from API and render
// Feel free to change this to a stateful widget if necessary
class CountriesPage extends StatefulWidget {
  CountryService get service => GetIt.I<CountryService>();

  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  List<Countries> country = List();
  List<Countries> countryFiltererd = List();

  @override
  void initState() {
    super.initState();
    CountryService.getCountries().then((response) {
      country = response;
      countryFiltererd = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Countries"),
          actions: [
            IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.about)),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            //Search
            Card(
              margin: EdgeInsets.all(5),
              elevation: 10,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(3),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  hintText: 'Search',
                ),
                onChanged: (string) {
                  setState(() {
                    countryFiltererd = country
                        .where((c) => (c.name
                            .toLowerCase()
                            .contains(string.toLowerCase())))
                        .toList();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: countryFiltererd.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CountryDetailPage()));
                    },
                    title: Text(countryFiltererd[index].name),
                    subtitle: Text(countryFiltererd[index].capital),
                    trailing: Wrap(
                      spacing: 12,
                      children: [Icon(Icons.arrow_forward_ios_rounded)],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
