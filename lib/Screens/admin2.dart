import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/services.dart';


class UrlExecutor2 extends StatefulWidget {
  @override
  _UrlExecutor2State createState() => _UrlExecutor2State();
}

class _UrlExecutor2State extends State<UrlExecutor2> {
  final urlController = TextEditingController(text: "http://localhost:9095/code/testCode");
  String responseText = '';

  final urlController2 = TextEditingController(text: "http://localhost:9095/code/saveCode");
  String responseText2 = '';

  final url2BodyController = TextEditingController();

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  void execURL() async {
    final url2 = Uri.parse(urlController2.text);
    print("url : " + url2.toString());
    final headers = {'Content-Type': 'application/json'};
    //final body = json.encode(responseText);
    final formattedJson = JsonEncoder.withIndent('  ').convert(responseText);
    print("body : " + responseText);
    final response2 = await http.post(url2, headers: headers, body: responseText);

    print("StatusCode : " + response2.statusCode.toString());
    if (response2.statusCode == 200) {
      /*
      print('POST request successful');
      print('Response body: ${response2.body}');
      */
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('POST Successful'),
            content: Text('Response body: ${response2.body}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      print('POST request failed with status: ${response2.statusCode}.');
    }

  }

  void executeUrl() async {
    final url = urlController.text;
    final response = await http.get(Uri.parse(url));

    setState(() {
      final jsonResponse = json.decode(response.body);
      final formattedJson = JsonEncoder.withIndent('  ').convert(jsonResponse);
      responseText = formattedJson;
      url2BodyController.text = responseText;
    });

    /*
    showToastWidget(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
        ),
        padding: EdgeInsets.all(16),
        child: Text(
          responseText,
          style: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ),
      context: context,
      animation: StyledToastAnimation.slideFromBottom,
      reverseAnimation: StyledToastAnimation.slideToBottom,
      position: StyledToastPosition.center,
      animDuration: Duration(milliseconds: 500),
      duration: Duration(seconds: 10),
      curve: Curves.fastOutSlowIn,
      textDirection: TextDirection.ltr,
      isHideKeyboard: true,
      dismissOtherToast: true,
    );
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('URL Executor'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: urlController,
                decoration: InputDecoration(
                  enabled: false,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: executeUrl,
                child: Text('Execute'),
              ),
              SizedBox(height: 16),
              Container(
                child: GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: responseText));
                    showToast('Response copied to clipboard!');
                  },
                  child: SelectableText(
                    responseText,
                    style: TextStyle(
                      fontFamily: 'Courier New',
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: urlController2,
                decoration: InputDecoration(
                  enabled: false,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Container(
                child: TextField(
                  maxLines: null,
                  controller: url2BodyController,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: execURL,
                child: Text('Execute'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
