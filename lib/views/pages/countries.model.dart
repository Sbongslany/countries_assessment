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
      {this.area,
      this.capital,
      this.code,
      this.gini,
      this.languages,
      this.name,
      this.population,
      this.subregion});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subregion = json['subregion'];
    name = json['name'];
    capital = json['capital'];
    population = json['population'];
    area = json['area'];
    languages = json['languages'];
    gini = json['gini'];
    code = json['code'];
  }
}
