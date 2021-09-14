import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:semantic_kulkul/helpers/snackbar_helper.dart';

class KulkulSoundComponent extends StatefulWidget {
  final String url;
  final bool isLocal;
  KulkulSoundComponent({
    Key key,
    @required this.url,
    this.isLocal,
  }) : super(key: key);
  @override
  _KulkulSoundComponentState createState() => _KulkulSoundComponentState();
}

class _KulkulSoundComponentState extends State<KulkulSoundComponent> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlayed = false;
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  _handlePlay() async {
    setState(() {
      isPlayed = true;
    });
    int result =
        await _audioPlayer.play(widget.url, isLocal: widget.isLocal ?? false);

    if (result != 1) {
      SnackbarHelper.error('Kesalahan', 'Tidak dapat memutar audio');
    }
  }

  _handleStop() async {
    int result = await _audioPlayer.stop();

    setState(() {
      isPlayed = false;
    });

    if (result != 1) {
      SnackbarHelper.error('Kesalahan', 'Tidak dapat memutar audio');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !isPlayed
            ? TextButton.icon(
                onPressed: () {
                  _handlePlay();
                },
                label: Text('Play'),
                icon: Icon(Icons.play_circle_fill),
              )
            : TextButton.icon(
                onPressed: () {
                  _handleStop();
                },
                label: Text('Stop'),
                icon: Icon(Icons.stop_circle_outlined),
              )
      ],
    );
  }
}
