

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';


class MovieDetail extends StatelessWidget {
  Movie? movie ;
  MovieDetail({this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text(movie!.name!.toUpperCase()),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient:
          LinearGradient(
              begin: Alignment.topLeft,
              end:
              Alignment.bottomRight,

              colors: [ Colors.red,Colors.black]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
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
                ),


                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie!.name! , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.1,
                    ),
                        Container(
                          width:MediaQuery.of(context).size.width*0.3,
                          child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text(movie!.minutes! , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),
                          Text(movie!.certificate! , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),
                          Text(movie!.rating! , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),

                      ],
                    ),
                        )

                      ],
                    )),

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width*0.2,
                  child: Row(
                    children: [
                      Icon(Icons.forward),
                      Text('Play'),
                    ],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}
