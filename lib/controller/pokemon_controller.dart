import 'package:flutter/material.dart';
import 'package:pokedex/models/api/pokemon_api.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonController extends ChangeNotifier {
  PokemonApi api;
  List<Pokemon> characters = [];

  PokemonController(this.api);

void getInfo() async {
  characters = await api.getInfo();
  notifyListeners();
}

}