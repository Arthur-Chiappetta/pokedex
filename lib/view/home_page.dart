import 'package:flutter/material.dart';
import 'package:pokedex/controller/pokemon_controller.dart';
import 'package:pokedex/view/pokemon_card.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PokemonController controller;

  void _navigateToPokemonCard(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PokemonCard(pokemon: controller.characters[index])));
  }

  @override
  Widget build(BuildContext context) {
    controller = context.read<PokemonController>()..getInfo();

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
      body:
          SafeArea(child: Consumer<PokemonController>(builder: (_, c, widget) {
        final characters = c.characters;

        if (characters.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
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
        );
      })),
    );
  }
}
