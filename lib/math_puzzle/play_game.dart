import 'package:flutter/material.dart';
import 'package:math_puzzle_game/math_puzzle/data.dart';
import 'package:math_puzzle_game/math_puzzle/winpage.dart';
import 'package:math_puzzle_game/math_puzzle/main_page.dart';
import 'package:math_puzzle_game/math_puzzle/grid.dart';

void main()
{
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,home: second(),
    ));
}
class second extends StatefulWidget {

  int ?ind;
  bool? status;
  second([this.ind,this.status]);
  // second([this.ind]);   //optional arguments

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  String str="";
  int level_no=0;
  bool temp3=false;
  int t=0;

  @override
  void initState()
  {
        // TODO: implement initState
        super.initState();
        if(widget.ind!=null)
        {
            // level_no=widget.ind!;
            if(widget.status==true)
            {
              level_no=widget.ind!;
            }
            else
            {
              level_no=first.prefs!.getInt("levelNo")?? 0;
            }
        }
        else
        {
            level_no=first.prefs!.getInt("levelNo") ?? 0;     //levelnum
        }
        print("levelNo : $level_no");
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
                        image: AssetImage("myassets/puzzel/gameplaybackground.jpg"))
                ),
                child: Column(children: [
                  Expanded(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                      Expanded(
                        child: InkWell(onTap: () {
                          String temp_status=first.prefs!.getString("level_status$level_no") ?? "";
                          String str = first.prefs!.getString("skip_time") ?? "";
                          if(str=="")
                          {
                            // DateTime a=DateTime.now();
                            // first.prefs!.setString("skip_time", a.toString());
                            // first.prefs!.setString("level_status $level_no","no");
                            // level_no++;
                            // first.prefs!.setInt("levelNo", level_no);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return second();
                            // },));
                            print("GM");
                            DateTime dt=DateTime.now();
                            first.prefs!.setString("skip_time", dt.toString());
                            if(widget.status==true){
                              if(temp_status!="yes"){
                                first.prefs!.setString("level_status$level_no", "no");
                                level_no++;
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second(level_no,true);
                                },));
                              }else {
                                level_no++;
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second(level_no,true);
                                },));
                              }
                            }else {
                              first.prefs!.setString("level_status$level_no", "no");
                              level_no++;
                              first.prefs!.setInt("level_no", level_no);
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return second();
                              },));
                            }
                            setState(() { });
                          }
                          else
                          {
                            //       DateTime current_time=DateTime.now();
                            //       DateTime skip_time=DateTime.parse(str);
                            //       Duration c=current_time.difference(skip_time);
                            //       print("current time : ${current_time}");
                            //       print("skip time : ${skip_time}");
                            //       print("difference time : ${c}");
                            //       int sec=c.inSeconds;
                            //       if(sec>=10)
                            //       {
                            //         first.prefs!.setString("level_status $level_no","no");
                            //         level_no++;
                            //         first.prefs!.setInt("levelNo", level_no);
                            //         first.prefs!.setString("skip_time", current_time.toString());
                            //         Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //           return  second();
                            //         },));
                            //       }
                            //       else
                            //       {
                            //         showDialog(context: context, builder: (context)
                            //         {
                            //           return AlertDialog(alignment: Alignment.center,
                            //             title: Text("Skip",style: TextStyle(fontSize: 20,color: Colors.indigo),),
                            //             content: Text("you can skip this level in 10 second",style: TextStyle(fontSize: 20,color: Colors.black),),
                            //             actions: [
                            //               InkWell(onTap: () {
                            //                 Navigator.pop(context);
                            //               },
                            //                 child: Container(
                            //                   height: 30,alignment: Alignment.center,
                            //                   width: 80,margin: EdgeInsets.all(5),
                            //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.indigoAccent),
                            //                   child: Text("OK",style: TextStyle(fontSize: 15,color: Colors.red)),
                            //                 ),
                            //               ),
                            //               // ),
                            //             ],);
                            //         },);
                            //         setState(() { });
                            //       }
                            DateTime t2=DateTime.parse(str);
                            DateTime dt=DateTime.now();
                            var diff = dt.difference(t2).inSeconds;
                            print("Test:$diff");
                            if(diff<=10){
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  title: Text("you can skip this level in 10 second",style: TextStyle(fontSize: 20,color: Colors.black),),
                                  actions: [
                                    InkWell(onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 30,alignment: Alignment.center,
                                        width: 80,margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.indigoAccent),
                                        child: Text("OK",style: TextStyle(fontSize: 15,color: Colors.red)),
                                      ),
                                    ),
                                  ],);
                              },);
                            }else
                            {
                              first.prefs!.setString("skip_time", dt.toString());
                              if(widget.status==true){
                                if(temp_status!="yes"){
                                  first.prefs!.setString("level_status $level_no", "no");
                                  level_no++;
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return second(level_no,true);
                                  },));
                                }else
                                {
                                  level_no++;
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return second(level_no,true);
                                  },));
                                }
                              }else
                              {
                                first.prefs!.setString("level_status $level_no", "no");
                                level_no++;
                                first.prefs!.setInt("levelNo", level_no);
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second();
                                },));
                              }
                            }
                          }

                          setState(() { });
                        },
                          child: Container(
                            // width: 60,
                            // height: 60,
                            width: double.infinity,
                            height: double.infinity,
                            margin: EdgeInsets.only(top: 20,left: 20),
                            decoration: BoxDecoration(
                              // color: Colors.deepOrange,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("myassets/puzzel/skip.png"))
                            ),
                          ),
                        ),
                      ),
                      Expanded(flex: 3,
                        child: Container(
                          // width: 300,
                          // height: 60,
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            // color: Colors.deepPurpleAccent,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("myassets/puzzel/level_board.png")),
                          ),
                          child: Text("puzzle ${level_no+1}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white,fontFamily: "six")),
                        ),
                      ),
                      Expanded(
                        child: InkWell(onTap: () {
                          String str = first.prefs!.getString("hint_time") ?? "";
                          if(str=="")
                          {
                            DateTime a=DateTime.now();
                            first.prefs!.setString("hint_time", a.toString());
                            // first.prefs!.setString("level_status $level_no","no");
                            // level_no++;
                            // first.prefs!.setInt("levelNo", level_no);
                            showDialog(barrierColor: Colors.transparent,context: context, builder: (context)
                            {
                              return AlertDialog(alignment: Alignment.center,
                                title: Text("Hint",style: TextStyle(fontSize: 20,color: Colors.indigo),),
                                content: Text("${config.hint[level_no]}",style: TextStyle(fontSize: 20,color: Colors.black),),
                                actions: [
                                  InkWell(onTap: () {
                                    Navigator.pop(context);
                                  },
                                    child: Container(
                                      height: 30,alignment: Alignment.center,
                                      width: 80,margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white),
                                      child: Text("OK",style: TextStyle(fontSize: 15,color: Colors.red)),
                                    ),
                                  ),
                                  // ),
                                ],);
                            },);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return second();
                            // },));

                            setState(() { });
                          }
                          else
                          {
                            DateTime current_time=DateTime.now();
                            DateTime skip_time=DateTime.parse(str);
                            Duration c=current_time.difference(skip_time);
                            print("current time : ${current_time}");
                            print("hint time : ${skip_time}");
                            print("difference time : ${c}");
                            int sec=c.inSeconds;
                            if(sec>=20)
                            {
                              // first.prefs!.setString("level_status $level_no","no");
                              // level_no++;
                              // first.prefs!.setInt("levelNo", level_no);
                              showDialog(barrierColor: Colors.transparent,context: context, builder: (context)
                              {
                                return AlertDialog(alignment: Alignment.center,
                                  title: Text("Hint",style: TextStyle(fontSize: 20,color: Colors.indigo),),
                                  content: Text("${config.hint[level_no]}",style: TextStyle(fontSize: 20,color: Colors.black),),
                                  actions: [
                                    InkWell(onTap: () {
                                      Navigator.pop(context);
                                    },
                                      child: Container(
                                        height: 30,alignment: Alignment.center,
                                        width: 80,margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white70),
                                        child: Text("OK",style: TextStyle(fontSize: 15,color: Colors.red)),
                                      ),
                                    ),
                                    // ),
                                  ],);
                              },);
                              first.prefs!.setString("hint_time", current_time.toString());
                            }
                            else
                            {
                              showDialog(barrierDismissible: false,barrierColor: Colors.transparent,context: context, builder: (context)
                              {
                                return AlertDialog(alignment: Alignment.center,
                                  title: Text("Hint",style: TextStyle(fontSize: 20,color: Colors.indigo),),
                                  content: Text("Next hint will be available in 20 second",style: TextStyle(fontSize: 20,color: Colors.black),),
                                  actions: [
                                    InkWell(onTap: () {
                                      Navigator.pop(context);
                                    },
                                      child: Container(
                                        height: 30,alignment: Alignment.center,
                                        width: 80,margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white),
                                        child: Text("OK",style: TextStyle(fontSize: 15,color: Colors.red)),
                                      ),
                                    ),
                                    // ),
                                  ],);
                              },);
                              setState(() { });
                            }
                          }
                          setState(() { });
                        },
                          child: Container(
                            // width: 60,
                            // height: 60,
                            width: double.infinity,
                            height: double.infinity,
                            margin: EdgeInsets.only(top: 20,right: 20),
                            decoration: BoxDecoration(
                              // color: Colors.deepOrange,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("myassets/puzzel/hint.png"))
                            ),
                          ),
                        ),
                      ),
                    ],),
                  ),
                  // Expanded(child: Text("")),
                  Expanded(flex: 4,
                    child: Row(children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                          // width: 400,
                          // height: 400,
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            // color: Colors.amberAccent,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("${config.puzzle_no[level_no]}")),
                            // ${data.puzzle_no[index]}
                          ),
                        ),
                      ),
                    ],),
                  ),
                  Expanded(child: Text("")),
                  Expanded(child: Text("")),
                  Expanded(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.black,
                            child: Column(children: [
                              Expanded(
                                child: Row(children: [
                                  Expanded(flex: 4,
                                    child: Container(
                                      // margin: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(top:10,right: 10,left: 5),
                                      // width: 100,
                                      // height: 30,
                                      alignment: Alignment.centerLeft,
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text("${str}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,)),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str.substring(0,str.length-1);
                                      setState(() { });
                                    },
                                      child: Container(
                                        // margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        margin: EdgeInsets.only(top:10,right: 10),
                                        // width: 40,
                                        // height: 40,
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          // color: Colors.blueAccent,
                                          borderRadius: BorderRadius.circular(5),
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage("myassets/puzzel/delete.png")),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(flex: 1,
                                    child: GestureDetector(
                                      onTapUp: (details)
                                      {
                                        print("hello");
                                        temp3=false;
                                        setState(() { });
                                      },
                                      onTapCancel: ()
                                      {
                                        print("hi..");
                                        temp3=false;
                                        setState(() { });
                                      },
                                      onTapDown: (details)
                                      {
                                        print("how are you");
                                        temp3=true;
                                        setState(() { });
                                      },
                                      child: InkWell(onTap: ()
                                      {
                                        // var str = this.str;
                                        if(config.puzzle_ans[level_no]==str)
                                        {
                                                first.prefs!.setString("level_status $level_no", "yes");
                                                // level_no++;
                                                // print("level_no=$level_no");
                                                // t = first.prefs!.getInt("levelNum") ?? 0;
                                                if(widget.ind!=null)
                                                {
                                                  // first.prefs!.setInt("levelNum", level_no);
                                                  level_no++;
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                    return four(widget.ind!,true);
                                                  },));
                                                }
                                                else
                                                {
                                                  level_no++;
                                                  first.prefs!.setInt("levelNo", level_no);
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                    return four(level_no);
                                                  },));
                                                }
                                                str="";
                                                setState(() { });
                                        }
                                        else
                                        {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text("WRONG !!!"),
                                                backgroundColor: Colors.red,
                                                behavior: SnackBarBehavior.floating,
                                                duration: Duration(seconds: 5),
                                              ));
                                          str="";
                                        }
                                        setState(() { });
                                      },
                                        child: Container(
                                          // height: 40,
                                          // width: 80,
                                          width: double.infinity,
                                          height: double.infinity,
                                          alignment: Alignment.center,
                                          // margin: EdgeInsets.fromLTRB(5, 10, 20, 10),
                                          margin: EdgeInsets.only(top:10,right: 5),
                                          decoration: BoxDecoration(
                                            // color: Colors.pinkAccent,
                                            border: (temp3==true) ? Border.all(color: Colors.white,width: 5):null,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Text("SUBMIT",style: TextStyle(color: Colors.white)),),
                                      ),
                                    ),
                                  ),
                                ],),
                              ),
                              Expanded(
                                child: Row(children: [
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str+"1";
                                      setState(() { });
                                    },
                                      child: Container(
                                        // height: 40,
                                        // width: 40,
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text("1",style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str+"2";
                                      setState(() { });
                                    },
                                      child: Container(
                                        // height: 40,
                                        // width: 40,
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text("2",style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str+"3";
                                      setState(() { });
                                    },
                                      child: Container(
                                        // height: 40,
                                        // width: 40,
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text("3",style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str+"4";
                                      setState(() { });
                                    },
                                      child: Container(
                                        // height: 40,
                                        // width: 40,
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text("4",style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str+"5";
                                      setState(() { });
                                    },
                                      child: Container(
                                        // height: 40,
                                        // width: 40,
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text("5",style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str+"6";
                                      setState(() { });
                                    },
                                      child: Container(
                                        // height: 40,
                                        // width: 40,
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text("6",style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str+"7";
                                      setState(() { });
                                    },
                                      child: Container(
                                        // height: 40,
                                        // width: 40,
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text("7",style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str+"8";
                                      setState(() { });
                                    },
                                      child: Container(
                                        // height: 40,
                                        // width: 40,
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text("8",style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str+"9";
                                      setState(() { });
                                    },
                                      child: Container(
                                        // height: 40,
                                        // width: 40,

                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border: Border.all(color: Colors.white),
                                          borderRadius:BorderRadius.circular(5),
                                        ),
                                        child: Text("9",style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: ()
                                    {
                                      str=str+"0";
                                      setState(() { });
                                    },
                                      child: Container(
                                        // height: 40,
                                        // width: 40,
                                        width: double.infinity,
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text("0",style: TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                ],),
                              )
                            ],)
                        ),
                      ),
                    ],),
                  ),
                ]),
              ),
            ),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return first();
                                },));
                              }, child: Text("Yes",style: TextStyle(color: Colors.red),)),
                              TextButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return second();
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
