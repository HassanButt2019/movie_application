
import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/screens/movie_detail.dart';

class ImageComponentGrid extends StatelessWidget {

  Movie? movie;
  ImageComponentGrid({this.movie});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(movie: movie,)));
      },

      child: Container(
        height: MediaQuery.of(context).size.height*0.1,

        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Container(
                  width: MediaQuery.of(context).size.width *0.4,

                  height:MediaQuery.of(context).size.height *0.3,
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
