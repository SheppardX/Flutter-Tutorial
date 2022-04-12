// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:hello_rectangle/unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// Units for this [Category].
  final List<Unit> units;
  final Color color;
  final String name;

  const ConverterRoute({
    required this.units,
    required this.color,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  List<Unit> units = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      units = widget.units;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = units.map((Unit unit) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        color: widget.color,
        child: Column(
          children: <Widget>[
            Text(
              unit.name!,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }
}
