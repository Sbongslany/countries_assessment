import 'dart:ffi';

class Countries {
  int id;
  String name;
  String capital;
  String subregion;
  int population;
  int area;
  String languages;
  Double gini;
  String code;

  Countries(
      {this.id,
      this.area,
      this.capital,
      this.code,
      this.gini,
      this.languages,
      this.name,
      this.population,
      this.subregion});

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      id: json['id'] as int,
      // area: json['area'] as int,
      capital: json['capital'] as String,
      // code: json['code'] as String,
      // gini: json['gini'] as Double,
      // languages: json['languages'] as String,
      name: json['name'] as String,
      // population: json['population'] as int,
      // subregion: json['subregion'] as String,
    );
  }
}
