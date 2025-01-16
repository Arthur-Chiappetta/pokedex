import 'package:flutter/material.dart';
import 'package:pokedex/api/pokemon_api.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/view/pokemon_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PokemonApi api = PokemonApi();

  List<Pokemon> characters = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadPokemons();
  }

  void _loadPokemons() async {
    List<Pokemon> fetchedPokemons = await api.getInfo();

    setState(() {
      characters = fetchedPokemons;
    });
  }

  void _navigateToPokemonCard(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PokemonCard(pokemon: characters[index])
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "PokeDex",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.network(
              "https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png",
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () => _navigateToPokemonCard(index),
                leading: Image.network(
                  characters[index].thumbnailImage ?? "",
                ),
                title: Text(characters[index].name ?? ""),
                trailing: Text(
                  "#${characters[index].number ?? ""}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
