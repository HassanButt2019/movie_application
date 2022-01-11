
import 'package:flutter/material.dart';


class MovieComponent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90),
      ),
      elevation: 5.0,
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            child: Image.network("https://upload.wikimedia.org/wikipedia/en/thumb/1/1b/Daredevil_season_1_poster.jpg/220px-Daredevil_season_1_poster.jpg"),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          Container(
          //  color: Colors.black,
            width: MediaQuery.of(context).size.width *0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Movie Name"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const[
                    Text("Minutes"),
                    Text("Rating"),
                    Text("Certificate"),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
