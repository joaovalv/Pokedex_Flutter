import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.list,
    required this.onIntemTap,
  }) : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailArguments) onIntemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          children: list
              .map(
                (e) => PokemonItem(
                  pokemon: e,
                  onTap: onIntemTap,
                  index: list.indexOf(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
