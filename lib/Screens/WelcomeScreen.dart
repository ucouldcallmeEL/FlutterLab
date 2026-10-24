import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Screens/DestinationsScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.name});
  final String name;

  // Text('Welcome, $name!')

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 15.0,
            children: [
              Icon(Icons.auto_stories,
              size: 80,),
              Text('Welcome, $name!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.blueGrey,
                ),
              ),
              Text(
                'Your next adventure is waiting!',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Colors.blueGrey,
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context)=>
                        Destinationsscreen(),
                  ),
                );
              },
                  child: const Text('Browse'),
              ),
            ],
          ),
        )
      )
    );
  }
}
