import 'dart:ffi';

class Countries {
  int id;
  String name;
  String capital;
  String subregion;
  int population;
  Double area;
  String languages;
  Double gini;
  String code;
  String alpha2Code;
  String symbol;

  Countries(
      {this.id,
      this.area,
      this.capital,
      this.code,
      this.gini,
      this.languages,
      this.name,
      this.population,
      this.alpha2Code,
      this.subregion,
      this.symbol});

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      id: json['id'] as int,
      //  area: json['area'] as Double,
      capital: json['capital'] as String,
      // code: json['code'] as String,
      //gini: json['gini'] as Double,
      // languages: json['languages'] as String,
      name: json['name'] as String,
      // population: json['population'] as int,
      subregion: json['subregion'] as String,
      alpha2Code: json['alpha2Code'] as String,
      //  symbol: json['currencies']['symbol'] as String
    );
  }
}
