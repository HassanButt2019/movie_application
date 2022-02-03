import 'package:cached_network_image/cached_network_image.dart';
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
          height: height! * 0.45,
          decoration: _decorationBox(),
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
                      _imageWidget(),
                      _nameWidget(),
                    ],
                  ),
                ),
                _dividerWidget(),
                _contantWidget()
              ],
            ),
          )),
    );
  }

  BoxDecoration _decorationBox() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            Colors.black,
            Colors.blue.shade900,
            Colors.black
          ]),
    );
  }

  Padding _nameWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        reviews.author!,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Padding _dividerWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 8, left: 8.0, right: 8.0),
      child: Divider(
        color: Colors.white,
      ),
    );
  }

  Padding _contantWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        reviews.content!,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Container _imageWidget() {
    return Container(
      height: height! * 0.07,
      width: width! * 0.1,
      child: CachedNetworkImage(
        imageUrl: reviews.author_details["avatar_path"].substring(1),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      decoration: const BoxDecoration(),
    );
  }
}
