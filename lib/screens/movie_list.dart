import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/bloc/events/change_layout.dart';
import 'package:movieapp/bloc/events/get_movie.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/bloc/states/movie_failure.dart';
import 'package:movieapp/bloc/states/movie_initial.dart';
import 'package:movieapp/bloc/states/movie_loaded.dart';
import 'package:movieapp/bloc/states/movie_loaded_grid.dart';
import 'package:movieapp/bloc/states/movie_loading.dart';
import 'package:movieapp/bloc/states/movie_state.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/repository/movie_repository.dart';
import 'package:movieapp/screens/movie_detail.dart';
import 'package:movieapp/widgets/app_bar_container.dart';
import 'package:movieapp/widgets/carousal_widget.dart';
import 'package:movieapp/widgets/movie_component_grid.dart';
import 'package:movieapp/widgets/movie_list_view.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}



class _MovieListState extends State<MovieList> {

  bool toggle = false;

  Movie movie =  Movie();
  double? width , height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (BuildContext context)=>MovieBloc(
            RepositoryProvider.of<MovieReposiotry>(context)
        )..add(RequestMovie()),
      child: BlocConsumer<MovieBloc , MovieState>(
          listener: (context , state){

            if(state is LoadingMovie)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("LOADING YOUR MOVIES") , backgroundColor: Colors.red,)
              );
            }
            if(state is LoadedMovie)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Loaded Your Movies") , backgroundColor: Colors.grey,)
              );
            }


          },
          builder: (context , state){

            if(state is InitialMovie)
              {
                return Scaffold(
                  body: Container(
                    height: height!,
                    width: width!,
                    decoration: const BoxDecoration(
                      gradient:
                      LinearGradient(
                          begin: Alignment.topLeft,
                          end:
                          Alignment.bottomRight,
                          colors: [ Colors.red,Colors.black,Colors.black]),
                    ),
                    child: Center(
                      child: Text("Welcome To Movie Land"),
                    ),
                  ),
                );
              }

            if(state is LoadingMovie)
              {
                return Scaffold(
                  body: Container(
                    height: height!,
                    width: width!,
                    decoration: const BoxDecoration(
                      gradient:
                      LinearGradient(
                          begin: Alignment.topLeft,
                          end:
                          Alignment.bottomRight,
                          colors: [ Colors.red,Colors.black,Colors.black]),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }

            if(state is MovieLoadedGrid)
              {
                return DefaultTabController(

                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      bottom: const TabBar(
                        tabs: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Up Comming"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Top Rated"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Popular"),
                          ),

                        ],
                      ),

                      title: Text("Movie Grid"),
                      flexibleSpace: AppBarGradient(),
                      actions: [
                        IconButton(
                          onPressed: () {
                            context.read<MovieBloc>().add(
                              RequestMovie( ),
                            );
                          }, icon: Icon(Icons.view_list, color: Colors.white,),),
                      ],
                    ),
                    body: TabBarView(
                      children: [
                        Container(
                          height: height,
                          width: width,
                          decoration:const BoxDecoration(
                            gradient:
                            LinearGradient(
                                begin: Alignment.topLeft,
                                end:
                                Alignment.bottomRight,

                                colors: [ Colors.red,Colors.black,Colors.black]),
                          ),
                          child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 5,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                              itemCount: state.Upcomingmovies!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return ImageComponentGrid(onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(movie:  state.Upcomingmovies![index],)));

                                },
                                  movie:state.Upcomingmovies![index],widthProvided: 0.45,heigthProvided: 0.30,);
                              }),
                        ),
                        Container(
                          height: height,
                          width: width,
                          decoration:const BoxDecoration(
                            gradient:
                            LinearGradient(
                                begin: Alignment.topLeft,
                                end:
                                Alignment.bottomRight,

                                colors: [ Colors.red,Colors.black,Colors.black]),
                          ),
                          child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 5,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                              itemCount: state.TopRatedmovies!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return ImageComponentGrid(onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(movie:  state.TopRatedmovies![index],)));

                                },
                                  movie:state.TopRatedmovies![index],widthProvided: 0.45,heigthProvided: 0.30,);
                              }),
                        ),
                        Container(
                          height: height,
                          width: width,
                          decoration:const BoxDecoration(
                            gradient:
                            LinearGradient(
                                begin: Alignment.topLeft,
                                end:
                                Alignment.bottomRight,

                                colors: [ Colors.red,Colors.black,Colors.black]),
                          ),
                          child: GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 5,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                              itemCount: state.Popularmovies!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return ImageComponentGrid(onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(movie:  state.Popularmovies![index],)));

                                },
                                  movie:state.Popularmovies![index],widthProvided: 0.45,heigthProvided: 0.30,);
                              }),
                        ),
                    ]
                    ),
                  ),
                );

              }



            if(state is LoadedMovie)
              {

                return Scaffold(
                      appBar: AppBar(
                        title: Center(child: const Text("Movie List")),
                        flexibleSpace:const AppBarGradient(),
                        actions: [
                          IconButton(
                            onPressed: () {
                              context.read<MovieBloc>().add(
                                ChangeLayout(),
                              );
                            }, icon: Icon(Icons.grid_3x3_outlined , color: Colors.white,),),
                        ],
                      ),
                  body: Container(
                    height: height!,
                    width: width!,
                    decoration: const BoxDecoration(
                      gradient:
                      LinearGradient(
                          begin: Alignment.topLeft,
                          end:
                          Alignment.bottomRight,
                          colors: [ Colors.red,Colors.black,Colors.black]),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           CrausalWidget(movies: state.Upcomingmovies!,),
                           MovieListView(title: "Upcomming - Movies",movies:state.Upcomingmovies!),
                           MovieListView(title: "Top Rated - Movies",movies: state.TopRatedmovies!),
                          MovieListView(title: "Most Popular - Movies",movies: state.Popularmovies!,),
                        ],
                      ),
                    )
                  ),
                );
              }
            if(state is FailureMovie)
              {
                return Center(
                  child: Text(state.error.toString()),
                );
              }
            return Container();
          },
        )
        );
  }
}
