import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,home: demo(),
    ));
}
class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text("DEMO",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.lerp(FontWeight.w300, FontWeight.w400, 0.5),)),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
