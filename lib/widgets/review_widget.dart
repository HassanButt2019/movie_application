import 'package:flutter/material.dart';
import 'package:movieapp/data/models/reviews.dart';

class ReviewWidget extends StatelessWidget {
  double? width;
  double? height;
  Author reviews;

  ReviewWidget({required this.reviews});
  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: width! * 0.60,
          height: height! * 0.40,
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black , Colors.red.shade600 ,Colors.red.shade800,Colors.red.shade900 , Colors.black]),
          ),
          child: Material(
            color: Colors.transparent,

            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      reviews.author_details["avatar_path"]!=null? Container(
                        height: height!*0.07,
                        width: width!*0.1,

                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(250)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    reviews.author_details["avatar_path"].substring(1)
                                ),
                                fit: BoxFit.cover
                            )
                        ),
                      ):CircleAvatar(),
                      //"https://image.tmdb.org/t/p/w500/"
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(reviews.author!,style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8,left: 8.0, right: 8.0),
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(reviews.content!.substring(0,10),style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          )),
    );
  }
}
