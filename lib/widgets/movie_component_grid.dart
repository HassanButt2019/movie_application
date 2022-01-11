
import 'package:flutter/material.dart';

class ImageComponentGrid extends StatefulWidget {
  const ImageComponentGrid({Key? key}) : super(key: key);

  @override
  _ImageComponentGridState createState() => _ImageComponentGridState();
}

class _ImageComponentGridState extends State<ImageComponentGrid> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.2,
            child: Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/1/1b/Daredevil_season_1_poster.jpg/220px-Daredevil_season_1_poster.jpg",width:MediaQuery.of(context).size.width*0.2 ,)),

        Positioned(
          bottom: 10,
          child: Container(
              color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Text("Movie Name",style: TextStyle(color: Colors.white),),


              ],
            ),
          ),
        ),

      ],
    );
  }
}
