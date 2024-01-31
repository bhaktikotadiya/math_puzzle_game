import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzle_game/math_puzzle/play_game.dart';
import 'package:math_puzzle_game/math_puzzle/grid.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:math_puzzle_game/math_puzzle/data.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,home: first(),
  ));
}
class first extends StatefulWidget {
  // const first({super.key});
  static SharedPreferences? prefs;

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  List l=[];
  bool temp=false;
  bool temp1=false;
  bool temp2=false;

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    get_pref();
  }

  Future<void> get_pref() async
  {
      first.prefs=await SharedPreferences.getInstance();
      // Save an integer value to 'levelNo' key.
      int levelNo = first.prefs!.getInt('levelNo') ?? 0;
      l=List.filled(config.puzzle_ans.length,"no");
      for(int i=0; i<levelNo; i++)
        {
          l[i] = first.prefs!.getString("level_status $i");
          print("puzzle_level ${i+1} = ${l[i]}");
        }

      setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(child: SafeArea(
        child: Column(children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("myassets/puzzel/background.jpg"))
              ),
              child: Column(children: [
                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
                          child: Text("MATH PUZZLES",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.blueAccent,fontFamily: "six")),),
                      ),
                    ],),
                ),
                Expanded(flex: 5,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
                        // width: 500,
                        // height: 500,
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("myassets/puzzel/blackboard_main_menu.png"))
                        ),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                          Expanded(
                            child: GestureDetector(
                              onTapUp: (details)
                              {
                                print("hello");
                                temp=false;
                                setState(() { });
                              },
                              onTapCancel: ()
                              {
                                print("hi..");
                                temp=false;
                                setState(() { });
                              },
                              onTapDown: (details)
                              {
                                print("how are you");
                                temp=true;
                                setState(() { });
                              },
                              child: InkWell(onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second();
                                },));
                                setState(() { });
                              },
                                child: Container(alignment: Alignment.center,
                                  // width: 200,
                                  // height: 50,
                                  width: double.infinity,
                                  height: double.infinity,
                                  margin: EdgeInsets.fromLTRB(100, 100, 100, 0),
                                  decoration: BoxDecoration(
                                    // color: Colors.cyan,
                                    border: (temp==true) ? Border.all(color: Colors.white,width: 5):null,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text("CONTINUE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white,fontFamily: "six")),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTapUp: (details)
                              {
                                print("hello");
                                temp1=false;
                                setState(() { });
                              },
                              onTapCancel: ()
                              {
                                print("hi..");
                                temp1=false;
                                setState(() { });
                              },
                              onTapDown: (details)
                              {
                                print("how are you");
                                temp1=true;
                                setState(() { });
                              },
                              child: InkWell(onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return third(l);
                                },));
                              },
                                child: Container(alignment: Alignment.center,
                                  // width: 200,
                                  // height: 50,
                                  width: double.infinity,
                                  height: double.infinity,
                                  margin: EdgeInsets.fromLTRB(100, 40, 100, 40),
                                  decoration: BoxDecoration(
                                    // color: Colors.cyan,
                                    border: (temp1==true) ? Border.all(color: Colors.white,width: 5):null,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text("PUZZLES",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white,fontFamily: "six")),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTapUp: (details)
                              {
                                print("hello");
                                temp2=false;
                                setState(() { });
                              },
                              onTapCancel: ()
                              {
                                print("hi..");
                                temp2=false;
                                setState(() { });
                              },
                              onTapDown: (details)
                              {
                                print("how are you");
                                temp2=true;
                                setState(() { });
                              },
                              // child: InkWell(onTap: () {
                              //
                              // },
                              child: InkWell(onTap: ()
                              {
                                showDialog(barrierColor: Colors.transparent,barrierDismissible: false,context: context, builder: (context)
                                {
                                  return AlertDialog(alignment: Alignment.center,
                                    title: Text("Benifit of pro version",style: TextStyle(fontSize: 20,color: Colors.indigo),),
                                    content: Text("1.No ads \n2.no wait time ads and skip \n3.Hint for every level \n4.Solution for every level",style: TextStyle(fontSize: 20,color: Colors.black),),
                                    actions: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                                        Container(
                                          height: 30,alignment: Alignment.center,
                                          width: 90,margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(gradient: LinearGradient(colors: [CupertinoColors.darkBackgroundGray,Colors.white,Colors.black54])),
                                          child: Text("BUY",style: TextStyle(fontSize: 20,color: Colors.indigo)),
                                        ),
                                        InkWell(onTap: () {
                                          Navigator.pop(context);
                                        },
                                          child: Container(
                                            height: 30,alignment: Alignment.center,
                                            width: 90,margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(gradient: LinearGradient(colors: [CupertinoColors.darkBackgroundGray,Colors.white,Colors.black54])),
                                            child: Text("NO-THANKS",style: TextStyle(fontSize: 15,color: Colors.indigo)),
                                          ),
                                        ),
                                        // ),
                                      ],)
                                    ],scrollable: true,);
                                },);
                              },
                                child: Container(alignment: Alignment.center,
                                  // width: 200,
                                  // height: 50,
                                  width: double.infinity,
                                  height: double.infinity,
                                  margin: EdgeInsets.fromLTRB(100, 0, 100, 100),
                                  decoration: BoxDecoration(
                                    // color: Colors.cyan,
                                    border: (temp2==true) ? Border.all(color: Colors.white,width: 5):null,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text("BUY PRO",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white,fontFamily: "six")),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],),
                ),
                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                    Expanded(flex: 3,child: Text("")),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Share.share('https://play.google.com/store/apps/details?id=com.applabs.puzzle&hl=en-IN');
                        },
                        child: Container(
                          // height: 50,
                          // width: 50,
                          width: double.infinity,
                          height: double.infinity,
                          margin: EdgeInsets.only(top: 50,right: 20),
                          decoration: BoxDecoration(
                              gradient: RadialGradient(colors: [Colors.white12,Colors.black54]),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.scaleDown,
                                  image: AssetImage("myassets/puzzel/shareus.png"))
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // height: 50,
                        // width: 50,
                        width: double.infinity,
                        height: double.infinity,
                        margin: EdgeInsets.only(top: 50,right: 20),
                        decoration: BoxDecoration(
                            gradient: RadialGradient(colors: [Colors.white12,Colors.black54]),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.scaleDown,
                                image: AssetImage("myassets/puzzel/emailus.png"))
                        ),
                      ),
                    ),
                  ],),
                ),
                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                    Expanded(flex: 2,child: Text("")),
                    Expanded(flex: 2,
                      child: Container(alignment: Alignment.center,
                        width: double.infinity,
                        height: double.infinity,
                        // width: double.infinity,
                        // height: double.infinity,
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 50),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,style: BorderStyle.solid),
                          // color: Colors.cyan,
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
                      ),
                    ),
                  ],),
                ),
              ]),
            ),
          )
        ]),
      ),
          onWillPop: () async {
            showDialog(barrierColor: Colors.transparent,barrierDismissible: true,context: context, builder: (context) {
              return AlertDialog(
                alignment: Alignment.center,
                title: Text("Game exit",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo,fontSize: 15)),
                content: Text("Are you sure for exit game???",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo,fontSize: 15)),
                actions: [
                  TextButton(onPressed: () {
                      exit(0);
                  }, child: Text("Yes",style: TextStyle(color: Colors.red),)),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return first();
                    },));
                  }, child: Text("No",style: TextStyle(color: Colors.red),))
                ],
                scrollable: true,
              );
            },);
            return true;
          },),
    );
  }
}
