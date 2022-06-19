class RecipeModel {
  final String key;
  final String title;
  final String time;
  final String servings;
  final String difficulty;
  final String images;

  RecipeModel(
      {this.key = '',
      this.title = '',
      this.time = '',
      this.servings = '',
      this.difficulty = '',
      this.images = ''});

  factory RecipeModel.fromJson(json) => RecipeModel(
        key: json['key'],
        title: json['title'],
        time: json['times'],
        servings: json['portion'] ?? json['serving'],
        difficulty: json['dificulty'] ?? json['difficulty'],
        images: json['thumb'],
      );
}
