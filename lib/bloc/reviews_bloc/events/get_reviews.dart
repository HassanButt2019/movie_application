



import 'package:movieapp/bloc/reviews_bloc/events/reviews_event.dart';

class RequestReviews extends ReviewsEvent
{

  String? id;
  RequestReviews({required this.id});
  @override

  List<Object?> get props => [id];

}