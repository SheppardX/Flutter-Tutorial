// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unused_element

// You can read about packages here: https://flutter.dev/using-packages/
import 'package:flutter/material.dart';
import 'package:hello_rectangle/categroy_route.dart';
// More details at http://dart-lang.github.io/linter/lints/avoid_relative_lib_imports.html

// TODO: Pass this information into your custom [Category] widget
const _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.green;

/// The function that is called when main.dart is run.
void main() {
  runApp(const UnitConverterApp());
}

/// This widget is the root of our application.
/// Currently, we just show one widget in our app.
class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      // TODO: Instead of pointing to exactly 1 Category widget,
      // our home should now point to an instance of the CategoryRoute widget.
      home: CategoryRoute(),
    );
  }
}
