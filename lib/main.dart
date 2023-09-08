import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'settings.dart';

void main() {
  runApp(const MyApp());
}

class LifeBar {
  minusIcon() {
    return const Icon(
      Icons.remove_circle_outline,
      size: 40.0,
      color: Colors.white,
    );
  }

  plusIcon() {
    return const Icon(
      Icons.add_circle_outline,
      size: 40.0,
      color: Colors.white,
    );
  }

  textStyle() {
    return const TextStyle(
      fontSize: 50.0,
      fontFamily: 'Josefin',
      color: Colors.white,
    );
  }

  decoration(String bgimage) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      boxShadow: const [
        BoxShadow(
          color: Colors.white,
          blurRadius: 7.0,
        ),
      ],
      image: DecorationImage(image: AssetImage('$bgimage'), fit: BoxFit.cover),
    );
  }
}

Settings settings = Settings();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(backgroundColor: Colors.black, body: LifeReset()),
    );
  }
}

class LifeReset extends StatefulWidget {
  const LifeReset({super.key});

  @override
  State<LifeReset> createState() => _LifeResetState();
}

class _LifeResetState extends State<LifeReset> {
  int person = settings.playerNum;

  List<int> lifeCounter = [
    settings.initialLife,
    settings.initialLife,
    settings.initialLife,
    settings.initialLife
  ];

  void lifeReset() {
    int life = settings.initialLife;
    setState(() {
      person = settings.playerNum;
      lifeCounter = [life, life, life, life];
    });
  }

  void lifeMinus(int player) => setState(() {
        if (lifeCounter[player] > 0) {
          lifeCounter[player]--;
        }
      });
  void lifePlus(int player) => setState(() {
        lifeCounter[player]++;
      });

  @override
  Widget build(BuildContext context) {
    switch (person) {
      case 2:
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: LifeBar().decoration('assets/forest.jpg'),
                    child: Center(
                      child: Transform.rotate(
                        angle: -math.pi,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                lifeMinus(0);
                              },
                              icon: LifeBar().minusIcon(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                lifeCounter[0].toString(),
                                style: LifeBar().textStyle(),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                lifePlus(0);
                              },
                              icon: LifeBar().plusIcon(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        lifeReset();
                      },
                      child: const Icon(Icons.restart_alt),
                    ),
                    TextButton(
                      onPressed: () => _dialogOpen(context),
                      child: const Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: LifeBar().decoration('assets/island.jpg'),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              lifeMinus(1);
                            },
                            icon: LifeBar().minusIcon(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              lifeCounter[1].toString(),
                              style: LifeBar().textStyle(),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              lifePlus(1);
                            },
                            icon: LifeBar().plusIcon(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      case 3:
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration:
                                LifeBar().decoration('assets/plains.jpg'),
                            child: Transform.rotate(
                              angle: math.pi / 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {
                                      lifeMinus(0);
                                    },
                                    icon: LifeBar().minusIcon(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      lifeCounter[0].toString(),
                                      style: LifeBar().textStyle(),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      lifePlus(0);
                                    },
                                    icon: LifeBar().plusIcon(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration:
                                LifeBar().decoration('assets/island2.jpg'),
                            child: Transform.rotate(
                              angle: -math.pi / 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {
                                      lifeMinus(1);
                                    },
                                    icon: LifeBar().minusIcon(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      lifeCounter[1].toString(),
                                      style: LifeBar().textStyle(),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      lifePlus(1);
                                    },
                                    icon: LifeBar().plusIcon(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                color: Colors.black,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        lifeReset();
                      },
                      child: Icon(Icons.restart_alt),
                    ),
                    TextButton(
                      onPressed: () => _dialogOpen(context),
                      child: Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: LifeBar().decoration('assets/mountain.jpg'),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              lifeMinus(2);
                            },
                            icon: LifeBar().minusIcon(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              lifeCounter[2].toString(),
                              style: LifeBar().textStyle(),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              lifePlus(2);
                            },
                            icon: LifeBar().plusIcon(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      case 4:
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration:
                              LifeBar().decoration('assets/mountain2.jpg'),
                          child: Transform.rotate(
                            angle: math.pi / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    lifeMinus(0);
                                  },
                                  icon: LifeBar().minusIcon(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    lifeCounter[0].toString(),
                                    style: LifeBar().textStyle(),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    lifePlus(0);
                                  },
                                  icon: LifeBar().plusIcon(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration:
                              LifeBar().decoration('assets/plains2.jpg'),
                          child: Transform.rotate(
                            angle: -math.pi / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    lifeMinus(1);
                                  },
                                  icon: LifeBar().minusIcon(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    lifeCounter[1].toString(),
                                    style: LifeBar().textStyle(),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    lifePlus(1);
                                  },
                                  icon: LifeBar().plusIcon(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        lifeReset();
                      },
                      child: Icon(Icons.restart_alt),
                    ),
                    TextButton(
                      onPressed: () => _dialogOpen(context),
                      child: Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: LifeBar().decoration('assets/swamp.jpg'),
                          child: Transform.rotate(
                            angle: math.pi / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    lifeMinus(2);
                                  },
                                  icon: LifeBar().minusIcon(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    lifeCounter[2].toString(),
                                    style: LifeBar().textStyle(),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    lifePlus(2);
                                  },
                                  icon: LifeBar().plusIcon(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration:
                              LifeBar().decoration('assets/forest2.jpg'),
                          child: Transform.rotate(
                            angle: -math.pi / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    lifeMinus(3);
                                  },
                                  icon: LifeBar().minusIcon(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    lifeCounter[3].toString(),
                                    style: LifeBar().textStyle(),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    lifePlus(3);
                                  },
                                  icon: LifeBar().plusIcon(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      default:
        return Container(child: Text('0'));
    }
  }

  Future<void> _dialogOpen(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(35),
            ),
          ),
          backgroundColor: Colors.blue[600],
          actions: <Widget>[
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person_outline,
                    size: 40.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black54,
                      ),
                      onPressed: () {
                        settings.player2();
                        lifeReset();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black54,
                      ),
                      onPressed: () {
                        settings.player3();
                        lifeReset();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '3',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black54,
                      ),
                      onPressed: () {
                        settings.player4();
                        lifeReset();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '4',
                        style: TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.favorite_border,
                    size: 40.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.black54,
                        ),
                        onPressed: () {
                          settings.life20();
                          lifeReset();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          '20',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.black54,
                        ),
                        onPressed: () {
                          settings.life30();
                          lifeReset();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          '30',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.black54,
                        ),
                        onPressed: () {
                          settings.life40();
                          lifeReset();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          '40',
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
