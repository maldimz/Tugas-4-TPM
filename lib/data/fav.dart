import 'package:tugas4tpm/data/game_store.dart';

class Favorite {
  final GameStore? game;
  final bool? isFav;

  Favorite({this.game, this.isFav});
}

var favoriteList = <Favorite>[];
