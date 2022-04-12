import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.name,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final Color color;

  final double height = 100.0;
  final double borderRadius = 50.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: height,
        child: InkWell(
          onTap: () {
            print('I was tapped!');
          },
          borderRadius: BorderRadius.circular(borderRadius),
          highlightColor: color,
          splashColor: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      icon,
                      size: 60,
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
