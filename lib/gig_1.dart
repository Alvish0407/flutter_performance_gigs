import 'dart:developer';

import 'package:flutter/material.dart';

//! Question: Methods vs Stateless Widget to return widgets
//! Discussion: https://www.reddit.com/r/FlutterDev/comments/mp4xpx/methods_vs_stateless_widget_to_return_widgets
//! https://www.youtube.com/watch?v=vVg9It7cOfY&t=1318s - 90k Widgets by Methods Vs. 10k Widgets by Widgets
//! Detailed Answer: https://discord.com/channels/420324994703163402/825211409532190730/1273335105796178022

class Gig1 extends StatelessWidget {
  const Gig1({super.key});

  @override
  Widget build(BuildContext context) {
    const itemCount = 10000;

    // Update the following flags to test different scenarios
    const useBuilder = false;
    const useFunction = false;

    final Widget child;
    // ignore: dead_code
    if (useBuilder) {
      child = ListView.builder(
        itemCount: itemCount,
        itemBuilder: (_, i) {
          return useFunction ? _buildLineWidget(i) : _BuildLineWidget(i);
        },
      );
    } else {
      child = ListView(
        children: [
          for (int i = 0; i < itemCount; i++)
            // ignore: dead_code
            useFunction ? _buildLineWidget(i) : _BuildLineWidget(i),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(child: child),
    );
  }

  Widget _buildLineWidget(int i) {
    log("_buildLineWidget{$i}");
    final line = loremIpsum[i % loremIpsum.length];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: Text(
                  "$i",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(line, softWrap: false),
          ),
        ],
      ),
    );
  }
}

class _BuildLineWidget extends StatelessWidget {
  final int i;
  _BuildLineWidget(this.i) {
    log("_BuildLineWidget{$i}");
  }

  @override
  Widget build(BuildContext context) {
    log("_BuildLineWidget{$i}.build");
    final line = loremIpsum[i % loremIpsum.length];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.black,
            child: SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: Text(
                  "$i",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(line, softWrap: false),
          )
        ],
      ),
    );
  }
}

const List<String> loremIpsum = [
  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
  'Aliquam tincidunt mauris eu risus.',
  'Vestibulum auctor dapibus neque.',
  'Nunc dignissim risus id metus.',
  'Cras ornare tristique elit.',
  'Vivamus vestibulum ntulla nec ante.',
  'Praesent placerat risus quis eros.',
  'Fusce pellentesque suscipit nibh.',
  'Integer vitae libero ac risus egestas placerat.',
  'Vestibulum commodo felis quis tortor.',
  'Ut aliquam sollicitudin leo.',
  'Cras iaculis ultricies nulla.',
  'Donec quis dui at dolor tempor interdum.',
  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
  'Aliquam tincidunt mauris eu risus.',
  'Vestibulum auctor dapibus neque.',
  'Nunc dignissim risus id metus.',
  'Cras ornare tristique elit.',
  'Vivamus vestibulum ntulla nec ante.',
  'Praesent placerat risus quis eros.',
  'Fusce pellentesque suscipit nibh.',
  'Integer vitae libero ac risus egestas placerat.',
  'Vestibulum commodo felis quis tortor.',
  'Ut aliquam sollicitudin leo.',
  'Cras iaculis ultricies nulla.',
  'Donec quis dui at dolor tempor interdum.',
];
