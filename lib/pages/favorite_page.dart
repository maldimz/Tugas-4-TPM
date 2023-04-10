import 'package:flutter/material.dart';
import 'package:tugas4tpm/data/fav.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ListView.builder(
          itemCount: favoriteList.length,
          itemBuilder: (context, index) {
            final Favorite fav = favoriteList[index];
            // final game = fav.game;
            return ListTile(
              onTap: () async {
                launch(fav.game!.linkStore);
              },
              leading: Image.network(
                fav.game!.imageUrls[0],
                fit: BoxFit.cover,
              ),
              title: Text(fav.game!.name),
              subtitle: Text(fav.game!.price),
            );
          }),
    ));
  }
}
