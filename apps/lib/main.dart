import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toy Car Remote Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toy Car Remote Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Placeholder for the D-pad style remote control
            Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // Button to turn left
                      RemoteButton('Turn Left'),
                      // Button to turn right
                      RemoteButton('Turn Right'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // Button to move forward
                      RemoteButton('Forward'),
                      // Button to move backward
                      RemoteButton('Backward'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RemoteButton extends StatefulWidget {
  final String buttonText;

  RemoteButton(this.buttonText);

  @override
  _RemoteButtonState createState() => _RemoteButtonState();
}

class _RemoteButtonState extends State<RemoteButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        // When the button is pressed
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        // When the button is released
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: 70.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: _isPressed ? Color.fromARGB(255, 255, 165, 143) : Color.fromARGB(100, 255, 165, 143),
          border: Border.all(),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

