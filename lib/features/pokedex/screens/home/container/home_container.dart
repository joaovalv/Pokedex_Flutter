import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/models/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex/common/widgets/po-error.dart';
import 'package:pokedex/common/widgets/po_loading.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {Key? key, required this.repository, required this.onIntemTap})
      : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onIntemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return PoLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(
              list: snapshot.data!,
              onIntemTap: onIntemTap,
            );
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasError) {
            return PoError(
              error: (snapshot.error as Failure).message!,
            );
          }

          return Container();
        }));
  }
}
