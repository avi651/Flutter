// Import flutter helper library
import 'package:flutter/material.dart';

// create a class that will be our custom widget
// This class must extend the 'StatlessWidget' base class

class App extends StatelessWidget {
  Widget build(context) {
   return MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
              print('Hi there');
            },
          ),
          appBar: AppBar(
            title: Text('Lets see some images'),
          ),
        )
    );
  }
}
