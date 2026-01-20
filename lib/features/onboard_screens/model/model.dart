class OnBoardModel {
  final String title;
  final String subtitle;
  final String image;
  final bool isLast;

  OnBoardModel({
    required this.title,
    required this.subtitle,
    required this.image,
    this.isLast = false,
  });
}
