import 'package:flutter/widgets.dart';

// A map to store the labels for student records
final Map<String, List<String>> studentsRecordsLabel = {
  "Name": [
    "English",
    "Mathematics",
    "Integrated Science",
    "Social Studies",
    "RME",
    "Creative Arts",
    "Computing",
    "Career Technology",
    "Ga Language",
    "Arabic",
  ],
};

// A map to store the scores of students
final Map<String, List<int>> studentsScores = {};

//Name Controller
final nameController = TextEditingController();

// A list of TextEditingController to manage input fields
final List<TextEditingController> controllers = List.generate(
  10,
  (_) => TextEditingController(),
);

// A class to represent the scores of a student in various subjects
class StudentScore {
  final int english;
  final int mathematics;
  final int science;
  final int social;
  final int rme;
  final int creative;
  final int computing;
  final int career;
  final int ga;
  final int arabic;

  // Constructor to initialize the scores
  StudentScore({
    required this.english,
    required this.mathematics,
    required this.science,
    required this.social,
    required this.rme,
    required this.creative,
    required this.computing,
    required this.career,
    required this.ga,
    required this.arabic,
  });
}

// A function to calculate the grade based on the score
int gradeCalculator(int score) {
  if (score > 90) return 1; // Grade 1 for scores above 90
  if (score > 80) return 2; // Grade 2 for scores above 80
  if (score > 70) return 3; // Grade 3 for scores above 70
  if (score > 60) return 4; // Grade 4 for scores above 60
  if (score > 54) return 5; // Grade 5 for scores above 54
  if (score > 50) return 6; // Grade 6 for scores above 50
  if (score > 44) return 7; // Grade 7 for scores above 44
  if (score > 34) return 8; // Grade 8 for scores above 34
  return 9; // Grade 9 for scores 34 and below
}
