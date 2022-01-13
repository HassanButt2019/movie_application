




import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';

class CrausalWidget extends StatefulWidget {
  const CrausalWidget({Key? key}) : super(key: key);

  @override
  _CrausalWidgetState createState() => _CrausalWidgetState();
}

class _CrausalWidgetState extends State<CrausalWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        aspectRatio: 8/9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,

      ),
      items: movieImages.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(i),
                    fit: BoxFit.fitHeight,
                  ),
                ),

            );
          },
        );
      }).toList(),
    );
  }
}
