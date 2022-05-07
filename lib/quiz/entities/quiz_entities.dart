class QuizCategory {
  final String name;
  const QuizCategory({required this.name});
}

class QuizQuestionsResponse {
  final List<QuizQuestion> data;
  QuizQuestionsResponse({
    required this.data,
  });

  QuizQuestionsResponse.fromJson(List<dynamic> json)
      : data = json
            .asMap()
            .entries
            .map(
              (MapEntry<int, dynamic> e) =>
                  QuizQuestion.fromJson(e.value as Map<String, dynamic>, e.key),
            )
            .toList();
}

class QuizCategoryFirebase {
  final String name;
  final String attribute;
  final String image;

  const QuizCategoryFirebase({
    required this.name,
    required this.attribute,
    required this.image,
  });

  QuizCategoryFirebase.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        attribute = json['attribute'] as String,
        image = json['image'] as String;
}

class QuizQuestion {
  final String category;
  final String id;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  final String question;
  final String? type;
  final String? difficulty;
  final String answeredOption;
  final int index;

  QuizQuestion({
    required this.category,
    required this.id,
    required this.correctAnswer,
    required this.incorrectAnswers,
    required this.question,
    this.type,
    this.difficulty,
    required this.answeredOption,
    required this.index,
  });

  QuizQuestion.fromJson(Map<String, dynamic> json, int index)
      : category = json['category'] as String? ?? '',
        id = json['id'] as String? ?? '',
        correctAnswer = json['correctAnswer'] as String? ?? '',
        incorrectAnswers = (json['incorrectAnswers'] as List<dynamic>)
            .map((dynamic e) => e as String)
            .toList(),
        question = json['question'] as String? ?? '',
        type = json['type'] as String,
        difficulty = json['difficulty'] as String,
        answeredOption = '',
        index = index;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['id'] = this.id;
    data['correctAnswer'] = this.correctAnswer;
    data['incorrectAnswers'] = this.incorrectAnswers;
    data['question'] = this.question;
    data['type'] = this.type;
    data['difficulty'] = this.difficulty;
    return data;
  }

  QuizQuestion copyWith({
    String? category,
    String? id,
    String? correctAnswer,
    List<String>? incorrectAnswers,
    String? question,
    String? type,
    String? difficulty,
    String? answeredOption,
    int? index,
  }) =>
      QuizQuestion(
        category: category ?? this.category,
        id: id ?? this.id,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
        question: question ?? this.question,
        type: type ?? this.type,
        difficulty: difficulty ?? this.difficulty,
        answeredOption: answeredOption ?? this.answeredOption,
        index: index ?? this.index,
      );
}
