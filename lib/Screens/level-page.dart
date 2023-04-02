import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_coding_game/Screens/chalenge-page.dart';
import 'package:project_coding_game/Screens/utils.dart';

class Level extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 1908.96875;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold( // Utiliser Scaffold pour faire défiler la page
        body: SingleChildScrollView( // Mettre le contenu dans un SingleChildScrollView pour permettre le scrolling
        child: Container(
// frame10Etm (145:109)
        width: double.infinity,
        height: 1122.89*fem,
        decoration: BoxDecoration (
        gradient: LinearGradient (
        begin: Alignment(-0.971, -1),
    end: Alignment(1.057, -1),
    colors: <Color>[Color(0xffbe002d), Color(0xff281d2a), Color(0xdd200000)],
    stops: <double>[0, 0.568, 1],
    ),
    ),
    child: Stack(
          children: [
            Positioned(
              // rectangle840dvu (145:110)
              left: 0*fem,
              top: 20.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 1908.97*fem,
                  height: 1102*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      gradient: LinearGradient (
                        begin: Alignment(-0.971, -1),
                        end: Alignment(1.057, -1),
                        colors: <Color>[Color(0xffbe002d), Color(0xff281d2a), Color(0xdd200000)],
                        stops: <double>[0, 0.568, 1],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // originalcomputerlogodesignstoi (164:1230)
              left: 297*fem,
              top: 445.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 1553*fem,
                  height: 630*fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(81*fem),
                    child: Image.asset(
                      'assets/images/original-computer-logo-designs-to-inspire-designmantic-the-design-shop-1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle14qQh (164:1204)
              left: 1391*fem,
              top: 86.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 452*fem,
                  height: 67*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(10*fem),
                      color: Color(0xbc353d62),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle859J3P (164:1220)
              left: 1390*fem,
              top: 158.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 452*fem,
                  height: 137*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(10*fem),
                      color: Color(0xbc353d62),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse2A5b (164:1225)
              left: 1422 * fem,
              top: 260.8908691406 * fem,
              child: Align(
                child: SizedBox(
                  width: 20.97*fem,
                  height: 15.24*fem,
                  child: Image.asset(
                    'assets/images/ellipse-2-YgD.png',
                    width: 20.97*fem,
                    height: 15.24*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse4qBj (164:1227)
              left: 1422*fem,
              top: 223.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 20.97*fem,
                  height: 15.24*fem,
                  child: Image.asset(
                    'assets/images/ellipse-4.png',
                    width: 20.97*fem,
                    height: 15.24*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse3j2D (164:1226)
              left: 1422*fem,
              top: 182.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 20.97*fem,
                  height: 15.24*fem,
                  child: Image.asset(
                    'assets/images/ellipse-3.png',
                    width: 20.97*fem,
                    height: 15.24*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // scroll11VX (164:1221)
              left: 1741*fem,
              top: 171.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 109*fem,
                  height: 111*fem,
                  child: Image.asset(
                    'assets/images/scroll-1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // alllanguageuau (164:1205)
              left: 1462*fem,
              top: 106.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 171*fem,
                  height: 27*fem,
                  child: Text(
                    'ALL LANGUAGE',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 22*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125*ffem/fem,
                      color: Color(0xff939ab0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // javaLRK (164:1222)
              left: 1462*fem,
              top: 174.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 51*fem,
                  height: 27*fem,
                  child: Text(
                    'Java',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 22*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125*ffem/fem,
                      color: Color(0xff939ab0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // swiftoZo (164:1223)
              left: 1462*fem,
              top: 218.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 57*fem,
                  height: 27*fem,
                  child: Text(
                    'Swift',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 22*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125*ffem/fem,
                      color: Color(0xff939ab0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // c51X (164:1224)
              left: 1462*fem,
              top: 255.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 47*fem,
                  height: 27*fem,
                  child: Text(
                    'C++',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 22*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125*ffem/fem,
                      color: Color(0xff939ab0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle15iaH (164:1206)
              left: 1701*fem,
              top: 105.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 29*fem,
                  height: 29*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xff1b703d),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // obj (164:1207)
              left: 1707*fem,
              top: 105.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 16*fem,
                  height: 30*fem,
                  child: Text(
                    '3',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 24*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconlist6Kw (164:1208)
              left: 1418*fem,
              top: 102.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 35*fem,
                  height: 35*fem,
                  child: Image.asset(
                    'assets/images/icon-list.png',
                    width: 35*fem,
                    height: 35*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // iconarrowiosdownwardoutlinemS5 (164:1217)
              left: 1773*fem,
              top: 97.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 45*fem,
                  height: 45*fem,
                  child: Image.asset(
                    'assets/images/icon-arrow-ios-downward-outline.png',
                    width: 45*fem,
                    height: 45*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle10pv9 (148:582)
              left: 613*fem,
              top: 497.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // 5r5 (148:583)
              left: 710*fem,
              top: 552.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '02',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxHam (148:584)
              left: 628*fem,
              top: 520.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-mSV.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle841WiR (148:590)
              left: 809*fem,
              top: 497.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ZRo (148:591)
              left: 906*fem,
              top: 552.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '03',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxcey (148:592)
              left: 824*fem,
              top: 520.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-kgV.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle842t6h (148:624)
              left: 1014*fem,
              top: 493.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // jt1 (148:625)
              left: 1111*fem,
              top: 548.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '04',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxhiM (148:626)
              left: 1029*fem,
              top: 516.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-g85.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle843Yys (148:627)
              left: 1210*fem,
              top: 493.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // RGy (148:628)
              left: 1307*fem,
              top: 548.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '05',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxJ5s (148:629)
              left: 1225*fem,
              top: 516.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle844yho (148:640)
              left: 1413*fem,
              top: 493.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // SrH (148:641)
              left: 1510*fem,
              top: 548.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '06',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxX73 (148:642)
              left: 1428*fem,
              top: 516.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-Zoj.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle845oaM (148:643)
              left: 1609*fem,
              top: 493.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // UAh (148:644)
              left: 1706*fem,
              top: 548.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '07',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24px8m3 (148:645)
              left: 1624*fem,
              top: 516.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-917.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle846buX (148:656)
              left: 613*fem,
              top: 665.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle856VED (148:736)
              left: 613*fem,
              top: 665.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // kR3 (148:657)
              left: 710*fem,
              top: 720.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '09',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxDpR (148:658)
              left: 628*fem,
              top: 688.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-PkR.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle857WHj (148:737)
              left: 396*fem,
              top: 672.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // aoP (148:738)
              left: 493*fem,
              top: 727.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '08',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxf49 (148:739)
              left: 411*fem,
              top: 695.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-do3.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle858X6M (148:745)
              left: 396*fem,
              top: 858.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // Bgh (148:746)
              left: 493*fem,
              top: 913.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '15',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24px51P (148:747)
              left: 411*fem,
              top: 881.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-Rv5.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle84791F (148:659)
              left: 809*fem,
              top: 665.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // D17 (148:660)
              left: 906*fem,
              top: 720.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '10',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxHFs (148:661)
              left: 824*fem,
              top: 688.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-5zV.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle848k9T (148:672)
              left: 612*fem,
              top: 857.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // QUu (148:673)
              left: 709*fem,
              top: 912.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '16',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxt9B (148:674)
              left: 627*fem,
              top: 880.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-Xc1.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle849M2m (148:675)
              left: 808*fem,
              top: 857.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // QFw (148:676)
              left: 905*fem,
              top: 912.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '17',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxUFo (148:677)
              left: 823*fem,
              top: 880.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-eZs.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle850M4h (148:688)
              left: 1014*fem,
              top: 665.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // d2D (148:689)
              left: 1111*fem,
              top: 720.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '11',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxJ8M (148:690)
              left: 1029*fem,
              top: 688.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-kgV.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle851AwF (148:691)
              left: 1210*fem,
              top: 665.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(20*fem),
                        border: Border.all(color: Color(0xff000000)),
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // dZw (148:692)
              left: 1307*fem,
              top: 720.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '12',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xffbe002d),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle852Wdj (148:704)
              left: 1014*fem,
              top: 859.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ynD (148:705)
              left: 1111*fem,
              top: 914.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '18',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxqpR (148:706)
              left: 1029*fem,
              top: 882.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-8aZ.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle853uJV (148:707)
              left: 1210*fem,
              top: 859.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // AVK (148:708)
              left: 1307*fem,
              top: 914.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '19',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xffbe002d),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactiondone24pxDyP (169:231)
              left: 1231.9143066406*fem,
              top: 887.3159179688*fem,
              child: Align(
                child: SizedBox(
                  width: 32.17*fem,
                  height: 25.15*fem,
                  child: Image.asset(
                    'assets/images/icon-action-done24px.png',
                    width: 32.17*fem,
                    height: 25.15*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle854tpd (148:720)
              left: 1406*fem,
              top: 667.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // mNd (148:721)
              left: 1503*fem,
              top: 722.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '13',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxRxy (148:722)
              left: 1421*fem,
              top: 690.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-t1s.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle855VC9 (148:723)
              left: 1602*fem,
              top: 667.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 154*fem,
                  height: 122*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(20*fem),
                      border: Border.all(color: Color(0xff000000)),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // AZB (148:724)
              left: 1699*fem,
              top: 722.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '14',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactionlockoutline24pxSWh (148:725)
              left: 1617*fem,
              top: 690.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 32*fem,
                  height: 42*fem,
                  child: Image.asset(
                    'assets/images/icon-action-lockoutline24px-FFs.png',
                    width: 32*fem,
                    height: 42*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // grandchampionuv5 (148:417)
              left: 954*fem,
              top: 171.8908691406*fem,
              child: Container(
                width: 176.4*fem,
                height: 149.43*fem,
                child: Stack(
                  children: [
                    Positioned(
                      // frameoEm (148:418)
                      left: 0*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 176.4*fem,
                          height: 136.26*fem,
                          child: Image.asset(
                            'assets/images/frame-98h.png',
                            width: 176.4*fem,
                            height: 136.26*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // profileimgFsT (148:436)
                      left: 47.3088378906*fem,
                      top: 41.0201416016*fem,
                      child: Align(
                        child: SizedBox(
                          width: 81.79*fem,
                          height: 89.43*fem,
                          child: Image.asset(
                            'assets/images/profile-img-BNm.png',
                            width: 81.79*fem,
                            height: 89.43*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // whitebgiW9 (148:439)
                      left: 45.7048339844*fem,
                      top: 38.9227294922*fem,
                      child: Align(
                        child: SizedBox(
                          width: 85.45*fem,
                          height: 93.43*fem,
                          child: Image.asset(
                            'assets/images/white-bg-Muw.png',
                            width: 85.45*fem,
                            height: 93.43*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // titlebaseb49 (148:440)
                      left: 29.6682128906*fem,
                      top: 124.8427734375*fem,
                      child: Align(
                        child: SizedBox(
                          width: 116.92*fem,
                          height: 21.23*fem,
                          child: Image.asset(
                            'assets/images/title-base-Qh3.png',
                            width: 116.92*fem,
                            height: 21.23*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // titlebase3wj (148:441)
                      left: 29.6682128906*fem,
                      top: 128.1951904297*fem,
                      child: Align(
                        child: SizedBox(
                          width: 116.92*fem,
                          height: 21.23*fem,
                          child: Image.asset(
                            'assets/images/title-base-aMb.png',
                            width: 116.92*fem,
                            height: 21.23*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // grandchampionX6D (148:442)
                      left: 42.458984375*fem,
                      top: 130.6596679688*fem,
                      child: Align(
                        child: SizedBox(
                          width: 94*fem,
                          height: 16*fem,
                          child: Text(
                            'Grand Champion',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Abhaya Libre',
                              fontSize: 13*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.18*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // championN6q (148:380)
              left: 598.6362304688*fem,
              top: 60.8908691406*fem,
              child: Container(
                width: 343.98*fem,
                height: 244.88*fem,
                child: Stack(
                  children: [
                    Positioned(
                      // frameSsP (148:381)
                      left: 0*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 343.98*fem,
                          height: 216.59*fem,
                          child: Image.asset(
                            'assets/images/frame-Wqj.png',
                            width: 343.98*fem,
                            height: 216.59*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // profileimgWsF (148:399)
                      left: 92.2486572266*fem,
                      top: 12.0041503906*fem,
                      child: Align(
                        child: SizedBox(
                          width: 159.48*fem,
                          height: 192.11*fem,
                          child: Image.asset(
                            'assets/images/profile-img-8bP.png',
                            width: 159.48*fem,
                            height: 192.11*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // whitebgPg9 (148:402)
                      left: 89.1215820312*fem,
                      top: 7.4985351562*fem,
                      child: Align(
                        child: SizedBox(
                          width: 166.61*fem,
                          height: 200.7*fem,
                          child: Image.asset(
                            'assets/images/white-bg-WHB.png',
                            width: 166.61*fem,
                            height: 200.7*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // titlebase53B (148:403)
                      left: 57.8507080078*fem,
                      top: 192.0660400391*fem,
                      child: Align(
                        child: SizedBox(
                          width: 227.99*fem,
                          height: 45.62*fem,
                          child: Image.asset(
                            'assets/images/title-base-Zt1.png',
                            width: 227.99*fem,
                            height: 45.62*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // titlebasewr5 (148:404)
                      left: 57.8507080078*fem,
                      top: 199.2685546875*fem,
                      child: Align(
                        child: SizedBox(
                          width: 227.99*fem,
                          height: 45.62*fem,
                          child: Image.asset(
                            'assets/images/title-base-47X.png',
                            width: 227.99*fem,
                            height: 45.62*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // champion2sX (148:405)
                      left: 144.2434692383*fem,
                      top: 208.2791748047*fem,
                      child: Align(
                        child: SizedBox(
                          width: 56*fem,
                          height: 16*fem,
                          child: Text(
                            'Champion',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Inknut Antiqua',
                              fontSize: 13*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.18*ffem/fem,
                              color: Color(0x5ecac3c3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // group1202onm (166:328)
              left: 0.2890625*fem,
              top: 20.1091918945*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(18.72*fem, 152*fem, 16.14*fem, 99.85*fem),
                width: 255*fem,
                height: 1102*fem,
                decoration: BoxDecoration (
                  color: Color(0x30d9d9d9),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // group1175aAZ (166:346)
                        margin: EdgeInsets.fromLTRB(3.28*fem, 0*fem, 0*fem, 21.99*fem),
                        padding: EdgeInsets.fromLTRB(15.06*fem, 12.21*fem, 30.63*fem, 12.21*fem),
                        width: double.infinity,
                        height: 102.6*fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // globeegD (166:349)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.06*fem, 0*fem),
                                width: 25.1*fem,
                                height: 32.07*fem,
                                child: Image.asset(
                                  'assets/images/home-page-SuB.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                // documentation9ss (166:348)
                                margin: EdgeInsets.fromLTRB(0*fem, 4.89*fem, 0*fem, 0*fem),
                                child: Text(
                                  'Home',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: Color(0xd1ffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 21.99*fem),
                      Container(
                        // group1175aAZ (166:346)
                        margin: EdgeInsets.fromLTRB(3.28*fem, 0*fem, 0*fem, 21.99*fem),
                        padding: EdgeInsets.fromLTRB(15.06*fem, 12.21*fem, 30.63*fem, 12.21*fem),
                        width: double.infinity,
                        height: 102.6*fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // globeegD (166:349)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.06*fem, 0*fem),
                                width: 25.1*fem,
                                height: 32.07*fem,
                                child: Image.asset(
                                  'assets/images/trophee-du-championnat-1-8BX.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                // documentation9ss (166:348)
                                margin: EdgeInsets.fromLTRB(0*fem, 4.89*fem, 0*fem, 0*fem),
                                child: Text(
                                  'Classement',
                                  style: SafeGoogleFont (
                                    'Inter',
                                    fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: Color(0xd1ffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 21.99*fem),
                      Container(
                        // group1175aAZ (166:346)
                        margin: EdgeInsets.fromLTRB(3.28*fem, 0*fem, 0*fem, 21.99*fem),
                        padding: EdgeInsets.fromLTRB(15.06*fem, 12.21*fem, 30.63*fem, 12.21*fem),
                        width: double.infinity,
                        height: 102.6*fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // globeegD (166:349)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.06*fem, 0*fem),
                                width: 25.1*fem,
                                height: 32.07*fem,
                                child: Image.asset(
                                  'assets/images/discord-new.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                // documentation9ss (166:348)
                                margin: EdgeInsets.fromLTRB(0*fem, 4.89*fem, 0*fem, 0*fem),
                                child: Text(
                                  'Levels',
                                  style: SafeGoogleFont (
                                    'Inter',
                                    fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: Color(0xd1ffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 21.99*fem),
                      Container(
                        // group1175aAZ (166:346)
                        margin: EdgeInsets.fromLTRB(3.28*fem, 0*fem, 0*fem, 21.99*fem),
                        padding: EdgeInsets.fromLTRB(15.06*fem, 12.21*fem, 30.63*fem, 12.21*fem),
                        width: double.infinity,
                        height: 102.6*fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // globeegD (166:349)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.06*fem, 0*fem),
                                width: 25.1*fem,
                                height: 32.07*fem,
                                child: Image.asset(
                                  'assets/images/student-center-M3B.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                // documentation9ss (166:348)
                                margin: EdgeInsets.fromLTRB(0*fem, 4.89*fem, 0*fem, 0*fem),
                                child: Text(
                                  'Education',
                                  style: SafeGoogleFont (
                                    'Inter',
                                    fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: Color(0xd1ffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 21.99*fem),
                      Container(
                        // group1175aAZ (166:346)
                        margin: EdgeInsets.fromLTRB(3.28*fem, 0*fem, 0*fem, 21.99*fem),
                        padding: EdgeInsets.fromLTRB(15.06*fem, 12.21*fem, 30.63*fem, 12.21*fem),
                        width: double.infinity,
                        height: 102.6*fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // globeegD (166:349)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.06*fem, 0*fem),
                                width: 25.1*fem,
                                height: 32.07*fem,
                                child: Image.asset(
                                  'assets/images/globe.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                // documentation9ss (166:348)
                                margin: EdgeInsets.fromLTRB(0*fem, 4.89*fem, 0*fem, 0*fem),
                                child: Text(
                                  'Documentation',
                                  style: SafeGoogleFont (
                                    'Inter',
                                    fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: Color(0xd1ffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 21.99*fem),
                      Container(
                        // group1176e3w (166:350)
                        margin: EdgeInsets.fromLTRB(3.28*fem, 0*fem, 0*fem, 21.99*fem),
                        padding: EdgeInsets.fromLTRB(15.06*fem, 12.21*fem, 39.63*fem, 12.21*fem),
                        width: double.infinity,
                        height: 102.6*fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // laptopplayvideoJ8V (166:353)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.06*fem, 0*fem),
                                width: 25.1*fem,
                                height: 32.07*fem,
                                child: Image.asset(
                                  'assets/images/laptop-play-video-757.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                // entertainmentPfj (166:352)
                                margin: EdgeInsets.fromLTRB(0*fem, 4.89*fem, 0*fem, 0*fem),
                                child: Text(
                                  'Entertainment',
                                  style: SafeGoogleFont (
                                    'Inter',
                                    fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: Color(0xd1ffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 21.99*fem),
                      Container(
                        // group1177VCy (166:354)
                        margin: EdgeInsets.fromLTRB(3.28*fem, 0*fem, 0*fem, 0*fem),
                        padding: EdgeInsets.fromLTRB(15.06*fem, 7.33*fem, 43.63*fem, 7.33*fem),
                        width: double.infinity,
                        height: 102.6*fem,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Scene(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // writerfemaleMky (166:357)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.06*fem, 0*fem),
                                width: 25.1*fem,
                                height: 32.07*fem,
                                child: Image.asset(
                                  'assets/images/writer-female-pKF.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                // studenthubs49b (166:356)
                                margin: EdgeInsets.fromLTRB(0*fem, 9.77*fem, 0*fem, 0*fem),
                                child: Text(
                                  'Student Hubs',
                                  style: SafeGoogleFont (
                                    'Inter',
                                    fontSize: 18*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125*ffem/fem,
                                    color: Color(0xd1ffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              // codeninja6removebgpreview3a6y (145:274)
              left: 37*fem,
              top: 7.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 234*fem,
                  height: 164*fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Image.asset(
                      'assets/images/codeninja6-removebg-preview-3-3YH.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // masteroVX (148:444)
              left: 451*fem,
              top: 201.8908691406*fem,
              child: Container(
                width: 131.67*fem,
                height: 117.75*fem,
                child: Stack(
                  children: [
                    Positioned(
                      // framegpD (148:445)
                      left: 13.9440917969*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 104.2*fem,
                          height: 104.15*fem,
                          child: Image.asset(
                            'assets/images/frame-15w.png',
                            width: 104.2*fem,
                            height: 104.15*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // profileimgAUV (148:463)
                      left: 19.8660888672*fem,
                      top: 5.7722167969*fem,
                      child: Align(
                        child: SizedBox(
                          width: 92.11*fem,
                          height: 92.37*fem,
                          child: Image.asset(
                            'assets/images/profile-img-2iH.png',
                            width: 92.11*fem,
                            height: 92.37*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // whitebgqKj (148:466)
                      left: 18.0598144531*fem,
                      top: 3.6057128906*fem,
                      child: Align(
                        child: SizedBox(
                          width: 96.23*fem,
                          height: 96.51*fem,
                          child: Image.asset(
                            'assets/images/white-bg-nFw.png',
                            width: 96.23*fem,
                            height: 96.51*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // titlebasehsj (148:467)
                      left: 0*fem,
                      top: 92.3549804688*fem,
                      child: Align(
                        child: SizedBox(
                          width: 131.67*fem,
                          height: 21.93*fem,
                          child: Image.asset(
                            'assets/images/title-base-pz9.png',
                            width: 131.67*fem,
                            height: 21.93*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // titlebasey4Z (148:468)
                      left: 0*fem,
                      top: 95.8184814453*fem,
                      child: Align(
                        child: SizedBox(
                          width: 131.67*fem,
                          height: 21.93*fem,
                          child: Image.asset(
                            'assets/images/title-base-Nfw.png',
                            width: 131.67*fem,
                            height: 21.93*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // masterTEd (148:469)
                      left: 47.0657958984*fem,
                      top: 100.1510009766*fem,
                      child: Align(
                        child: SizedBox(
                          width: 38*fem,
                          height: 16*fem,
                          child: Text(
                            'Master',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Abhaya Libre',
                              fontSize: 13*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.18*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // rectangle7iRT (148:571)
              left: 396*fem,
              top: 500.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 155*fem,
                  height: 122*fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(20*fem),
                        border: Border.all(color: Color(0xff000000)),
                        color: Color(0xedffffff),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3f000000),
                            offset: Offset(0*fem, 4*fem),
                            blurRadius: 2*fem,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // 7iV (148:572)
              left: 489*fem,
              top: 552.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 71*fem,
                  child: Text(
                    '01',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Nunito',
                      fontSize: 40*ffem,
                      fontWeight: FontWeight.w800,
                      height: 1.775*ffem/fem,
                      color: Color(0xffbe002d),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactiondone24pxMsj (148:573)
              left: 411.9144287109*fem,
              top: 527.3159179688*fem,
              child: Align(
                child: SizedBox(
                  width: 32.17*fem,
                  height: 25.15*fem,
                  child: Image.asset(
                    'assets/images/icon-action-done24px-q57.png',
                    width: 32.17*fem,
                    height: 25.15*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // iconactiondone24pxoDw (164:1233)
              left: 1231.9143066406*fem,
              top: 684.3159179688*fem,
              child: Align(
                child: SizedBox(
                  width: 32.17*fem,
                  height: 25.15*fem,
                  child: Image.asset(
                    'assets/images/icon-action-done24px-vny.png',
                    width: 32.17*fem,
                    height: 25.15*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle860TJV (164:1228)
              left: 1393*fem,
              top: 166.8908691406*fem,
              child: Align(
                child: SizedBox(
                  width: 380*fem,
                  height: 51*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(10*fem),
                      color: Color(0x916d8877),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
        )
    );
  }
}