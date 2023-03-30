import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_coding_game/Screens/utils.dart';

class Scene extends StatelessWidget {
  const Scene({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 1908.96875;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      backgroundColor: Colors.transparent,
      /*  appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 16, 10).withOpacity(0.9),
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
      ),*/
      body: Container(
        // width: double.infinity,

        child: SingleChildScrollView(
          child: Container(
            // frame16Gr9 (166:186)
            width: double.infinity,
            height: 1114.11*fem,
            child: Stack(
              children: [
                Positioned(
                  // rectangle840LLD (166:187)
                  left: 0*fem,
                  top: 12*fem,
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
                  // rectangle861jdF (169:230)
                  left: 996*fem,
                  top: 765*fem,
                  child: Align(
                    child: SizedBox(
                      width: 181*fem,
                      height: 172*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(20*fem),
                          color: Color(0x93d9d9d9),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle3511Ks (166:449)
                  left: 620*fem,
                  top: 236*fem,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur (
                        sigmaX: 2*fem,
                        sigmaY: 2*fem,
                      ),
                      child: Align(
                        child: SizedBox(
                          width: 1017*fem,
                          height: 327*fem,
                          child: Container(
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(20*fem),
                              color: Color(0x3f1f1f1f),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview8SAH (169:229)
                  left: 1454*fem,
                  top: 807*fem,
                  child: Align(
                    child: SizedBox(
                      width: 134*fem,
                      height: 112*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-8.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview1idb (169:225)
                  left: 615*fem,
                  top: 807*fem,
                  child: Align(
                    child: SizedBox(
                      width: 120*fem,
                      height: 106*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview5Pzd (169:227)
                  left: 1607*fem,
                  top: 803*fem,
                  child: Align(
                    child: SizedBox(
                      width: 168*fem,
                      height: 122*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-5.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview3V25 (169:228)
                  left: 425*fem,
                  top: 796*fem,
                  child: Align(
                    child: SizedBox(
                      width: 182*fem,
                      height: 101*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // goodboy55yhw (169:223)
                  left: 1397*fem,
                  top: 513*fem,
                  child: Align(
                    child: SizedBox(
                      width: 191*fem,
                      height: 45*fem,
                      child: Text(
                        'GOODBOY55',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 30*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // goodboy55SrR (169:224)
                  left: 618*fem,
                  top: 513*fem,
                  child: Align(
                    child: SizedBox(
                      width: 191*fem,
                      height: 45*fem,
                      child: Text(
                        'GOODBOY55',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 30*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview6uzu (166:455)
                  left: 1203*fem,
                  top: 757*fem,
                  child: Align(
                    child: SizedBox(
                      width: 251*fem,
                      height: 222*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-6.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview4QAy (166:456)
                  left: 970*fem,
                  top: 744*fem,
                  child: Align(
                    child: SizedBox(
                      width: 233*fem,
                      height: 207*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-4.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // metaimageremovebgpreview7Giy (166:457)
                  left: 773*fem,
                  top: 774*fem,
                  child: Align(
                    child: SizedBox(
                      width: 160*fem,
                      height: 153*fem,
                      child: Image.asset(
                        'assets/images/meta-image-removebg-preview-7.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group9102ZCH (166:188)
                  left: 364.5*fem,
                  top: 0*fem,
                  child: Container(
                    width: 625*fem,
                    height: 207*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // group3THf (166:190)
                          left: 182.5*fem,
                          top: 105*fem,
                          child: Container(
                            width: 198*fem,
                            height: 59*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // ellipse1Kqf (166:192)
                                  margin: EdgeInsets.fromLTRB(0*fem, 5.02*fem, 50.03*fem, 0*fem),
                                  width: 20.97*fem,
                                  height: 15.24*fem,
                                  child: Image.asset(
                                    'assets/images/ellipse-1-AJZ.png',
                                    width: 20.97*fem,
                                    height: 15.24*fem,
                                  ),
                                ),
                                Container(
                                  // vsPqX (166:191)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37.03*fem, 0*fem),
                                  child: Text(
                                    'VS\n',
                                    style: SafeGoogleFont (
                                      'Montserrat',
                                      fontSize: 48*ffem,
                                      fontWeight: FontWeight.w900,
                                      height: 1.2175*ffem/fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  // ellipse2GuK (166:193)
                                  margin: EdgeInsets.fromLTRB(0*fem, 5.02*fem, 0*fem, 0*fem),
                                  width: 20.97*fem,
                                  height: 15.24*fem,
                                  child: Image.asset(
                                    'assets/images/ellipse-2-tVT.png',
                                    width: 20.97*fem,
                                    height: 15.24*fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          // challenge9y7 (166:194)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 625*fem,
                              height: 207*fem,
                              child: Text(
                                'CHALLENGE',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Inknut Antiqua',
                                  fontSize: 80*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 2.5775*ffem/fem,
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
                                    'assets/images/home-page-SuB.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  // documentation9ss (166:348)
                                  margin: EdgeInsets.fromLTRB(0*fem, 4.89*fem, 0*fem, 0*fem),
                                  child: Text(
                                    'Home',
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
                        Container(
                          // group1173XGq (166:338)
                          margin: EdgeInsets.fromLTRB(3.28*fem, 0*fem, 0*fem, 0*fem),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(15.06*fem, 7.33*fem, 105.63*fem, 7.33*fem),
                              width: double.infinity,
                              height: 124.59*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // discordnewj81 (166:341)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 16.06*fem, 0*fem),
                                    width: 25.1*fem,
                                    height: 32.07*fem,
                                    child: Image.asset(
                                      'assets/images/discord-new.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    // levelsQzq (166:340)
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
                        ),
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
                        Container(
                          // group1177VCy (166:354)
                          margin: EdgeInsets.fromLTRB(3.28*fem, 0*fem, 0*fem, 0*fem),
                          padding: EdgeInsets.fromLTRB(15.06*fem, 7.33*fem, 43.63*fem, 7.33*fem),
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
                Positioned(
                  // codeninja6removebgpreview39gq (166:358)
                  left: 37*fem,
                  top: 28*fem,
                  child: Align(
                    child: SizedBox(
                      width: 234*fem,
                      height: 164*fem,
                      child: Image.asset(
                        'assets/images/codeninja6-removebg-preview-3-GNZ.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group221RPT (166:360)
                  left: 1569.2890625*fem,
                  top: 41.1091918945*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 10.73*fem, 0*fem),
                    width: 246*fem,
                    height: 57*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // avatar1tnq (166:363)
                          width: 68*fem,
                          height: 57*fem,
                          child: Image.asset(
                            'assets/images/avatar-1-NJH.png',
                          ),
                        ),
                        Container(
                          // homepagedesigndEd (166:364)
                          margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 13.73*fem, 0*fem),
                          child: Text(
                            'MayssaMejri',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w500,
                              height: 0.65*ffem/fem,
                              letterSpacing: 0.5*fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Opacity(
                          // arrowchevrondowntwF (166:361)
                          opacity: 0.5,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 7*fem, 0*fem, 0*fem),
                            width: 21.54*fem,
                            height: 12.99*fem,
                            child: Image.asset(
                              'assets/images/arrow-chevrondown-bc9.png',
                              width: 21.54*fem,
                              height: 12.99*fem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // vectorA85 (166:365)
                  left: 1833.2890625*fem,
                  top: 58.1091918945*fem,
                  child: Align(
                    child: SizedBox(
                      width: 25*fem,
                      height: 30*fem,
                      child: Image.asset(
                        'assets/images/vector-UeZ.png',
                        width: 25*fem,
                        height: 30*fem,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // player1dnM (166:370)
                  left: 1579*fem,
                  top: 221.1296386719*fem,
                  child: Container(
                    width: 235*fem,
                    height: 58.3*fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // framevFf (I166:370;27:1133)
                          width: 55*fem,
                          height: 58.3*fem,
                          child: Image.asset(
                            'assets/images/frame.png',
                            width: 55*fem,
                            height: 58.3*fem,
                          ),
                        ),
                        Container(
                          // autogroupb2usdA5 (8jTD4sB7dRyGY5mTaMB2us)
                          padding: EdgeInsets.fromLTRB(12*fem, 8.16*fem, 0*fem, 11.15*fem),
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupmanyvus (8jTCpnkEfszuGK1pZPmany)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                                width: 134*fem,
                                height: double.infinity,
                              ),
                              Container(
                                // autogroupajysEvZ (8jTCwctBwWSsvAXaG1aJys)
                                margin: EdgeInsets.fromLTRB(0*fem, 0.66*fem, 0*fem, 0*fem),
                                width: 10*fem,
                                height: 11.66*fem,
                                child: Image.asset(
                                  'assets/images/auto-group-ajys.png',
                                  width: 10*fem,
                                  height: 11.66*fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // pxsmpwario1u17 (166:451)
                  left: 1375*fem,
                  top: 194*fem,
                  child: Align(
                    child: SizedBox(
                      width: 253*fem,
                      height: 315*fem,
                      child: Image.asset(
                        'assets/images/px-smpwario-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // sonicthehedgehogtysonhessepose (166:452)
                  left: 606*fem,
                  top: 208*fem,
                  child: Align(
                    child: SizedBox(
                      width: 234*fem,
                      height: 308*fem,
                      child: Image.asset(
                        'assets/images/sonicthehedgehogtysonhesseposeissue1bykolnzberserkdd40fdm-fullview-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // premiumvectorversusgamecoverba (166:453)
                  left: 874*fem,
                  top: 221*fem,
                  child: Align(
                    child: SizedBox(
                      width: 379*fem,
                      height: 362*fem,
                      child: Image.asset(
                        'assets/images/premiumvectorversusgamecoverbannersportvsteamconcept-removebg-preview-1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // choosealanguageriy (166:458)
                  left: 889.5*fem,
                  top: 650*fem,
                  child: Align(
                    child: SizedBox(
                      width: 433*fem,
                      height: 61*fem,
                      child: Text(
                        'Choose a language',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Irish Grover',
                          fontSize: 50*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.21*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // playJL5 (166:460)
                  left: 1025.5*fem,
                  top: 991*fem,
                  child: Align(
                    child: SizedBox(
                      width: 84*fem,
                      height: 71*fem,
                      child: Text(
                        'Play',
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
                  // rectangle6x9j (229:207)
                  left: 876*fem,
                  top: 979*fem,
                  child: Align(
                    child: SizedBox(
                      width: 377*fem,
                      height: 104*fem,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom (
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(60*fem),
                            border: Border.all(color: Color(0xff000000)),
                            color: Color(0xff3d87ff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // playCZs (229:208)
                  left: 1018*fem,
                  top: 997*fem,
                  child: Align(
                    child: SizedBox(
                      width: 94*fem,
                      height: 71*fem,
                      child: Text(
                        'Play',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Nunito',
                          fontSize: 45*ffem,
                          fontWeight: FontWeight.w800,
                          height: 1.5777777778*ffem/fem,
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
      ),
    );
  }
}