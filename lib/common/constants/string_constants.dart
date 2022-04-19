const quizApp = 'quizApp';
const List<String> categories = [
  'Mathematics',
  'Science',
  'Drama',
  'Art & Craft',
  'Knowledge',
  'Language',
  'Mathematics',
  'Science',
  'Drama',
  'Art & Craft',
  'Knowledge',
  'Language',
  'Language',
  'Language',
  'Language',
  'Language',
];

const appTheme = 'appTheme';

const List<String> answers = [
  StringConstants.answerLong,
  StringConstants.answerShort1,
  StringConstants.answerShort2,
  StringConstants.answerShort3,
];

class StringConstants {
  static const question = '''
The graphs of the two linear equations ax + by = c and bx - ay = c, where a, b and c are all not equal to zero.''';
  static const answerLong = '''
The graphs of the two linear equations ax + by = c and bx - ay = c, where a, b and c are all not equal to zero.''';
  static const answerShort1 = 'Perpendicular';
  static const answerShort2 = 'Intersect at two points';
  static const answerShort3 = 'Intersect at one points';
}
