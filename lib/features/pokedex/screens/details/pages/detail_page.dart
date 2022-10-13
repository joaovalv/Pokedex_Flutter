import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_app_bar_widget.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.pokemon,
      required this.onBack,
      required this.list,
      required this.controller,
      required this.onChangePokemon});
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: ((notification) {
          if (notification is ScrollEndNotification)
            setState(() {
              if (scrollController.position.pixels > 27) {
                isOnTop = false;
              } else if (scrollController.position.pixels < 27) {
                isOnTop = true;
              }
            });
          return false;
        }),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            DetailAppBarWidget(
              pokemon: widget.pokemon,
              onBack: widget.onBack,
              isOnTop: isOnTop,
            ),
            DetailListWidget(
              pokemon: widget.pokemon,
              list: widget.list,
              controller: widget.controller,
              onChancePokemon: widget.onChangePokemon,
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    color: widget.pokemon.baseColor!.withOpacity(0.4),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
