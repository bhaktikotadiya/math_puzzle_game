import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:math_puzzle_game/math_puzzle/data.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzle_game/math_puzzle/main_page.dart';
import 'package:math_puzzle_game/math_puzzle/play_game.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

void main()
{
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    ));
}
class four extends StatefulWidget {
  int level_no;
  bool ?is_skip;
  four(this.level_no,[this.is_skip]);

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {

  bool temp=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller=PageController(initialPage: widget.pos2);
    // get_permission();
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('myassets/puzzel/$path');
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black38,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("myassets/puzzel/background.jpg"))
                ),
                child: Column(children: [
                  Expanded(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      Expanded(
                        child: Container(
                           alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
                          child: (widget.is_skip==true)?Text("LEVEL ${widget.level_no+1} COMPLETED",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueAccent,fontFamily: "eight")):
                          Text("LEVEL ${widget.level_no} COMPLETED",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueAccent,fontFamily: "eight")),
                        ),
                      ),
                    ],),
                  ),
                  Expanded(flex:3,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                          // height: 300,
                          // width: 200,
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              // color: Colors.amberAccent,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("myassets/puzzel/trophy.png"))
                           ),
                        ),
                      ),
                    ],),
                  ),
                  // Expanded(flex: 1,
                  //   child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      Expanded(
                        child: InkWell(onTap: () {
                          if(widget.is_skip==true)
                          {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                widget.level_no++;
                                return second(widget.level_no);
                              },
                              ));
                          }
                          else
                          {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return second();
                              },
                              ));
                          }
                          setState(() { });
                        },
                          child: Container(
                            // width: 200,
                            // height: 50,
                            width: double.infinity,
                            height: double.infinity,
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(100, 35, 100, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.black54,Colors.white])
                            ),
                            child: Text("CONTINUE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "five")),
                          ),
                        ),
                      ),
                  //   ],),
                  // ),
                  Expanded(
                    child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return first();
                      },));
                    },
                      child: Container(
                        // width: 200,
                        // height: 50,
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(100, 30, 100, 0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black54,Colors.white])
                        ),
                        child: Text("MAIN MENU",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "five")),
                      ),
                    ),
                  ),
                  Expanded(
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
                                decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black12,Colors.white,Colors.black54])),
                                child: Text("BUY",style: TextStyle(fontSize: 15,color: Colors.indigo)),
                              ),
                              InkWell(onTap: () {
                                Navigator.pop(context);
                              },
                                child: Container(
                                  height: 30,alignment: Alignment.center,
                                  width: 90,margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black12,Colors.white,Colors.black54])),
                                  child: Text("NO THANKS",style: TextStyle(fontSize: 15,color: Colors.indigo)),
                                ),
                              ),
                              // ),
                            ],)
                          ],scrollable: true,);
                      },);
                    },
                      child: Container(
                        // width: 200,
                        // height: 50,

                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(100, 30, 100, 5),
                        decoration: BoxDecoration(
                            // color: Colors.amberAccent,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black54,Colors.white])
                        ),
                        child: Text("BUY PRO",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "five")),
                      ),
                    ),
                  ),
                   Expanded(
                     child: Container(
                       // width: 200,
                       // height: 50,
                       width: double.infinity,
                       height: double.infinity,
                       alignment: Alignment.center,
                       margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                       decoration: BoxDecoration(
                           // border: Border.all(color: Colors.black),
                           // borderRadius: BorderRadius.circular(10),
                           //   color: Colors.brown,
                       ),
                       child: Text("SHARE THIS PUZZLE",style: TextStyle(fontSize: 30,color: Colors.indigoAccent,fontFamily: "three")),
                     ),
                   ),

                  // Expanded(
                  //   child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      Expanded(flex: 2,
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
                          child: InkWell(onTap: () async {
                            print("share img");
                            getImageFileFromAssets("share${widget.level_no}.png").then((value) {
                              print(value);
                              // print("share img : ${config.share_puzzle[widget.level_no]}");
                              Share.shareFiles(['${value.path}'], text: 'Great picture');
                            });
                            setState(() { });
                          },
                            child: Container(
                              // width: 50,
                              // height: 50,
                              width: double.infinity,
                              height: double.infinity,
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(185, 0, 185, 120),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: (temp==true)?[Colors.white,Colors.white]:[Colors.black54,Colors.white]),
                                //   color: Colors.brown,
                                image: DecorationImage(
                                    fit: BoxFit.scaleDown,
                                    image: AssetImage("myassets/puzzel/shareus.png"),
                                ),
                              ),
                              // child: Text("SHARE THIS PUZZLE"),
                            ),
                          ),
                        ),
                      )
                    // ],),
                  // )
                ]),
              ),
            ),
          ],)
      ),
    );
  }
}
