
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/screens/movie_detail.dart';

class ImageComponentGrid extends StatelessWidget {

  Movie? movie;
  double?width;
  double?height;
  double?heigthProvided;
  double?widthProvided;
  var onTap;
  ImageComponentGrid({this.movie , this.onTap,this.heigthProvided,this.widthProvided});
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return InkWell(
      onTap:onTap,
      child: Container(
        height:height! * 0.20,
        width: width! *0.25,
        child:
          Column(
              mainAxisSize: MainAxisSize.max,
              children:[
                Container(
                  width: widthProvided==null ? width! *0.25:widthProvided!*width!,
                  height:heigthProvided == null ?height! *0.20:heigthProvided!*height!,
                  child: CachedNetworkImage(
                    imageUrl:   "https://image.tmdb.org/t/p/w500/"+movie!.poster_path!   ,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
               const SizedBox(
                  height: 10,
                ),

                Center(child: Text(movie!.title! , textAlign: TextAlign.center , maxLines: 4,style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)),
              ]),
      ),
    );
  }
}
