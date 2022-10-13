import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({
    super.key,
    required this.pokemon,
    required this.onTap,
    required this.index,
  });
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => onTap('/details', DetailArguments(pokemon, index)),
          child: Container(
            decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.4),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            pokemon.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          '#${pokemon.num}',
                          style: TextStyle(
                            color: pokemon.baseColor!,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: pokemon.type
                              .map((e) => TypeWidget(
                                    name: e,
                                  ))
                              .toList(),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              height: 100,
                              width: 200,
                              child: Image.network(pokemon.image),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
