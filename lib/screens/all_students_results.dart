import 'package:flutter/material.dart';
import 'package:results_app/models/logic.dart';
import 'package:results_app/src/widgets/text_style.dart' show textStyleOne;

class AllStudentsResults extends StatelessWidget {
  const AllStudentsResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results Table"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SizedBox(
        height: 650,
        child: SingleChildScrollView(
          child: PaginatedDataTable(
            columns: _buildColumns(),
            rowsPerPage: studentsScores.isEmpty ? 10 : studentsScores.length,
            source: StudentsRecordsSourceTable(),
            headingRowHeight: 56,
            horizontalMargin: 24,
            columnSpacing: 40,
          ),
        ),
      ),
    );
  }

  // Method to build the columns for the DataTable
  List<DataColumn> _buildColumns() {
    const columnTitles = [
      "Student Name",
      "English Language",
      "Mathematics",
      "Integrated Science",
      "Social Studies",
      "R.M.E",
      "Creative Arts",
      "Computing",
      "Career Technology",
      "Ga Language",
      "Arabic Language",
      "Total Score",
      "Final Grade",
    ];

    // Map each column title to a DataColumn widget
    return columnTitles
        .map(
          (title) =>
              DataColumn(label: textStyleOne(title: title, fontSize: 20)),
        )
        .toList();
  }
}

// DataTableSource to provide data for the PaginatedDataTable
class StudentsRecordsSourceTable extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    // Return null if the index is out of range
    if (index >= studentsScores.length) return null;

    // Get the student name and scores for the given index
    final studentName = studentsScores.keys.elementAt(index);
    final scores = studentsScores[studentName]!;

    // Calculate the grades for core subjects
    final coreSubjects = scores.take(3).toList();
    final coreSubGrade = coreSubjects
        .map(gradeCalculator)
        .reduce((a, b) => a + b);

    // Calculate the grades for elective subjects
    final electiveSubjects =
        scores.skip(3).toList()..sort((a, b) => b.compareTo(a));
    final topElectiveSubjects = electiveSubjects.take(3).toList();
  
    final electiveSubGrade = topElectiveSubjects
        .map(gradeCalculator)
        .reduce((a, b) => a + b);

    // Calculate the total score and final grade
    final sumOfScores = coreSubjects.reduce((a,b)=> a+b)+ topElectiveSubjects.reduce((a,b)=>a+b);
    final finalGrade = coreSubGrade + electiveSubGrade;

    // Return a DataRow with the student data
    return DataRow(
      cells: [
        DataCell(Text(studentName)),
        ...scores.map(
          (score) => DataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(score.toString()),
                Text(gradeCalculator(score).toString()),
              ],
            ),
          ),
        ),
        DataCell(Center(child: Text(sumOfScores.toString()))),
        DataCell(Center(child: Text(finalGrade.toString()))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => studentsScores.length;

  @override
  int get selectedRowCount => 0;
}
