
import 'package:json_annotation/json_annotation.dart';

part "reviews.g.dart";




@JsonSerializable()

class Author{
  String? author;
 // AuthorDetail? author_details = AuthorDetail();
  String? content;
  String? id;
  String? updated_at;
  var author_details;

  Author({this.author , this.content , this.id , this.updated_at,this.author_details});



  factory Author.fromJson(Map<String, dynamic> json) =>
      _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);




}