class FoodItem {
  final List<String> images;
  final String title;
  final String subtitle;
  final double rating;
  final double price;
  int currentIndex;

  FoodItem(
      {
        required this.images,
        required this.title,
        required this.subtitle,
        required this.rating,
        required this.price,
        this.currentIndex = 1,
      });
}