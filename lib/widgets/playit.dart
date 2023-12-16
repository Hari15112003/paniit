import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:name/utilities/utils.dart';


class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  List<String> lofiMusics = [
    'calmsound1.mp3',
    'calmsound2.mp3',
    'calmsound3.mp3',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Color(0xff5BD960),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xff5BD960), width: 1),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff5BD960), blurRadius: 1.0, spreadRadius: 3.0),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: _isPlaying
                        ? Icon(
                            Icons.pause,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            size: 30,
                          )
                        : Icon(Icons.play_arrow,
                            color: const Color.fromARGB(255, 10, 8, 8),
                            size: 30),
                    onPressed: _handlePlayPause,
                  ),
                  Text(
                    "LoFi Beats",
                    style: textStyle(20, Colors.black87, FontWeight.w500),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: _isPlaying
                    ? Image.asset("assets/images/audioform.gif",)
                    : SizedBox()),
          ],
        ));


  }

  void _handlePlayPause() async {
    if (_isPlaying) {
      _audioPlayer.pause();
      {
        setState(() {
          _isPlaying = false;
        });
      }
    } else {
 
      _showMusicOptions();
    }
  }

 
  void _showMusicOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Lofi Music'),
          content: Container(
            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: lofiMusics.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(lofiMusics[index]),
                  onTap: () {
                  
                    _playMusic(lofiMusics[index]);
                    Navigator.pop(context); 
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }


  void _playMusic(String musicPath) async {
    _audioPlayer.play(AssetSource('audio/$musicPath'));
    loop();
    setState(() {
      _isPlaying = true;
    });
  }

  void loop() {
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    super.dispose();
  }
}
