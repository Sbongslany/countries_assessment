import 'package:flutter/material.dart';

//TODO: complete this page - you may choose to change it to a stateful widget if necessary
class CountryDetailPage extends StatefulWidget {
  final int id;
  CountryDetailPage({this.id});

  @override
  _CountryDetailPageState createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Countries"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'South Africa',
                                style: TextStyle(fontSize: 23),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "South Africa covers an area of 1221037 km² "
                            "and has a population of 55653654 - the nation has a Gini coefficient of 63.1. "
                            "A resident of South Africa is called a South African. The main currency accepted as "
                            "legal tender is the South African rand which is expressed with the symbol 'R'",
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
