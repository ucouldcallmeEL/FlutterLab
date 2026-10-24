import 'dart:core';
import 'package:flutter/material.dart';

import 'WelcomeScreen.dart';

class Signupscreen extends StatefulWidget {
  const new({super.key});

  @override
  State<Signupscreen> createState() => _SignupState();
}
class Validators{
  static String? validateName(String? value){
    if (value == null || value.isEmpty){
      return 'Name is required';
    }
    return null;
  }
  static String? validateEmail(String? value){
    if (value == null || value.isEmpty || !value.contains('@')){
      return 'Enter a valid email';
    }
    return null;
  }
  static String? validatePhone(String? value){
    if (value == null || value.isEmpty || value.length != 11){
      return 'Phone number is required';
    }
    return null;
  }
  static String? validateTravelStyle(String? value){
    if (value == null || value.isEmpty){
      return 'Travel style is required';
    }
    return null;
  }
}

class _SignupState extends State<Signupscreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _travelStyleController = TextEditingController();

  @override
  void dispose(){
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _travelStyleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Your Profile'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsetsGeometry.all(12.0),
            child: Column(
              spacing: 15.0,
              children: [
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder()
                  ),
                  validator: Validators.validateName
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder()
                  ),
                  validator: Validators.validateEmail
                ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder()
                  ),
                  validator: Validators.validatePhone
                ),
                TextFormField(
                  controller: _travelStyleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Travel Style',
                      border: OutlineInputBorder()
                  ),
                  validator: Validators.validateTravelStyle
                ),
                ElevatedButton(
                    onPressed: (){
                      if ( _formKey.currentState!.validate()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>
                                  WelcomeScreen(name: _nameController.text),
                          ),
                        );
                      }
                    },
                    child: Text('Continue')
                )
              ],
            ))
      )
    );
  }
}