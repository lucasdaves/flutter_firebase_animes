import 'package:firebase_daves/model/model_anime.dart';
import 'package:firebase_daves/view/detail/detail_view.dart';
import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final AnimeModel anime;

  const AnimeCard({
    Key? key,
    required this.anime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double gridSpacing = size.width * 0.02;
    double cardSpacing = size.width * 0.15;

    return GestureDetector(
      onTap: () {
        final page = DetailView(anime: anime);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        padding: EdgeInsets.all(gridSpacing),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(anime.imageUrl.toString()),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.black,
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(5),
                width: double.maxFinite,
                height: cardSpacing,
                child: Text(
                  anime.title.toString(),
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
