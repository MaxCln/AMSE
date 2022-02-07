class Media {
  final String type;
  final String name;
  final String synopsis;
  final String review;
  final int chapter;
  final int id;
  final double rating;
  final String image;
  final String completed;
  bool favorite;

  Media(
      {required this.id,
      required this.type,
      required this.name,
      required this.synopsis,
      required this.review,
      required this.chapter,
      required this.rating,
      required this.image,
      required this.favorite,
      required this.completed});
}
