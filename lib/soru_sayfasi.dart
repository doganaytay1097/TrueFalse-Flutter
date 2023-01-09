import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:finalmobile/test.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'constants.dart';

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  int counter = 1;
  late double seconds;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    seconds = 2.5;
    timer = Timer.periodic(const Duration(seconds: 1), azalt);
  }

  void azalt(Timer time) {
    setState(() {
      if (seconds > 1) {
        seconds--;
      } else {
        seconds = 0;
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  AudioPlayer audioPlayer = AudioPlayer();
  List<Widget> secimler = [];
  Test test = Test();

  void ses(bool ses) {
    setState(() async {
      if (test.getSoruYaniti2() == ses) {
        await audioPlayer.stop();
        await audioPlayer.play(AssetSource("true.mp3"));
      } else {
        await audioPlayer.stop();
        await audioPlayer.play(AssetSource("false.mp3"));
      }
    });
  }

  void butonFonksiyonu(bool secilenButton) {
    if (test.testBittiMi() == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color(0xFFffc1cc),
              title: Text(
                "BAŞA  DÖN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 33,
                  color: Colors.grey[900],
                ),
              ),
              //content: const Text("data"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      test.indexiSifirla();
                      secimler = [];
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Dön",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            );
          });
    } else {
      setState(() {
        if (test.getSoruYaniti() == secilenButton) {
          secimler.add(kDogruIconu);
          seconds = 2.5;
          counter++;
        } else {
          secimler.add(kYanlisIconu);
          seconds = 2.5;
          counter++;
        }
        test.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return seconds == 0
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      test.getSoruMetni(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 42.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Wrap(
                runSpacing: 2.0,
                spacing: 2.0,
                children: secimler,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.red[400]),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.thumb_down,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                                onPressed: () {
                                  butonFonksiyonu(false);
                                  ses(false);
                                },
                              ))),
                      Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.green[400]),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.thumb_up,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {

                                  butonFonksiyonu(true);
                                  ses(true);

                                },
                              ))),
                    ])),
              )
            ],
          )
        : Center(
            child: Lottie.asset('assets/time.json'),
          );
  }
}
