
import 'package:movieapp/bloc/movie_bloc/events/movie_event.dart';

class SpecificCategory extends MovieEvent
{
  final String? type;
  SpecificCategory({this.type});
  @override

  List<Object?> get props => [type];

}