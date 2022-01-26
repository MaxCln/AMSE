class Media {
  final String type;
  final String name;
  final String description;
  final int id;
  final double rating;
  final bool favorite;
  final String image;

  Media(
      {required this.id,
      required this.type,
      required this.name,
      required this.description,
      required this.rating,
      required this.image,
      required this.favorite,});
}
