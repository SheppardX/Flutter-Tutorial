import 'package:flutter/material.dart';
import 'package:hello_rectangle/converter_route.dart';
import 'package:hello_rectangle/unit.dart';

class Category extends StatelessWidget {
  final String name;
  final IconData icon;
  final ColorSwatch color;
  final List<Unit> units;

  final double height = 80.0;
  final double borderRadius = 50.0;

  const Category(
      {Key? key,
      required this.name,
      required this.icon,
      required this.color,
      required this.units})
      : super(key: key);

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text(name, style: Theme.of(context).textTheme.displaySmall),
          centerTitle: true,
          backgroundColor: color,
        ),
        body: ConverterRoute(color: color, units: units, name: name),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: height,
        child: InkWell(
          onTap: () {
            print('I was tapped!');
            _navigateToConverter(context);
          },
          borderRadius: BorderRadius.circular(borderRadius),
          highlightColor: color['highlight'],
          splashColor: color['splash'],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      icon,
                      size: 40,
                    )),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
