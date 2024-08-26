import 'dart:developer';

import 'package:flutter/material.dart';

//! Question (https://discord.com/channels/765557403865186374/801938753877704774/1270706048507973715):
// Screen A -> Screen B
// Suppose there's `TextEditingController` defined in widget in `Screen B` along with the listener attached to it. and we don't dispose it. Now, when we `pop` the `screen B` and comes to `Screen A`,
// 1. Will that listener still be listened to ?
// Ans. No.
// 2. Will `TextEditingController` be garbage collected ?
// Ans. It doesn't contain the object details but still occupies memory. (at-leat for some minutes)

class Gig2 extends StatelessWidget {
  const Gig2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => _Screen1()),
                );
              },
              child: const Text('Screen 1'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Screen1 extends StatefulWidget {
  @override
  State<_Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<_Screen1> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      log('Called _Screen1State');
    });
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _controller),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
