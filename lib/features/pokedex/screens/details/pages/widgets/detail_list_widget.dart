import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_item_list_widget.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget(
      {super.key,
      required this.pokemon,
      required this.list,
      required this.controller,
      required this.onChancePokemon});
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChancePokemon;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor!.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(pokemon.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                      Text(
                        '#${pokemon.num}',
                        style: TextStyle(
                          color: pokemon.baseColor!,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: PageView(
                    onPageChanged: (index) {
                      onChancePokemon(list[index]);
                    },
                    controller: controller,
                    children: list.map(
                      (e) {
                        bool diff = e.name != pokemon.name;
                        return DetailItemListWidget(isDiff: diff, pokemon: e);
                      },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
