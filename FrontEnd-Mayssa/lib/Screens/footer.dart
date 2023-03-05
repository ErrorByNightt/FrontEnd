import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:project_coding_game/Screens/AI.dart';

class FooterPage extends StatefulWidget {
  const FooterPage({super.key});

  @override
  FooterPageState createState() {
    return new FooterPageState();
  }
}

class FooterPageState extends State<FooterPage> {
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
              title: const Text(
                'Flutter Footer View',
                style: TextStyle(fontWeight: FontWeight.w200),
              )),
          drawer: const Drawer(),
          body: FooterView(

              // ignore: sort_child_properties_last
              children: <Widget>[],
              // ignore: unnecessary_new
              footer: new Footer(
                backgroundColor: Color.fromARGB(90, 8, 8, 0),
                padding: EdgeInsets.all(5.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                height: 100.0,
                                width: 250.0,
                                child: Center(
                                  child: Card(
                                    color: Colors.black,
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // half of height and width of Image
                                    ),
                                    child: Image.asset(
                                      'assets/images/logo.png',
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.topLeft,
                                    ),
                                  ),
                                )),
                            // ignore: sized_box_for_whitespace
                            Container(
                                height: 50.0,
                                width: 100.0,
                                child: Center(
                                    child: ListView(children: <Widget>[
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    child: const Text(
                                      'About Us',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.0,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                      'Contact Us',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.0,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    child: const Text(
                                      'FAQ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.0,
                                          color: Colors.white),
                                    ),
                                  ),
                                ]))),
                            Container(
                                height: 45.0,
                                width: 45.0,
                                child: Center(
                                  child: Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          25.0), // half of height and width of Image
                                    ),
                                    child: IconButton(
                                      // ignore: prefer_const_constructors
                                      icon: Icon(
                                        Icons.mail,
                                        size: 20.0,
                                      ),
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                  ),
                                )),
                            Container(
                                height: 45.0,
                                width: 45.0,
                                child: Center(
                                  child: Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          25.0), // half of height and width of Image
                                    ),
                                    child: IconButton(
                                      icon: new Icon(
                                        Icons.facebook,
                                        size: 20.0,
                                      ),
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                  ),
                                )),
                            Container(
                                height: 45.0,
                                width: 45.0,
                                child: Center(
                                  child: Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          25.0), // half of height and width of Image
                                    ),
                                    child: IconButton(
                                      icon: new Icon(
                                        Icons.call,
                                        size: 20.0,
                                      ),
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Text(
                        'Copyright ©2023, All Rights Reserved.',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Colors.white),
                      ),
                      Text(
                        'Powered by Error By Night',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            color: Colors.white),
                      ),
                    ]),
              )),
          floatingActionButton: new FloatingActionButton(
              elevation: 10.0,
              child: new Icon(Icons.chat),
              backgroundColor: Colors.grey,
              onPressed: () {}),
        ));
  }
}
