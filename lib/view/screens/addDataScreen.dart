import 'dart:io';

import 'package:core_flutter_final_exam/utils/controllers.dart';
import 'package:core_flutter_final_exam/utils/studentsDataList.dart';
import 'package:core_flutter_final_exam/utils/textFormFieldsmartWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'homeScreen.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

GlobalKey<FormState> studentValidation = GlobalKey<FormState>();

class _AddDataScreenState extends State<AddDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Add Student Data"),
      ),
      body: Form(
        key: studentValidation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  pickImage();
                },
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: (students[count]['image'] != null)
                        ? FileImage(students[count]['image']!)
                        : null),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      students[count]['image'] = null;
                    });
                  },
                  child: Text("Remove")),
              SizedBox(
                height: 30,
              ),
              textFormField(students[count]['studentGrid'], "Student Grid"),
              SizedBox(
                height: 30,
              ),
              textFormField(students[count]['studentName'], "Student Name"),
              SizedBox(
                height: 30,
              ),
              textFormField(students[count]['studentStd'], "Student Std"),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () {
                    if (studentValidation.currentState!.validate()) {
                      Navigator.of(context).pushReplacementNamed('home');
                    }
                  },
                  child: Text(
                    "Add Data",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  ImagePicker imagePicker = ImagePicker();

  Future<void> pickImage() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    students[count]['image'] = File(image!.path);
    setState(() {});
  }
}
