import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/screens/movie_detail.dart';

class CrausalWidget extends StatefulWidget {
  CrausalWidget({required this.movies});
  List<Movie> movies;

  @override
  _CrausalWidgetState createState() => _CrausalWidgetState();
}

class _CrausalWidgetState extends State<CrausalWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 250.0,
          aspectRatio: 8 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: widget.movies.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetail(
                                movie: i,
                              )));
                },
                child: Container(
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl:  "https://image.tmdb.org/t/p/w500/" + i.poster_path!,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
