import 'package:flutter/material.dart';
import 'package:results_app/models/logic.dart';
import 'package:results_app/screens/results_options.dart';
import 'package:results_app/src/widgets/app_bar.dart';
import 'package:results_app/src/widgets/text_fields.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controller for the name input field
  final nameController = TextEditingController();

  // List of controllers for the score input fields
  final List<TextEditingController> controllers = List.generate(
    10,
    (_) => TextEditingController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBg(title: "My App"),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                opacity: 0.1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Title
                  const Center(
                    child: Text(
                      "Student Score",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Input form
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        // Name input field
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Score input fields
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: studentsRecordsLabel["Name"]?.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: homeScreenInputField(
                                  hintText:
                                      studentsRecordsLabel["Name"]?[index],
                                  controller: controllers[index],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Add record button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 30,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: _addRecord,
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            // View results button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 30,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: _viewResults,
                              child: const Text(
                                "View Results",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to add a new record
  void _addRecord() {
  final nameOfStudent = nameController.text;
  List<int> scoreDetails = [];

  // Validate the input fields
  for (var controller in controllers) {
    final text = controller.text;
    if (text.isEmpty || int.tryParse(text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter valid numbers for all scores."),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final score = int.parse(text);
    if (score < 0 || score > 100) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Scores must be between 0 and 100."),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    scoreDetails.add(score);
  }

  // Add the new record to the studentsScores map
  studentsScores[nameOfStudent] = scoreDetails;

  // Clear the input fields
  for (var controller in controllers) {
    controller.clear();
  }

  // Show a success message
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Records added successfully!"),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

  // Method to navigate to the results screen
  void _viewResults() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultsOptions()),
    );
  }
}
