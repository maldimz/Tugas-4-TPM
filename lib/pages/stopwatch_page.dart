import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({Key? key}) : super(key: key);

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  static const TimeDuration = Duration(seconds: 10);
  Duration duration = Duration();
  Timer? timer; //pake dart async disini

  bool isCountdown = false; // state pas stopwatch masih berhenti

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void initState() {
    super.initState();
    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = TimeDuration);
    } else {
      setState(() => duration = Duration());
    }
  } // di void reset bakal cek dimulai atau kaga countdown
  // kalau true maka dimulai menghitung berdasarkan TimeDuration
  // kalau false bakal balik ke state awal Duration()

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    if (this.mounted) {
      setState(() {
        final seconds = duration.inSeconds + addSeconds;
        if (seconds < 0) {
          timer?.cancel();
        } else {
          duration = Duration(seconds: seconds);
        }
      });
    }
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    if (this.mounted) {
      timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
    }
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stop Watch'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            buildTime(),
            SizedBox(
              height: 20,
            ),
            buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n
        .toString()
        .padLeft(2, '0'); //membuat var TwoDigits menampilkan 0 dua kali
    final hours = twoDigits(duration.inHours.remainder(24)); //max 24
    final minutes = twoDigits(duration.inMinutes.remainder(60)); //max 60
    final seconds = twoDigits(duration.inSeconds.remainder(60)); //max 60
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header: 'HOURS'),
      SizedBox(
        width: 10,
      ),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      SizedBox(
        width: 10,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  child: Text(isRunning ? 'STOP' : 'RESUME',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.blue,
                  onPressed: () {
                    if (isRunning) {
                      stopTimer(resets: false);
                    } else {
                      startTimer(resets: false);
                    }
                  }),
              SizedBox(
                width: 12,
              ),
              MaterialButton(
                  child: Text('CANCEL',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.red,
                  onPressed: () {
                    stopTimer();
                  }),
            ],
          )
        : MaterialButton(
            child: Text(
              'START',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.blue,
            onPressed: () {
              startTimer();
            });
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        SizedBox(
          height: 20,
        ),
        Text(
          header,
          style: TextStyle(),
        ),
      ]);
}
