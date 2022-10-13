import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget(
      {super.key,
      required this.pokemon,
      required this.onBack,
      required this.isOnTop});
  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      centerTitle: false,
      title: isOnTop
          ? Container()
          : Text(
              pokemon.name,
              style: TextStyle(color: Colors.black),
            ),
    );
  }
}
