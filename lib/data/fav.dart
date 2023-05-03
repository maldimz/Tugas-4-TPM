import 'package:presentasi_task4/data/game_store.dart';

class Favorite {
  final GameStore? game;
  final bool? isFav;

  Favorite({this.game, this.isFav});
}

var favoriteList = <Favorite>[];
