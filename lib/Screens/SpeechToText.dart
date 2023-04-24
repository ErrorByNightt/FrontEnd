import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';


class TestS2T extends StatefulWidget {
  const TestS2T({Key? key}) : super(key: key);

  @override
  State<TestS2T> createState() => _TestS2TState();
}

class _TestS2TState extends State<TestS2T> {

  bool isSpeechAvailable = false;
  bool isSpeechActivated = false;
  bool isListening = false;
  String recognizedSpeech = '';

  SpeechRecognition _speechRecognition = SpeechRecognition();
  void initSpeechRecognizer() {
    _speechRecognition.setAvailabilityHandler((bool result) => setState(() {
      isSpeechAvailable = result;
    }));

    _speechRecognition.setRecognitionStartedHandler(() => setState(() {
      isListening = true;
    }));

    _speechRecognition.setRecognitionResultHandler((String speech) => setState(() {
      recognizedSpeech = speech;
    }));

    _speechRecognition.setRecognitionCompleteHandler(() => setState(() {
      isListening = false;
    }));

    _speechRecognition.activate().then((result) => setState(() {
      isSpeechActivated = result;
    }));
  }

  void startSpeechRecognizer() {
    _speechRecognition.listen(locale: "en_US").then((result) => print('$result'));
  }

  void stopSpeechRecognizer() {
    _speechRecognition.stop().then((result) => setState(() {
      isListening = result;
    }));
  }
  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Speech Recognition Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Speech Recognition is ${isSpeechActivated ? 'activated' : 'deactivated'}.'),
              SizedBox(height: 20),
              Text('Speech Recognition is ${isSpeechAvailable ? 'available' : 'not available'} on this device.'),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Start Listening'),
                onPressed: isSpeechAvailable && !isListening ? startSpeechRecognizer : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Stop Listening'),
                onPressed: isListening ? stopSpeechRecognizer : null,
              ),
              SizedBox(height: 20),
              Text('Recognized Speech: $recognizedSpeech'),
            ],
          ),
        ),
      ),
    );
  }
}






