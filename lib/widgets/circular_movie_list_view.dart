





import 'package:flutter/material.dart';
import 'package:movieapp/data/models/movie.dart';

class CircularListView extends StatelessWidget {

  Movie? movie;
  double?width;
  double?height;
  var onTap;
  CircularListView({this.movie , this.onTap,});
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return InkWell(
      onTap:onTap,
      child: Column(
          children:[
            Container(
              height: height!*0.12,
              width: width!*0.2,

              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(150)),
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/"+movie!.poster_path!                        ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: Text(movie!.title!.length > 20 ? movie!.title!.substring(0,20):movie!.title! ,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.normal),)),
          ]),
    );
  }
}
