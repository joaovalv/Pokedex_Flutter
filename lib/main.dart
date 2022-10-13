import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/screens/home/container/home_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_loading.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_page.dart';
import 'package:pokedex/features/pokedex/screens/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex 2k21',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
