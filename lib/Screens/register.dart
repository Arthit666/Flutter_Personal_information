// ignore_for_file: prefer_const_constructors, prefer_final_fields, avoid_print, iterable_contains_unrelated_type

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_information/Screens/information.dart';
import 'package:personal_information/models/profile.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const routeName = '/register';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  String gender = 'Male';
  List<Profile> listProfile = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Audit.png',
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Surname',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: surname,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter surname';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Gender',
                      style: TextStyle(fontSize: 20),
                    ),
                    DropdownButton(
                      value: gender,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 9,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          gender = newValue!;
                        });
                      },
                      items: <String>['Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(fontSize: 15)),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Age',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: age,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter age';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Address (city)',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: address,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  Profile profile = Profile(
                                      name: name.text,
                                      surname: surname.text,
                                      age: age.text,
                                      gender: gender,
                                      address: address.text);
                                  name.clear();
                                  surname.clear();
                                  age.clear();
                                  gender = 'Male';
                                  address.clear();
                                  listProfile.add(profile);
                                });
                              }
                            },
                            child: Text('Submit')),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ElevatedButton(
                            onPressed: () {
                              _formKey.currentState!.reset();
                              Navigator.pushNamed(context, '/information',
                                  arguments: InformationArguments(listProfile));
                            },
                            child: Text('All User')),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Number of users: ${listProfile.length}'),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
