import 'package:firebase_daves/controller/anime_controller.dart';
import 'package:firebase_daves/model/model_anime.dart';
import 'package:firebase_daves/view/home/widgets/grid_widget.dart';
import 'package:firebase_daves/view/home/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  final TextEditingController textController;
  const HomeBody({Key? key, required this.textController}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  AnimeController animeController = AnimeController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: HomeTextField(textController: widget.textController),
          ),
          Expanded(
            flex: 9,
            child: FutureBuilder<List<AnimeModel>>(
              future: animeController.loadAnimes(widget.textController.text),
              builder: (context, snapshot) {
                if (widget.textController.text.length >= 3 &&
                    snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasError == false) {
                  return HomeGrid(animeList: snapshot.data!);
                } else {
                  return Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/loading_background.png"),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: double.maxFinite,
                          color: Colors.black,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child:
                                Image.asset("assets/images/loading_logo.png"),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
