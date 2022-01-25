
import 'package:movieapp/bloc/movie_bloc/events/movie_event.dart';

class ChangeLayout extends MovieEvent
{
  bool? toggle;
  ChangeLayout({this.toggle});
  @override

  List<Object?> get props => [toggle];

}