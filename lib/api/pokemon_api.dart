import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_model.dart';

class PokemonApi {

  Future<List<Pokemon>> getInfo() async{

    var client = http.Client();
    try{
      final uri = Uri.parse('https://rafaelbarbosatec.github.io/api/pokemon/pokemons.json');

      var response = await client.get(uri);
      List<Pokemon> characters = [];

      if(response.statusCode == 200){
        final List<dynamic> jsonList = jsonDecode(response.body);
        characters = jsonList.map((item) => Pokemon.fromJson(item)).toList();
      }
      return characters;
    } catch (e){
      return [];
    }
  }
}