import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            pokemon.name ?? "Pokemon Details",
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Card(
            margin: const EdgeInsets.all(10),
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  color: Colors.grey,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "#${pokemon.number ?? ""}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Image.network(pokemon.thumbnailImage ?? ""),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    pokemon.description ?? "",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const Divider(height: 40),
                _infoRow('Type:', pokemon.type!),
                const Divider(height: 40),
                _infoRow("Weakness:", pokemon.weakness!),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String info, List<String> infoList) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(info,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Row(
            children: [
              for (String item in infoList)
                Row(
                  children: [
                    Text(item),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                )
            ],
          ),
        ],
      ),
    );
  }
}
