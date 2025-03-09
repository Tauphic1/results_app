import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:results_app/models/logic.dart';


class StudentRecordNotifier extends StateNotifier<Map<String, List<int>>> {
  StudentRecordNotifier(Map<String, List<int>> initialRecords) : super(initialRecords);

  void deleteRecord(String name) {
    state = {...state};
    state.remove(name);
  }

  // void updateRecord(String name){
  //   state = {...state};
  //   state.entries.
  // }
}

final studentRecordProvider = StateNotifierProvider((ref) => StudentRecordNotifier(studentsScores));