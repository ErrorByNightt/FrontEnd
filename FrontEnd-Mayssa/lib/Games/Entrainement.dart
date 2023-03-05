import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:project_coding_game/models/itemModel.dart';

class Entrainement extends StatefulWidget {
  const Entrainement({super.key});

  @override
  State<Entrainement> createState() => _EntrainementState();
}

class _EntrainementState extends State<Entrainement> {
  var player = AudioPlayer();
  late List<ItemModel> items;
  late List<ItemModel> items2;
  late int score;
  //late String scoree;
  late bool gameOver;

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(
          name: 'System.out.println("Hello, World!");',
          icon: 'assets/images/Java-tutorials-modified.png',
          value: 'JAVA'),
      ItemModel(
          name: 'print(‘Hello World’)',
          icon:
              'assets/images/61d42d538aec6733243470a7_Python-logo-modified.png',
          value: 'Python'),
      ItemModel(
          name: 'echo "Hello World!";',
          icon: 'assets/images/images (1)-modified.png',
          value: 'PHP'),
      ItemModel(
          name: 'std::cout << "Hello World!";',
          icon: 'assets/images/ISO_C++_Logo.svg-modified.png',
          value: 'C++'),
      ItemModel(
          name: 'console.log("Hello World");',
          icon: 'assets/images/javascript-modified.png',
          value: 'JavaScript')
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) gameOver = true;
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
          body: SafeArea(
            child: SingleChildScrollView(
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(
                          text: 'SCORE :  ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              letterSpacing: 2,
                              fontFamily: 'Inika')
                          //   style: Theme.of(context).textTheme.subtitle1,
                          ),
                      TextSpan(
                          text: '$score',
                          //! text: "100",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 39, 189, 28),
                              fontSize: 60,
                              letterSpacing: 1,
                              fontFamily: 'Inika'))
                    ])),
                  ),
                  const SizedBox(height: 30),
                  if (!gameOver)
                    Row(
                      children: [
                        const Spacer(),
                        Column(
                          children: items.map((item) {
                            return Container(
                              margin: const EdgeInsets.all(8),
                              child: Draggable<ItemModel>(
                                data: item,
                                childWhenDragging: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 139, 76, 76),
                                  backgroundImage: AssetImage(item.icon),
                                  radius: 50,
                                ),
                                feedback: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(item.icon),
                                  radius: 50,
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(item.icon),
                                  radius: 50,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const Spacer(flex: 2),
                        Column(
                          children: items2.map((item) {
                            return DragTarget<ItemModel>(
                                onAccept: (receivedItem) {
                                  if (item.value == receivedItem.value) {
                                    setState(() {
                                      items.remove(receivedItem);
                                      items2.remove(item);
                                    });
                                    score += 10;
                                    item.accepting = false;
                                    player.play(AssetSource('images/true.wav'));

                                    //player.play('true.wav');
                                  } else {
                                    setState(() {
                                      score -= 5;
                                      item.accepting = false;
                                      player
                                          .play(AssetSource('imagesfalse.wav'));
                                    });
                                  }
                                },
                                onWillAccept: (receivedItem) {
                                  setState(() {
                                    item.accepting = true;
                                  });
                                  return true;
                                },
                                onLeave: (receivedItem) {
                                  setState(() {
                                    item.accepting = false;
                                  });
                                },
                                builder: (context, acceptedItems,
                                        rejectedItems) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: item.accepting
                                            ? Color.fromARGB(197, 55, 100, 173)
                                            : Color.fromARGB(
                                                118, 209, 120, 120),
                                      ),
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              10,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      margin: const EdgeInsets.all(8),
                                      child: Text(item.name,
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 20,
                                          )),
                                    ));
                          }).toList(),
                        ),
                        const Spacer(),
                      ],
                    ),
                  if (gameOver)
                    Center(
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text("Game Over ⌛️",
                              style: TextStyle(
                                  fontSize: 60,
                                  letterSpacing: 3,
                                  fontFamily: 'Inika',
                                  color: Colors.white)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(result()),
                        )
                      ]),
                    ),
                  if (gameOver)
                    Container(
                      // height: MediaQuery.of(context).size.width / 10,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(208, 105, 215, 109),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              initGame();
                            });
                          },
                          child: const Text(
                            'New Game ↩️',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          )),
                    )
                ],
              ),
            ),
          ),
        ));
  }

  String result() {
    if (score == 100) {
      player.play(AssetSource('images/succes.wav'));
      return 'Awesome';
    } else {
      player.play(AssetSource('images/tryAgain.wav'));
      //  player.play('tryAgain.wav');
      return 'Play Again to get better score';
    }
  }
}
