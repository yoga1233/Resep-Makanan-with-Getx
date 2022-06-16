class RecipeModel {
  final String id;
  final String title;
  final String time;
  final String servings;
  final String difficulty;
  final String recipe;
  final List<String> images;

  RecipeModel(
      {this.id = '',
      this.title = '',
      this.time = '',
      this.servings = '',
      this.difficulty = '',
      this.recipe = '',
      this.images = const ['']});

  factory RecipeModel.fromJson(json) => RecipeModel(
        id: json['id'],
        title: json['title'],
        time: json['time'],
        servings: json['servings'],
        difficulty: json['difficulty'],
        recipe: json['recipe'],
        images: json['images'].cast<String>(),
      );
}
