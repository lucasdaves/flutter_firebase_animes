import 'package:firebase_daves/model/model_anime.dart';
import 'package:firebase_daves/view/home/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomeGrid extends StatefulWidget {
  final List<AnimeModel> animeList;
  const HomeGrid({
    Key? key,
    required this.animeList,
  }) : super(key: key);

  @override
  _HomeGridState createState() => _HomeGridState();
}

class _HomeGridState extends State<HomeGrid> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 3;
    final double itemWidth = size.width / 2;

    return GridView.count(
      childAspectRatio: (itemWidth / itemHeight),
      crossAxisCount: 2,
      children: List.generate(widget.animeList.length, (index) {
        return Center(
          child: AnimeCard(anime: widget.animeList[index]),
        );
      }),
    );
  }
}
