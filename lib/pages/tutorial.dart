import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('This Application is to fullfill the assignment from TPM course,'
              'This application have 4 main menu like in the main page.'),
          SizedBox(height: 20),
          Text('Menu : ', textAlign: TextAlign.left,),
          SizedBox(height: 15),
          Text('- You can see our member by clicked in list group',textAlign: TextAlign.left,),
          SizedBox(height: 10),
          Text('- You can use simple stopwatch by clicked in stopwatch application',textAlign: TextAlign.left,),
          SizedBox(height: 10),
          Text('- You can see our recommendation sites in some game by clicked in recommendation sites,'
            'in this recommendation sites you can visit the game link and also add it to you favorite.',textAlign: TextAlign.left,),
          SizedBox(height: 10),
          Text('- you can see all sites you mark favorite by clicked in favorite',textAlign: TextAlign.left,),
        ],
      ),
    );
  }
}
