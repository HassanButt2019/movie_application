
import 'package:flutter/material.dart';
import 'package:movieapp/widgets/movie_component_grid.dart';

class MovieGrid extends StatefulWidget {
  const MovieGrid({Key? key}) : super(key: key);

  @override
  _MovieGridState createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {

  List<Container> _buildGridTileList(int count) => List.generate(
      count, (i) => Container(child: ImageComponentGrid()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Grid"),
      ),
      body: GridView.extent(
          maxCrossAxisExtent: 150,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: _buildGridTileList(5)),
    );
  }
}
