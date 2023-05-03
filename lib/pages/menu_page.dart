import 'package:flutter/material.dart';
import 'package:presentasi_task4/pages/favorite_page.dart';
import 'package:presentasi_task4/pages/group_page.dart';
import 'package:presentasi_task4/pages/recommend_page.dart';
import 'package:presentasi_task4/pages/stopwatch_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 30,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GroupPage(),
                        ));
                  },
                  child: Text('List Group')),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 100,
              height: 30,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StopwatchPage(),
                        ));
                  },
                  child: Text('Stopwatch')),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 100,
              height: 30,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecommendPage(),
                        ));
                  },
                  child: Text('Game Rec.')),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 100,
              height: 30,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritePage(),
                        ));
                  },
                  child: Text('Favorite')),
            ),
          ],
        ),
      ),
    );
  }
}
