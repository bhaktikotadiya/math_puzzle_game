import 'package:math_puzzle_game/math_puzzle/main_page.dart';
import 'package:math_puzzle_game/math_puzzle/play_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzle_game/math_puzzle/grid2.dart';
import 'package:math_puzzle_game/math_puzzle/grid.dart';


void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,home: fifth(),
  ));
}
class fifth extends StatefulWidget {
  List ?l;
  fifth([this.l]);

  @override
  State<fifth> createState() => _fifthState();
}

class _fifthState extends State<fifth> {
  List a=["25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48"];

  int levelNo=24;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_pref();
  }

  get_pref()
  {
    levelNo = first.prefs!.getInt("levelNo") ?? 0;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          // margin: EdgeInsets.all(40),
                          child: Text("Select Puzzle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.blueAccent,fontFamily: "nine")),),
                      ),
                    ],),
                ),
                Expanded(flex: 8,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        // margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        // color: Colors.blue,
                        // height: 550,
                        // width: 500,
                        width: double.infinity,
                        height: double.infinity,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: a.length,
                          itemBuilder: (context, index) {
                            return InkWell(onTap: () {
                              if(index+24<levelNo || widget.l?[index+24]=="yes")
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return second(index+24,true);
                                  },));
                                }
                            },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                // height: 80,
                                // width: 80,
                                width: double.infinity,
                                height: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: (index+24<levelNo)?Border.all(color: Colors.black54):null,
                                  // color: Colors.pinkAccent,
                                  image: (index+24 < levelNo) ? (widget.l?[index+24]=="yes") ?
                                  DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("myassets/puzzel/tick.png")) : null :
                                  DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("myassets/puzzel/lock.png")),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: (index+24 < levelNo) ? Text("${index+25}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "two"),) :null,
                              ),
                            );
                          },),
                      ),
                    )
                  ],),
                ),
                Expanded(child: Text("")),
                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    Expanded(
                      child: InkWell(onTap:()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return third(widget.l);
                        },));
                      },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          // height: 60,
                          // width: 60,
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.teal,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("myassets/puzzel/back.png")),
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 4,child: Text("")),
                    Expanded(
                      child: InkWell(onTap:()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return sixth(widget.l);
                        },));
                      },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                          // height: 60,
                          // width: 60,
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.teal,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("myassets/puzzel/next.png")),
                          ),
                        ),
                      ),
                    ),
                  ],),
                ),
              ]),
            ),
          )
        ],),
      ),
    );
  }
}


//six class-----
class sixth extends StatefulWidget {
  List ?l;
  sixth([this.l]);

  @override
  State<sixth> createState() => _sixthState();
}

class _sixthState extends State<sixth> {
  List a=["49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72"];
  int levelNo=48;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_pref();
  }

  get_pref()
  {
    levelNo = first.prefs!.getInt("levelNo") ?? 0;
    setState(() { });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          // margin: EdgeInsets.all(40),
                          child: Text("Select Puzzle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.blueAccent,fontFamily: "nine")),),
                      ),
                    ],),
                ),
                Expanded(flex: 9,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        // margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        // color: Colors.blue,
                        // height: 550,
                        // width: 500,
                        width: double.infinity,
                        height: double.infinity,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: a.length,
                          itemBuilder: (context, index) {
                            return InkWell(onTap: () {
                              if(index+48<levelNo || widget.l?[index+48]=="yes")
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second(index+48,true);
                                },));
                              }
                            },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                // height: 80,
                                // width: 80,
                                width: double.infinity,
                                height: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: (index+48<levelNo)?Border.all(color: Colors.black54):null,
                                  // color: Colors.pinkAccent,
                                  image: (index+48 < levelNo) ? (widget.l?[index+48]=="yes") ?
                                  DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("myassets/puzzel/tick.png")) : null :
                                  DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("myassets/puzzel/lock.png")),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: (index+48 < levelNo) ? Text("${index+49}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "two"),) :null,
                              ),
                            );
                          },),
                      ),
                    )
                  ],),
                ),
                Expanded(child: Text("")),
                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    Expanded(
                      child: InkWell(onTap:()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return fifth(widget.l);
                        },));
                      },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          // height: 60,
                          // width: 60,
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.teal,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("myassets/puzzel/back.png")),
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 4,child: Text("")),
                    Expanded(
                      child: InkWell(onTap:()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return seventh(widget.l);
                        },));
                      },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                          // height: 60,
                          // width: 60,
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.teal,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("myassets/puzzel/next.png")),
                          ),
                        ),
                      ),
                    ),
                  ],),
                ),
              ]),
            ),
          )
        ],),
      ),
    );
  }
}


//seven class-----
class seventh extends StatefulWidget {
  List ?l;
  seventh([this.l]);

  @override
  State<seventh> createState() => _seventhState();
}

class _seventhState extends State<seventh> {
  List a=["73","74","75"];
  int levelNo=72;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_pref();
  }

  get_pref()
  {
    levelNo = first.prefs!.getInt("levelNo") ?? 0;
    setState(() { });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          // margin: EdgeInsets.all(40),
                          child: Text("Select Puzzle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.blueAccent,fontFamily: "nine")),),
                      ),
                    ],),
                ),
                Expanded(flex: 9,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        // margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        // color: Colors.blue,
                        // height: 550,
                        // width: 500,
                        width: double.infinity,
                        height: double.infinity,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: a.length,
                          itemBuilder: (context, index) {
                            return InkWell(onTap: () {
                              if(index+72<levelNo || widget.l?[index+72]=="yes")
                              {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second(index+72,true);
                                },));
                              }
                            },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                // height: 80,
                                // width: 80,
                                width: double.infinity,
                                height: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: (index+72<levelNo)?Border.all(color: Colors.black54):null,
                                  // color: Colors.pinkAccent,
                                  image: (index+72 < levelNo) ? (widget.l?[index+72]=="yes") ?
                                  DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("myassets/puzzel/tick.png")) : null :
                                  DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("myassets/puzzel/lock.png")),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: (index+72 < levelNo) ? Text("${index+73}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "two"),) :null,
                              ),
                            );
                          },),
                      ),
                    )
                  ],),
                ),
                Expanded(child: Text("")),
                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    Expanded(
                      child: InkWell(onTap:()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        {
                          return sixth(widget.l);
                        },));
                      },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          // height: 60,
                          // width: 60,
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.teal,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("myassets/puzzel/back.png")),
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 4,child: Text("")),
                  ],),
                ),
              ]),
            ),
          )
        ],),
      ),
    );
  }
}

