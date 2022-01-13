
import 'package:flutter/material.dart';


class AppBarGradient extends StatelessWidget {
  const AppBarGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.red,Colors.black]),
      ),
    );
  }
}

