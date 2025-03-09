import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:results_app/models/state_management.dart';
import 'package:results_app/screens/all_students_results.dart';
import 'package:results_app/screens/student.dart';
import 'package:results_app/src/widgets/app_bar.dart';

class ResultsOptions extends ConsumerStatefulWidget {
  const ResultsOptions({super.key});

  @override
  ConsumerState<ResultsOptions> createState() => _ResultsOptionsState();
}

class _ResultsOptionsState extends ConsumerState<ResultsOptions> {
  @override
  Widget build(BuildContext context) {
    final studentRecord = ref.watch(studentRecordProvider);
    return Scaffold(
      appBar: appBarWithBg(title: "Results"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AllStudentsResults()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          "All Students Results",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "List of Students",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 700,
                    child: ListView.builder(
                      itemCount: studentRecord.length,
                      itemBuilder: (context, index) {
                        final studentName = studentRecord.keys.toList()[index];
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                studentName,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Student()));
                                    },
                                    icon: Icon(Icons.remove_red_eye),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ref.read(studentRecordProvider.notifier).deleteRecord(studentName);
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

