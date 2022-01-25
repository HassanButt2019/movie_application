


import 'package:movieapp/bloc/reviews_bloc/states/review_state.dart';

class FailureReview extends ReviewState
{
  final String error;
  FailureReview({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];

}