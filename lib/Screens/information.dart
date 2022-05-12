// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:personal_information/models/profile.dart';

class InformationArguments {
  final List<Profile> listProfile;

  InformationArguments(this.listProfile);
}

class InformationScreen extends StatefulWidget {
  InformationScreen({Key? key}) : super(key: key);
  static const routeName = '/information';

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as InformationArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            Container(
              height: 50,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7,
                      child: Center(
                        child: Text(
                          'Name',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7,
                      child: Center(
                        child: Text(
                          'Surname',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7,
                      child: Center(
                        child: Text(
                          'Age',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7,
                      child: Center(
                        child: Text(
                          'Gender',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 7,
                      child: Center(
                        child: Text(
                          'Address',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.purple,
              thickness: 3,
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: args.listProfile.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 45,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          child: Center(
                            child: Text(
                              '${args.listProfile[index].name}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          child: Center(
                            child: Text(
                              '${args.listProfile[index].surname}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          child: Center(
                            child: Text(
                              '${args.listProfile[index].age}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          child: Center(
                            child: Text(
                              '${args.listProfile[index].gender}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 7,
                          child: Center(
                            child: Text(
                              '${args.listProfile[index].address}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
