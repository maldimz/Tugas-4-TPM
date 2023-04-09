import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  final StopWatchTimer _swTimer = StopWatchTimer();
  final _hours = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stop Watch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: _swTimer.rawTime,
              initialData: _swTimer.rawTime.value,
              builder: (context, snapshot){
                final value = snapshot.data;
                final TimeDisplay = StopWatchTimer.getDisplayTime(value!, hours: _hours);
                return Text(
                  TimeDisplay,
                  style: TextStyle(
                    fontSize: 80,
                  ),
                );
              },
            ),
            SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StartButton(),
                  SizedBox(width: 15,),
                  StopButton(),
                  SizedBox(width: 15,),
                  ResetButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  ElevatedButton StartButton(){
    return ElevatedButton(
      onPressed: () {
        _swTimer.onExecute.add(StopWatchExecute.start);
      },
      child: Text('Start'),
      style: ElevatedButton.styleFrom(
        primary: Colors.green,
        textStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold
        )
      ),

    );
  }

  ElevatedButton StopButton(){
    return ElevatedButton(
      onPressed: () {
        _swTimer.onExecute.add(StopWatchExecute.stop);
      },
      child: Text('Stop'),
      style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
          )
      ),

    );
  }

  ElevatedButton ResetButton(){
    return ElevatedButton(
      onPressed: () {
        _swTimer.onExecute.add(StopWatchExecute.reset);
      },
      child: Text('Reset'),
      style: ElevatedButton.styleFrom(
          primary: Colors.red,
          textStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold
          )
      ),

    );
  }
}
