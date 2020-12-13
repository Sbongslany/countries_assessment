import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'countries.model.dart';

//TODO: complete this page - you may choose to change it to a stateful widget if necessary
class CountryDetailPage extends StatefulWidget {
  Countries selectedCountry;
  CountryDetailPage({this.selectedCountry});

  @override
  _CountryDetailPageState createState() =>
      _CountryDetailPageState(selectedCountry);
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  Countries selectedCountry;

  _CountryDetailPageState(this.selectedCountry);

  List<Countries> langauge = [];

  List<String> languages = [
    'Zulu ',
    'Xhosa',
    'Venda',
    'English',
    'isiNebele',
    'setwana',
    'Xitsonga',
    'Sitswana',
    'Sesotho',
    'Afrikaans'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCountry.name),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              selectedCountry.name,
                              style: TextStyle(fontSize: 23),
                            ),
                            Text(selectedCountry.subregion),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "${selectedCountry.name} covers an area of  km² "
                          "and has a population of 55653654 - the nation has a Gini coefficient of  "
                          "A resident of South Africa is called a South African. The main currency accepted as "
                          "legal tender is the South African rand which is expressed with the symbol ''",
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('sub-region'),
            subtitle: Text(selectedCountry.subregion),
          ),
          Divider(
            height: 1,
            indent: 70,
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Capital city'),
            subtitle: Text(selectedCountry.capital),
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: GridView.builder(
                    itemCount: languages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 2.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Card(
                          elevation: 5,
                          color: Colors.blue[600],
                          child: Center(
                            child: Text(
                              languages[index],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    },
                  ))),
        ],
      ),
    );
  }
}
