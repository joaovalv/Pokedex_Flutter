import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {super.key, required this.isDiff, required this.pokemon});
  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 400),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
            tween: Tween<double>(
                end: isDiff ? 100 : 180, begin: isDiff ? 180 : 100),
            duration: Duration(milliseconds: 100),
            curve: Curves.linear,
            builder: (context, value, child) {
              return Image.network(
                pokemon.image,
                height: value,
                color: isDiff ? Colors.black.withOpacity(0.4) : null,
              );
            }),
      ),
    );
    ;
  }
}
