import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/create_project_controller.dart';

// ignore: must_be_immutable
class CreateProjectView extends GetView<CreateProjectController> {
  CreateProjectController _createProjectController =
      Get.put(CreateProjectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    Text(
                      'Create Project',
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _createProjectController.getTextfield(
                        hintText: "Project Name"),
                    SizedBox(
                      height: 20.h,
                    ),
                    _createProjectController.getTextfield(
                        hintText: "Project Date"),
                    SizedBox(
                      height: 20.h,
                    ),
                    _createProjectController.getTextfield(
                        hintText: "Company Details (Name,Carch Phrase)"),
                    SizedBox(
                      height: 20.h,
                    ),
                    _createProjectController.getTextfield(hintText: "Website"),
                    SizedBox(
                      height: 20.h,
                    ),
                    _createProjectController.getTextfield(hintText: "Location"),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(13.sp),
                      height: Get.height * 0.06,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.white),
                          color: Colors.white),
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              List<DropdownMenuItem> usersList = [];
                              for (int i = 0;
                                  i < snapshot.data!.docs.length;
                                  i++) {
                                DocumentSnapshot snap = snapshot.data!.docs[i];
                                usersList.add(DropdownMenuItem(
                                  child: Text(
                                    snap['username'],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  value: snap['username'],
                                ));
                              }

                              return DropdownButton<dynamic>(
                                items: usersList,
                                onChanged: (item) {
                                  _createProjectController.selectedItem = item!;
                                },
                                // isExpanded: false,
                                value: _createProjectController.selectedItem,
                                hint: new Text(
                                  'Assign User',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              );
                            }
                          }
                          // return ListView(
                          //   children: snapshot.data!.docs.map((document) {
                          //     return Container(
                          //       child: Center(child: Text(document['username'])),
                          //     );
                          //   }).toList(),
                          // );
                          //         return  DropdownButton<String>(
                          //   alignment: Alignment.center,
                          //   style: const TextStyle(
                          //      color: Colors.black),
                          //   dropdownColor: Colors.white,
                          //   elevation: 5,
                          //   value:
                          //   'Hello',
                          //   items:
                          //    snapshot.data!.docs.map((document) {
                          //  List<DropdownMenuItem<String>> list=document['username'];

                          //    }).toList()

                          //   ,onChanged: (item) async {
                          //     // setState(() {
                          //     //   selectedItem = item!;
                          //     // });

                          //     // selectedItem == "Custom"
                          //     //     ? await dateRangePicker()
                          //     //     : await TransactionDB.instance
                          //     //         .filterList(selectedItem);
                          //   });
                          ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: (() {}),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.blue,
                            ),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(vertical: 14.h))),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ]),
            ),
          ),
        ));
  }
}
