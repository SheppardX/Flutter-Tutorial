// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0);
const _borderRadius = BorderRadius.all(Radius.circular(10.0));

/// [ConverterRoute] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// Color for this [Category].
  final ColorSwatch color;

  /// Units for this [Category].
  final List<Unit> units;
  final String name;

  /// This [ConverterRoute] requires the color and units to not be null.
  const ConverterRoute({
    required this.color,
    required this.units,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  @override
  // TODO: Set some variables, such as for keeping track of the user's input
  // value and units
  int value = 0;
  double unit = 1.0;

  // TODO: Determine whether you need to override anything, such as initState()

  // TODO: Add other helper functions. We've given you one, _format()

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  @override
  Widget build(BuildContext context) {
    final inputContainer = Container(
      color: widget.color['splash'],
      child: Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderRadius: _borderRadius),
                labelText: 'Input',
                labelStyle: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: _borderRadius),
                ),
                child: DropdownButton<double>(
                  value: unit,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (double? newValue) {
                    setState(() {
                      unit = newValue!;
                    });
                  },
                  underline: DropdownButtonHideUnderline(child: Container()),
                  items: widget.units
                      .map((e) => DropdownMenuItem(
                          value: e.conversion, child: Text(e.name)))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    final compareArrows = Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: const RotatedBox(
        quarterTurns: 1,
        child: Icon(Icons.compare_arrows, size: 40),
      ),
    );
    // TODO: Create the 'output' group of widgets. This is a Column that
    final outputContainer = Container(
      color: widget.color['splash'],
      child: Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const OutlineInputBorder(borderRadius: _borderRadius),
                labelText: 'Output',
                labelStyle: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: _borderRadius),
                ),
                child: DropdownButton<double>(
                  value: unit,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (double? newValue) {
                    setState(() {
                      unit = newValue!;
                    });
                  },
                  underline: DropdownButtonHideUnderline(child: Container()),
                  items: widget.units
                      .map((e) => DropdownMenuItem(
                          value: e.conversion, child: Text(e.name)))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // TODO: Return the input, arrows, and output widgets, wrapped in a Column.

    // TODO: Delete the below placeholder code.

    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [inputContainer, compareArrows, outputContainer],
      ),
    );
  }
}
