class ReviewModel {
  final String name;
  final String imageLink;
  final String date;
  final String reviewText;
  final String ratingValue;

  ReviewModel({
    required this.date,
    required this.ratingValue,
    required this.reviewText,
    required this.name,
    required this.imageLink,
  });
}
