import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/models/error/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex/common/widgets/po-error.dart';
import 'package:pokedex/common/widgets/po_loading.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/detail_page.dart';

class DetailArguments {
  DetailArguments(this.pokemon, this.index);
  final Pokemon pokemon;
  final int index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  }) : super(key: key);
  final PokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;
  @override
  void initState() {
    _controller = PageController(
        viewportFraction: 0.5, initialPage: widget.arguments.index);
    _future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: _future,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return PoLoading();
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (_pokemon == null) {
              _pokemon = widget.arguments.pokemon;
            }
            return DetailPage(
              pokemon: _pokemon!,
              list: snapshot.data!,
              onBack: widget.onBack,
              controller: _controller,
              onChangePokemon: (Pokemon value) {
                setState(() {
                  _pokemon = value;
                });
              },
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
