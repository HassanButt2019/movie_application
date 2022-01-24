//

class AutherDetail{
  String? name;
  String? username;
  String?avatar_path;
  String? rating;
  AutherDetail({this.name ,this.avatar_path , this.rating , this.username});
}





class Author{
  String? author;
  AutherDetail? author_details;
  String? content;
  String? id;
  String? updated_at;

  Author({this.author , this.content , this.id , this.updated_at});



  // Map<String, dynamic> toJson() => _$AuthorToJson(this);




}