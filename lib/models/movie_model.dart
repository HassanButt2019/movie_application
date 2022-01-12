


class Movie
{


  String? name;
  String? img;
  String? certificate;
  String? rating;
  String? minutes;

  Movie({this.name, this.certificate ,this.img , this.minutes,this.rating});
}

List<Movie> movies = [
  Movie(name: "The Shawshank Redemption",certificate: "R",img: "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg",minutes: "200",rating: "9.6"),
  Movie(name: " The Godfather ",certificate: "R",img: "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",minutes: "150",rating: "9.2"),

  Movie(name: " The Godfather II",certificate: "PG-18",img: "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",minutes: "150",rating: "7"),
  Movie(name: " The Dark Knight",certificate: "R",img: "https://images.hungama.com/c/1/f60/70f/2009199/2009199_1280x800.jpg",minutes: "170",rating: "8"),
  Movie(name: "12 Angry Men",certificate: "PG-13",img: "https://flxt.tmsimg.com/assets/p2084_p_v10_ad.jpg",minutes: "160",rating: "8"),

];