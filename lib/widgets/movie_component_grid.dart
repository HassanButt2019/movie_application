
import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
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
        height:height! * 0.1,

        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Container(
                  width: widthProvided==null ? width! *0.25:widthProvided!*width!,

                  height:heigthProvided == null ?height! *0.20:heigthProvided!*height!,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: NetworkImage(
                              movie!.img!                        ),
                          fit: BoxFit.cover
                      )
                  ),
                ),

                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Center(child: Text(movie!.name!,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),

              ]),
      ),
    );
  }
}
