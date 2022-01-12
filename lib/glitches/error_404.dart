
import 'package:flutter/material.dart';


class Error404 extends StatelessWidget {
  const Error404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:  Text("Error 404",style: TextStyle(color: Colors.red , fontSize: 24),),
      ),
    );
  }
}
