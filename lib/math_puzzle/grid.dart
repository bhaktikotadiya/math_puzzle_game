import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_puzzle_game/math_puzzle/grid2.dart';
import 'package:math_puzzle_game/math_puzzle/main_page.dart';
import 'package:math_puzzle_game/math_puzzle/play_game.dart';


void main()
{
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    ));
}
class third extends StatefulWidget {
  List ?l;
  third ([this.l]);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  List a=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"];
  int levelNo=0;

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
                  // Expanded(
                  //   child: Row(children: [
                  //     Expanded(child: Text("")),
                  //   ],),
                  // ),
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
                                  if(index<levelNo || widget.l?[index]=="yes")
                                  {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return second(index,true);
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
                                      border: (index<levelNo)?Border.all(color: Colors.black54):null,
                                      // color: Colors.pinkAccent,
                                      image: (index < levelNo) ? (widget.l?[index]=="yes") ?
                                          DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage("myassets/puzzel/tick.png")) : null :
                                           DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage("myassets/puzzel/lock.png")),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: (index < levelNo) ? Text("${index+1}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "two"),) :null,
                                  ),
                                );
                              },),
                        ),
                      )
                    ],),
                  ),
                  Expanded(child: Text("")),
                  Expanded(
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                      Expanded(flex: 4,child: Text("")),
                      Expanded(
                        child: InkWell(onTap: ()
                        {
                            Navigator.push(context, MaterialPageRoute(builder: (context)
                            {
                                return fifth(widget.l);
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
