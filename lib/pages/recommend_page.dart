import 'package:flutter/material.dart';
import 'package:presentasi_task4/data/game_store.dart';
import 'package:presentasi_task4/data/fav.dart';
import 'package:presentasi_task4/pages/favorite_page.dart';
import 'package:url_launcher/url_launcher.dart';

Favorite toFavorite(GameStore game) {
  return Favorite(
    game: game,
    isFav: false,
  );
}

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Game Recommendation"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritePage()));
              },
              child: Text("Fav"))
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        // shrinkWrap: true,
        itemCount: gameList.length,
        itemBuilder: (context, index) {
          final game = gameList[index];
          return ListTile(
            onTap: () async {
              launchUrl(Uri.parse(game.linkStore));
            },
            leading: Image.network(
              game.imageUrls[0],
              fit: BoxFit.cover,
            ),
            title: Text(
              game.name,
            ),
            subtitle: Text(
              game.price,
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  if (game.isFav) {
                    setState(() {
                      game.isFav = false;
                    });
                    favoriteList
                        .removeWhere((favorite) => favorite.game == game);
                  } else {
                    setState(() {
                      game.isFav = true;
                    });
                    favoriteList.add(Favorite(game: game, isFav: true));
                  }
                });
              },
              icon: game.isFav
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    ));
  }
}
