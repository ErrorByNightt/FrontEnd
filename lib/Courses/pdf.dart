import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfBook extends StatefulWidget {
  const PdfBook({super.key});

  @override
  State<PdfBook> createState() => _PdfBookState();
}

class _PdfBookState extends State<PdfBook> {
  // to show pdf vertical
  Widget _portaitMode() {
    return Container(
      height: 50,
      width: 50,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //to call pdf file
            SfPdfViewer.asset("assets/pdf/cours-python.pdf")
          ]),
    );
  }

// to sho pdf in Horizontal
  Widget _landscapeMode() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[SfPdfViewer.asset("assets/pdf/cours-python.pdf")],
      ),
    );
  }

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
          body: OrientationBuilder(builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return _portaitMode();
            } else {
              return _landscapeMode();
            }
          }),
        ));
  }
}
