import 'package:flutter/material.dart';

import './choice_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Form choices examples'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _switchChoice = false;
  ChoicesList _radioChoice = ChoicesList.plane;
  Icon _radioIcon = const Icon(Icons.flight);

  final Map _mapTransport = {
    ChoicesList.car: false,
    ChoicesList.plane: false,
    ChoicesList.boat: false
  };

  double _sliderChoice = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'User\'s choice',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 35
              ),
            ),
            const Divider(color: Colors.blueAccent, thickness: 5),
            const Text("Switch", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
            Switch(
                value: _switchChoice,
                onChanged: (value){
                  setState(() {
                    _switchChoice = value;
                  });
                }
            ),
            Text(_switchChoice ? "On" : "Off"),
            const Divider(color: Colors.blueAccent, thickness: 5),
            const Text("Radio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                    value: ChoicesList.car,
                    groupValue: _radioChoice,
                    onChanged: (value) {
                      setState(() {
                        _radioChoice = ChoicesList.car;
                        _radioIcon = const Icon(Icons.directions_car);
                      });
                    }
                ),
                Text(
                  "Car",
                  style: _radioChoice == ChoicesList.car ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                  //style: _radioChoice == ChoicesList.car ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                ),
                Radio(
                    value: ChoicesList.plane,
                    groupValue: _radioChoice,
                    onChanged: (value) {
                      setState(() {
                        _radioChoice = ChoicesList.plane;
                        _radioIcon = const Icon(Icons.flight);
                      });
                    }
                ),
                Text(
                    "Plane",
                  style: _radioChoice == ChoicesList.plane ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                ),
                Radio(
                    value: ChoicesList.boat,
                    groupValue: _radioChoice,
                    onChanged: (value) {
                      setState(() {
                        _radioChoice = ChoicesList.boat;
                        _radioIcon = const Icon(Icons.directions_boat);
                      });
                    }
                ),
                Text(
                    "Boat",
                  style: _radioChoice == ChoicesList.boat ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                ),
              ],
            ),
            _radioIcon,
            const Divider(color: Colors.blueAccent, thickness: 5),
            const Text("Checkbox", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    value: _mapTransport[ChoicesList.car],
                    onChanged: (value) {
                      setState(() {
                        _mapTransport[ChoicesList.car] = value;
                      });
                    }
                ),
                Text(
                  "Car",
                  style: _mapTransport[ChoicesList.car] ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                ),
                Checkbox(
                    value: _mapTransport[ChoicesList.plane],
                    onChanged: (value) {
                      setState(() {
                        _mapTransport[ChoicesList.plane] = value;
                      });
                    }
                ),
                Text(
                  "Plane",
                  style: _mapTransport[ChoicesList.plane] ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                ),
                Checkbox(
                    value: _mapTransport[ChoicesList.boat],
                    onChanged: (value) {
                      setState(() {
                        _mapTransport[ChoicesList.boat] = value;
                      });
                    }
                ),
                Text(
                  "Boat",
                  style: _mapTransport[ChoicesList.boat] ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.directions_car,
                  color: _mapTransport[ChoicesList.car] ? Colors.teal : Colors.grey,
                ),
                Icon(
                  Icons.flight,
                  color: _mapTransport[ChoicesList.plane] ? Colors.teal : Colors.grey,
                ),
                Icon(
                  Icons.directions_boat,
                  color: _mapTransport[ChoicesList.boat] ? Colors.teal : Colors.grey,
                ),
              ],
            ),
            const Divider(color: Colors.blueAccent, thickness: 5),
            const Text("Slider", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
            Slider(
              value: _sliderChoice,
              label: "$_sliderChoice",
              min: 0.0,
              max: 10.0,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  _sliderChoice = value;
                });
              },
            ),
            Text(
              "Slider value: $_sliderChoice",
              style: TextStyle(color: _sliderChoice > 5 ? Colors.red : Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
