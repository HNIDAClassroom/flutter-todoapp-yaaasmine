import 'package:flutter/material.dart';

import 'package:todolist_app/widgets/tasks.dart';


class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
    
     
      appBar: AppBar(
        title: Text('Create an Account'),

     
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
               onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                
                                  builder: (context) => const Tasks()));
                        },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
