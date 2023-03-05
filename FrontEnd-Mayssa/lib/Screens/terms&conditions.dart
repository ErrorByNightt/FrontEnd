import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff951208), Color(0xff250402)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.red.withOpacity(0.1),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: const Text(
                    'Help-Line (+234)08128916397',
                    //   textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 700.0),
                  child: const Text(
                    'Email: codeninja@gmail.com',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    'INTRODUCTION ',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 30.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 251, 251),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                child: const Text(
                  'Welcome to our coding game with AI application "CodeNinja". These terms and conditions  govern your use of the App. By using the App, you agree to these Terms. If you do not agree to these Terms, please do not use the App. ',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 251, 251),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    'USE OF THE APP ',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 30.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 251, 251),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                child: const Text(
                  'The App is designed to help users learn and practice programming skills. You must be at least 13 years old to use the App. By using the App, you agree to use it only for lawful purposes and not to engage in any activities that may harm the App or other users.',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 251, 251),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                  child: const Text(
                    'DATA COLLECTION AND USE',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 30.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 251, 251),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                child: const Text(
                  'We may collect and use data about your use of the App, including but not limited to your registration information, game results, and user feedback. We will use this data to improve the App and to provide you with a better user experience. By using the App, you agree to our data collection and use policies.',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 251, 251),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                  child: const Text(
                    'DICLAIMEROF LIABILITY',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 30.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 251, 251),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                child: const Text(
                  'We do not guarantee that the App will be free from errors or interruptions or that it will meet your specific requirements. We are not liable for any damages arising from your use of the App, including but not limited to direct, indirect, incidental, or consequential damages.',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 251, 251),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                  child: const Text(
                    'TERMINATION',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 30.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 251, 251),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                child: const Text(
                  'We may terminate your use of the App at any time for any reason. You may also terminate your use of the App at any time by deleting your account.',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 251, 251),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                  child: const Text(
                    'MODIFICATION OF THE TERMS',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 30.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 251, 251),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                child: const Text(
                  '4We may modify these Terms at any time. We will notify you of any changes to the Terms by posting the updated Terms on the App. Your continued use of the App after the posting of the updated Terms constitutes your agreement to the updated Terms.',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 251, 251),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                  child: const Text(
                    'GOVERNING LAW',
                    style: TextStyle(
                      fontFamily: 'Inika',
                      fontSize: 30.0,
                      letterSpacing: 5,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 251, 251),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                child: const Text(
                  'These Terms are governed by and construed in accordance with the laws of [Your Country or State]. Any disputes arising from or related to these Terms will be subject to the exclusive jurisdiction of the courts in TUNISIA.'
                  'Please note that this is only a general example of terms and conditions, and it may not be suitable for your specific situation. It is important to consult with a legal professional to ensure that your terms and conditions comply with all relevant laws and regulations.',
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 251, 251),
                  ),
                ),
              ),
              SizedBox(height: 50)
            ],
          )),
        ));
  }
}
