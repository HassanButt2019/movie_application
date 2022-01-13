


class Movie
{


  String? name;
  String? img;
  String? certificate;
  String? rating;
  String? minutes;
  String? description;

  Movie({this.name, this.certificate ,this.img , this.minutes,this.rating,this.description});
}

List<Movie> movies = [
  Movie(name: "The Shawshank Redemption",certificate: "R",
      img: "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg",
      minutes: "200",rating: "9.6",description: "Andy Dufresne, a successful banker, is arrested for the murders of his wife and her lover, and is sentenced to life imprisonment at the Shawshank prison. He becomes the most unconventional prisoner."),
  Movie(name: " The Godfather ",certificate: "R",
      img: "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
      minutes: "150",rating: "9.2",description: "Don Vito Corleone, head of a mafia family, decides to hand over his empire to his youngest son Michael. However, his decision unintentionally puts the lives of his loved ones in grave danger."),

  Movie(name: " The Godfather II",certificate: "PG-18",
      img: "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
      minutes: "150",rating: "7",description: "Don Vito Corleone, head of a mafia family, decides to hand over his empire to his youngest son Michael. However, his decision unintentionally puts the lives of his loved ones in grave danger."),
  Movie(name: " The Dark Knight",certificate: "R",
      img: "https://images.hungama.com/c/1/f60/70f/2009199/2009199_1280x800.jpg",
      minutes: "170",rating: "8",description: "After Gordon, Dent and Batman begin an assault on Gotham's organised crime, the mobs hire the Joker, a psychopathic criminal mastermind who offers to kill Batman and bring the city to its knees."),
  Movie(name: "12 Angry Men",certificate: "PG-13",img: "https://flxt.tmsimg.com/assets/p2084_p_v10_ad.jpg",
      minutes: "160",rating: "8",description: "A dissenting juror in a murder trial slowly manages to convince the others that the case is not as obviously clear as it seemed in court."),
];


List<String> movieImages = [
 "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg",

  "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",
  "https://flxt.tmsimg.com/assets/p2084_p_v10_ad.jpg",
  "https://images.hungama.com/c/1/f60/70f/2009199/2009199_1280x800.jpg",
  "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg",


];