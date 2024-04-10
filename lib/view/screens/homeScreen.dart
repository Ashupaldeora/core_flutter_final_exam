import 'dart:io';

import 'package:core_flutter_final_exam/utils/studentsDataList.dart';
import 'package:core_flutter_final_exam/utils/textFormFieldsmartWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int count = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void state() {
      setState(() {});
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Student Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.amber,
                ),
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              trailing: Container(
                height: 50,
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Edit Data"),
                                    content: Container(
                                      height: 500,
                                      width: double.maxFinite,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                pickImage(index);
                                                setState(() {});
                                              },
                                              child: CircleAvatar(
                                                  radius: 50,
                                                  backgroundImage:
                                                      (students[index]
                                                                  ['image'] !=
                                                              null)
                                                          ? FileImage(
                                                              students[index]
                                                                  ['image']!)
                                                          : null),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            textFormField(
                                                students[index]['studentGrid'],
                                                "Student Grid"),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            textFormField(
                                                students[index]['studentName'],
                                                "Student Name"),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            textFormField(
                                                students[index]['studentStd'],
                                                "Student Std"),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Colors.amber)),
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content:
                                                              Text("Updated")));

                                                  Navigator.of(context)
                                                      .pushReplacementNamed(
                                                          'home');
                                                },
                                                child: Text(
                                                  "Update",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          students.removeAt(index);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
              ),
              title: Text('${students[index]['studentName'].text}'),
              subtitle: Text(students[index]['studentStd'].text),
              leading: Container(
                height: 80,
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' GR : \n${students[index]['studentGrid'].text}'),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: (students[index]['image'] != null)
                          ? FileImage(students[index]['image'])
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController txtTempGrid = TextEditingController();
          TextEditingController txtTempName = TextEditingController();
          TextEditingController txtTempStd = TextEditingController();
          File? image;
          Map tempMap = {
            'image': image,
            'studentGrid': txtTempGrid,
            'studentName': txtTempName,
            'studentStd': txtTempStd,
          };
          students.add(tempMap);
          count = students.length - 1;
          Navigator.of(context).pushNamed('/addData');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ImagePicker imagePicker = ImagePicker();

  Future<void> pickImage(int index) async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    students[index]['image'] = File(image!.path);
    setState(() {});
  }
}
