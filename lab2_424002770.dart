import 'dart:io';

double readScore(String label, double max) {
  while (true) {
    stdout.write('Enter $label score (0-${max.toInt()}): ');
    String? input = stdin.readLineSync();
    double? value = double.tryParse(input ?? '');
    if (value != null && value >= 0 && value <= max) {
      return value;
    }
    print('Invalid input. Enter a number from 0 to ${max.toInt()}.');
  }
}

String classify(double grade) {
  if (grade >= 90) {
    return 'Excellent';
  } else if (grade >= 85) {
    return 'Very Good';
  } else if (grade >= 80) {
    return 'Good';
  } else if (grade >= 75) {
    return 'Passed';
  } else {
    return 'Failed';
  }
}

void main() {
  print('=== Student Grade Calculator ===');

  stdout.write('Enter student name: ');
  String name = (stdin.readLineSync() ?? '').trim();
  if (name.isEmpty) {
    name = 'Unknown';
  }

  stdout.write('Enter student ID: ');
  String studentId = (stdin.readLineSync() ?? '').trim();

  double quiz = readScore('Quiz', 20);
  double activity = readScore('Activity', 30);
  double exam = readScore('Exam', 50);

  double finalGrade = quiz + activity + exam;

  print('\n--- Result ---');
  print('Name: $name');
  print('Student ID: $studentId');
  print('Final Grade: ${finalGrade.toStringAsFixed(2)} / 100');
  print('Classification: ${classify(finalGrade)}');
}