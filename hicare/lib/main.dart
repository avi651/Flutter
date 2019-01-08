import 'package:flutter/material.dart';
import 'CustomShapeCliper.dart';
import 'CustomColors.dart';
import 'Constatnt.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flight List Mock up',
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
    theme: appTheme,
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
           HomeScreenTopPart()
        ],
      ),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {

  var selectedLocationIndex = 0;
  var isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(clipper: CustomShapeCliper(),
         child: Container(height: 400.0,
         decoration: BoxDecoration(gradient:LinearGradient(colors: [
           firstColor,
           secondColor,
         ],),),
           child: Column(
             children: <Widget>[
               SizedBox(height: 50,),
               Padding(
                 padding: const EdgeInsets.all(20.0),
                  child: Row(
                     children: <Widget>[
                       Icon(Icons.location_on, color: Colors.white,),
                       SizedBox(width: 16.0,),
                       PopupMenuButton(
                         onSelected: (index) {
                           setState(() {
                             selectedLocationIndex = index;
                           });
                         },
                         child: Row(
                         children: <Widget>[
                           Text(locations[selectedLocationIndex], style: TextStyle(color: Colors.white),),
                           Icon(Icons.keyboard_arrow_down, color: Colors.white,),
                         ],
                       ),
                           itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                             PopupMenuItem(
                               child: Text(locations[0],style:dropDownMenuItemStyle ,),
                               value: 0,
                             ),
                             PopupMenuItem(
                               child: Text(locations[1],style:dropDownMenuItemStyle ,),
                               value: 1,
                             ),

    ],
                       ),
                       Spacer(),
                       Icon(Icons.settings,color: Colors.white,),
                     ],
                   ),
               ),
               SizedBox(height: 50.0,),
               Text('Where whould\nyou want to go?', style: TextStyle(fontSize: 24.0, color: Colors.white), textAlign: TextAlign.center,),
               SizedBox(height: 30.0,),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 32),
                 child: Material(
                   elevation: 5.0,
                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                   child: TextField(
                     controller: TextEditingController(text: locations[0]),
                     style: dropDownMenuItemStyle,
                     cursorColor: appTheme.primaryColor,
                     decoration: InputDecoration(
                       contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                       suffix: Material(
                         elevation: 2.0,
                         borderRadius: BorderRadius.all(Radius.circular(30.0)),
                         child: Icon(Icons.search, color: Colors.black,),
                       ),
                       border: InputBorder.none,
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 20.0,),
               Row(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: <Widget>[
                   InkWell(
                     child: ChoiceChip(Icons.flight_takeoff,"Flights", isFlightSelected),
                     onTap: () {
                       isFlightSelected != true;
                       print(isFlightSelected);
                     },
                   ),
                    SizedBox(width: 20.0,),
                   InkWell(
                     child: ChoiceChip(Icons.hotel,"Hotels",isFlightSelected),
                     onTap: () {
                       isFlightSelected != false;
                      print(isFlightSelected);
                     },
                   ),

                 ],
               )
             ],
           ),
         ))
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon,this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.isSelected ? BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.all(Radius.circular(20.0)
          ),
      ): null,
     child: Row(
       mainAxisSize: MainAxisSize.min,
       //mainAxisAlingment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
      Icon(widget.icon, size: 20.0, color: Colors.white,),
      SizedBox(
        width: 8.0,
      ),
      Text(widget.text, style: TextStyle(color: Colors.white,fontSize: 14.0)),
    ],),
    );
  }
}