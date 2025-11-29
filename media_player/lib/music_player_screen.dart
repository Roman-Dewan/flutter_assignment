import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:media_player/song_model.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Song> _playList = [
    Song(
      songName: "sample 1",
      artistName: "No artist",
      songUrl: "https://samplelib.com/lib/preview/mp3/sample-3s.mp3",
      durationSecond: 3,
    ),
    Song(
      songName: "sample 2",
      artistName: "No artist",
      songUrl: "https://samplelib.com/lib/preview/mp3/sample-6s.mp3",
      durationSecond: 6,
    ),
    Song(
      songName: "sample 3",
      artistName: "No artist",
      songUrl: "https://samplelib.com/lib/preview/mp3/sample-9s.mp3",
      durationSecond: 9,
    ),
    Song(
      songName: "sample 4",
      artistName: "No artist",
      songUrl: "https://samplelib.com/lib/preview/mp3/sample-12s.mp3",
      durationSecond: 12,
    ),
    Song(
      songName: "sample 5",
      artistName: "No artist",
      songUrl: "https://samplelib.com/lib/preview/mp3/sample-15s.mp3",
      durationSecond: 15,
    ),
  ];



  int _currentIndex = 0;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    _playSong(_currentIndex);
    _listenToPlayer();
    super.initState();
  }

  // song play
  Future<void> _playSong (int index) async{
    _currentIndex = index;
    final song = _playList[index];
    setState(() {
      _position = Duration.zero;
      _duration = Duration.zero;
    });
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(song.songUrl));
  }

  // next song
  Future<void> _next () async{
    final int next = (_currentIndex + 1) % _playList.length;
    await _playSong(next);
  }

  // previous song
  Future<void> _previous() async {
    final int previous = (_currentIndex - 1 + _playList.length) % _playList.length;
    await _playSong(previous);
  }

  // toggle
  Future<void> _togglePlayer() async{
    if(_isPlaying){
      await _audioPlayer.stop();
    } else {
      await _audioPlayer.resume();
    }
  }

  // listen to play
  void _listenToPlayer() {
    _audioPlayer.onDurationChanged.listen((duration){
      setState(()=>_duration=duration);
    });
    _audioPlayer.onPositionChanged.listen((position){
      setState(()=> _position = position);
    });
    _audioPlayer.onPlayerStateChanged.listen((state){
      setState(()=> _isPlaying = state == PlayerState.playing );
    });
    _audioPlayer.onPlayerComplete.listen((_)=> _next());
  }

  // time format
  String _formatDuration(Duration duration){
    final int minutes = duration.inMinutes;
    final int seconds = duration.inSeconds.remainder(60);
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    final Song song = _playList[_currentIndex];
    final double maxSecond = max(_duration.inSeconds.toDouble(), 1);
    final double currentSecond = _position.inSeconds.toDouble().clamp(0, maxSecond);
    return Scaffold(
      appBar: AppBar(
        title: Text("Media player", style:Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(song.songName, style:Theme.of(context).textTheme.headlineMedium),
                    Text(song.artistName, style:Theme.of(context).textTheme.titleLarge),
                    Slider(
                        min: 0,
                        max: maxSecond,
                        value: currentSecond,
                        onChanged: (value) async{
                          final position = Duration(seconds: value.toInt());
                          await _audioPlayer.seek(position);
                        }
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Text(_formatDuration(_position)),
                      Text(_formatDuration(_duration)),

                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                      IconButton(onPressed: _previous, icon: Icon(Icons.skip_previous)),
                      IconButton(onPressed: _togglePlayer, icon: Icon(_isPlaying? Icons.pause: Icons.play_arrow)),
                      IconButton(onPressed: _next, icon: Icon(Icons.skip_next)),
                    ],)
                  ],
                ),
              ),
            ),
            Expanded(child: ListView.builder(
                itemCount: _playList.length,
                itemBuilder: (context, index){
                  final Song song = _playList[index];
                  final bool isCurrent = index == _currentIndex;
                  return ListTile(
                    leading: CircleAvatar(child: Text("${index+1}")),
                    title: Text(song.songName, style:Theme.of(context).textTheme.headlineSmall),
                    subtitle: Text(song.artistName, style:Theme.of(context).textTheme.titleSmall),
                    trailing: Icon(isCurrent&&_isPlaying? Icons.pause: Icons.play_arrow),
                    onTap: ()=> _playSong(index),
                    selected: isCurrent,
                    selectedColor: Colors.pink,
                  );
                })),
          ],
        ),
      ),
    );
  }
}

