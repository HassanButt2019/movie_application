
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/bloc/movie_bloc/events/get_movie.dart';
import 'package:movieapp/bloc/movie_bloc/events/request_specific_type.dart';
import 'package:movieapp/bloc/movie_bloc/movie_bloc.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_failure.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_loaded.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_loading.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/repository/movie_repository.dart';
import 'package:movieapp/screens/movie_detail.dart';
import 'package:movieapp/widgets/movie_component_grid.dart';


class UpcomingMovieListView extends StatefulWidget {
  String? title;


  UpcomingMovieListView({this.title });

  @override
  _UpcomingMovieListViewState createState() => _UpcomingMovieListViewState();
}

class _UpcomingMovieListViewState extends State<UpcomingMovieListView> {
  double?width;
  double?height;
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0 , top: 10),
                child: Text(widget.title! , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),
              ),
              Container(
                width: width,
                height:height!*0.35,
                child: StreamBuilder<List<Movie>>(
                  initialData:BlocProvider.of<MovieBloc>(context).upCommingmovies,
                  stream: BlocProvider.of<MovieBloc>(context).upComingMoviesStream,
                  builder: (context, snapshot) {
                 //   print(BlocProvider.of<MovieBloc>(context).isUpdate  );
                    print(BlocProvider.of<MovieBloc>(context).isUpdate);

                    if(BlocProvider.of<MovieBloc>(context).isUpdate) {
                      print("HEL:O");
                      return CircularProgressIndicator();

                    }



                    if(snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                          controller: scrollController
                            ..addListener(() {
                              if (scrollController.position.pixels==
                                  scrollController.position.maxScrollExtent) {
                                BlocProvider.of<MovieBloc>(context).getUpComngMoves();
                              }
                            }),
                          //shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var movies = BlocProvider.of<MovieBloc>(context).upCommingmovies;

                              return Padding(
                                  padding:
                                   const EdgeInsets.all(8.0),
                              child: ImageComponentGrid(
                                movie: snapshot.data![index],
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetail(
                                            movie: movies[index],)));
                                },
                              ),
                            );
                          },
                          );
                    }

                    if (snapshot.hasData){
                      return Align(
                        alignment: Alignment.centerRight,
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container();
                  }
                ),
              ),

        //    if(  BlocProvider.of<MovieBloc>(context).isUpdate) CircularProgressIndicator()
            ],


    );
  }
}

//1 stream builder vs future builder
// when to use stream or future builder
