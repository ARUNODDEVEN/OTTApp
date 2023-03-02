import 'package:flutter/material.dart';

class Posterssss extends StatelessWidget {
  Posterssss({super.key, required this.p});

  List<dynamic> p = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage('posters'))),
          )
        ],
      ),
    );
  }
}
