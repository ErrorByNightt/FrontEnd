import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isHoveringName = false;
  bool isHoveringParis = false;
  bool isHoveringDevWeb = false;
  bool isHoveringEtudiant = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.red.withOpacity(0.9),
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

                Stack(
                  children:[


                    Image.asset(
                      'assets/images/chichbich.png',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.maxFinite,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 20,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/images/dragon.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.edit, color: Colors.black),
                                onPressed: () {
                                  // Action à effectuer lorsqu'on appuie sur l'icône d'édition
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 140,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MouseRegion(
                            onEnter: (_) => setState(() => isHoveringName = true),
                            onExit: (_) => setState(() => isHoveringName = false),
                            child: GestureDetector(
                              onTap: () {
                                // action à effectuer lors du clic sur l'icône d'édition


                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(40.0),
                                      child: AlertDialog(
                                        title: Center(
                                          child: Stack(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: <Widget>[
                                              // Stroked text as border.
                                              /*  Text(
                                      'Forget Password ?',
                                      style: TextStyle(
                                        fontSize: 40,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 6
                                          ..color =
                                              Color.fromARGB(255, 239, 150, 150),
                                      ),
                                  ),*/
                                              // Solid text as fill.
                                              const Text(
                                                'MODIFIER VOTRE PSEUDO',
                                                style: TextStyle(
                                                  fontSize: 40,
                                                  color: Color.fromARGB(255, 223, 91, 91),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        content: Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [

                                              Row(
                                                children: [
                                                  const Text(
                                                    'Pseudo',
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              TextField(
                                                textAlign: TextAlign.start, //Ajout de cette ligne pour centrer le texte
                                                //controller: _emailCtrl,
                                                decoration: InputDecoration(
                                                  hintText: 'dhia bouslimi',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey.shade600),
                                                  border: const OutlineInputBorder(
                                                      borderSide: BorderSide.none,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(12)
                                                      )
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.grey.shade200,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),



                                        actions: [
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                SizedBox(
                                                  width: 150,
                                                  child: ElevatedButton(
                                                    onPressed: () {

                                                    },
                                                    child: Text('CONFIRMER',style: TextStyle(color: Colors.black),),
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Color.fromARGB(255, 194, 67,
                                                          67), // couleur de fond du bouton
                                                      onPrimary: Colors
                                                          .white, // couleur du texte du bouton
                                                    ),
                                                    // Rest of the code
                                                  ),
                                                ),

                                                SizedBox(width: 20,),

                                                SizedBox(
                                                  width: 150,
                                                  child:  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();

                                                    },
                                                    child: Text('CANCEL',style: TextStyle(color: Colors.black),),
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Colors.grey[200],// couleur de fond du bouton
                                                      onPrimary: Colors
                                                          .white, // couleur du texte du bouton
                                                    ),
                                                    // Rest of the code
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    );
                                  },
                                );

                              },
                              child: Row(
                                children: [

                                  Text(
                                    'Dhia Bouslimi',
                                    style: TextStyle(
                                      color: isHoveringName ? Colors.grey : Colors.red,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.edit,
                                    size: 18,
                                    color: isHoveringName ? Colors.black : Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 30),

                          MouseRegion(
                            onEnter: (_) => setState(() => isHoveringParis = true),
                            onExit: (_) => setState(() => isHoveringParis = false),
                            child: GestureDetector(
                              onTap: () {
                                // action à effectuer lors du clic sur l'icône d'édition
                                print("okkkkk");

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Center(
                                        child: Stack(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: <Widget>[
                                            // Stroked text as border.
                                            /*  Text(
                                    'Forget Password ?',
                                    style: TextStyle(
                                      fontSize: 40,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 6
                                        ..color =
                                            Color.fromARGB(255, 239, 150, 150),
                                    ),
                                  ),*/
                                            // Solid text as fill.
                                            const Text(
                                              'Forget Password  ?',
                                              style: TextStyle(
                                                fontSize: 40,
                                                color: Color.fromARGB(255, 223, 91, 91),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      content: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Enter your email address to receive a password reset link.',
                                            ),
                                            TextField(
                                              //controller: _emailCtrl,
                                              decoration: InputDecoration(
                                                  hintText: 'Entre your E-mail',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey.shade600),
                                                  prefixIcon: const Icon(
                                                    CupertinoIcons.mail,
                                                    color: Color.fromARGB(
                                                        255, 237, 115, 115),
                                                    size: 18,
                                                  ),
                                                  border: const OutlineInputBorder(
                                                      borderSide: BorderSide.none,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(12))),
                                                  filled: true,
                                                  fillColor: Colors.grey.shade200),
                                            ),
                                          ],
                                        ),
                                      ),

                                      actions: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              SizedBox(
                                                width: 150,
                                                child: ElevatedButton(
                                                  onPressed: () {

                                                  },
                                                  child: Text('CONFIRMER',style: TextStyle(color: Colors.black),),
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(255, 194, 67,
                                                        67), // couleur de fond du bouton
                                                    onPrimary: Colors
                                                        .white, // couleur du texte du bouton
                                                  ),
                                                  // Rest of the code
                                                ),
                                              ),

                                              SizedBox(width: 20,),

                                              SizedBox(
                                                width: 150,
                                                child:  ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();

                                                  },
                                                  child: Text('CANCEL',style: TextStyle(color: Colors.black),),
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.grey[200],// couleur de fond du bouton
                                                    onPrimary: Colors
                                                        .white, // couleur du texte du bouton
                                                  ),
                                                  // Rest of the code
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    );
                                  },
                                );

                              },
                              child: Row(


                                    children: [
                                      Icon(Icons.work, color: Colors.black),
                                      SizedBox(width: 5),

                                      Text(
                                        'Paris, France',
                                        style: TextStyle(
                                          color: isHoveringParis ? Colors.grey : Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.edit,
                                        size: 18,
                                        color: isHoveringParis ? Colors.black : Colors.transparent,
                                      ),
                                    ],








                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          MouseRegion(
                            onEnter: (_) => setState(() => isHoveringDevWeb = true),
                            onExit: (_) => setState(() => isHoveringDevWeb = false),
                            child: Row(
                              children: [
                                Icon(Icons.work, color: Colors.black),
                                SizedBox(width: 5),
                                Text(
                                  'Développeur Web',
                                  style: TextStyle(
                                    color: isHoveringDevWeb ? Colors.grey : Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: isHoveringDevWeb ? Colors.black : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          MouseRegion(
                            onEnter: (_) => setState(() => isHoveringEtudiant = true),
                            onExit: (_) => setState(() => isHoveringEtudiant = false),
                            child: Row(
                              children: [
                                Icon(Icons.school, color: Colors.black),
                                SizedBox(width: 5),
                                Text(
                                  'Étudiant en Informatique',
                                  style: TextStyle(
                                    color: isHoveringEtudiant ? Colors.grey : Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: isHoveringEtudiant ? Colors.black : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 40,

                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(5,5),
                            bottomRight: Radius.zero,

                          ),
                        ),
                        child: Text(
                          'Ajouter une couverture',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),


            Card(
                    color: Colors.orange[200],
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Progression',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                '20%',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            child: CircularProgressIndicator(
                              value: 0.2,
                              strokeWidth: 15.0,
                              backgroundColor: Colors.redAccent[200],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(

                      constraints: BoxConstraints(
                        minWidth: 200.0,
                        minHeight: 300.0,
                        maxWidth: 400.0,
                        maxHeight: 500.0,

                      ),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
                        color: Colors.orange[200],
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Classement',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Position',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    'Score',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Divider(height: 20.0, thickness: 1.0),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Python',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    '1500',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Divider(height: 20.0, thickness: 1.0),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Java',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    '1300',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),


                              SizedBox(height: 10.0),
                              Divider(height: 20.0, thickness: 1.0),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Spring',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    '1100',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Divider(height: 20.0, thickness: 1.0),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Android',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    '1300',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),

                            ],

                          ),),),
                    ),
                    SizedBox(width: 30.0),

                    Container(

                      constraints: BoxConstraints(
                        minWidth: 200.0,
                        minHeight: 300.0,
                        maxWidth: 400.0,
                        maxHeight: 500.0,

                      ),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
                        color: Colors.orange[200],
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Classement',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Position',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    'Score',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Divider(height: 20.0, thickness: 1.0),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Python',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    '1500',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Divider(height: 20.0, thickness: 1.0),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Java',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    '1300',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),


                              SizedBox(height: 10.0),
                              Divider(height: 20.0, thickness: 1.0),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Spring',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    '1100',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Divider(height: 20.0, thickness: 1.0),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Android',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    '1300',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),

                            ],

                          ),),),
                    ),
                    SizedBox(width: 10.0),


   Container(
        constraints: BoxConstraints(
          minWidth: 200.0,
          minHeight: 200.0,
          maxWidth: 250.0,
          maxHeight: 250.0,

        ),
        child: Card(
          color: Colors.orange[200],

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(


            children: [
              SizedBox(height: 10.0),

              Row(
              children: [
                Text("À propos de moi"),
                SizedBox(width: 10.0),

                Icon(Icons.edit),

              ],
            ),
              SizedBox(height: 20.0),

        Row(
        children: [
            Text("Présentez-vous à la communauté"),
        ],
        ),
        ],
        ),
          ),

        ),
      ),

                  ],
                ),
                Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SUCCES',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '10%',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(35.0),
                            border: Border.all(color: Colors.blue, width: 5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(
                              value: 0.1,
                              strokeWidth: 4.0,
                              backgroundColor: Colors.grey[200],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
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
        );
  }
}