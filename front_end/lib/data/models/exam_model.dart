class ExamModel {
  ExamModel({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.time,
    this.tag,
    this.isFavorite = false,
  });

  final int? id;
  final String title;
  final String description;
  final String image;
  final int time;
  final String? tag;
  final bool? isFavorite;
}
