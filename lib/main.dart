import 'package:covid_19/info_screen.dart';
import 'package:covid_19/widgets/counter.dart';
import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          body1: TextStyle(color:kBodyTextColor)
        ),

      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
              children:<Widget>[
              MyHeader(
                image:"assets/icons/Coronadr.svg",
                textTop:"All you need",
                textBottom:"is to stay at home",
              ),
              Container(
                margin:EdgeInsets.symmetric(horizontal:10,vertical:0),
                padding:EdgeInsets.symmetric(vertical:10,horizontal:20),
                height:50,
                width:double.infinity,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border:Border.all(
                    color:Color(0xFFE5E5E5),
                  )
                ),
                child:Row(
                children: [
                  // SvgPicture.asset("assets/icons/maps.svg"),
                  Icon(Icons.location_pin),
                  SizedBox(width:10),
                  Expanded(
                    child:DropdownButton(
                        isExpanded:true,
                        value:'Indonesia',
                        underline:SizedBox(),
                        icon:Icon(Icons.arrow_drop_down_circle_outlined),
                        items:['Indonesia', 'Bangladesh','Unites States','Japan']
                        .map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                        value:value,
                        child:Text(value),
                        );
                        }).toList(),onChanged:(value){}),


                    ),

                ],
                ),

              ),
              SizedBox(height:20),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:20),
                child:Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text:TextSpan(
                            children:[
                              TextSpan(
                              text:"Case Update\n",
                                style:TextStyle(
                                  color:kTitleTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ), TextSpan(
                              text:"Newest update March 28",
                                style:TextStyle(
                                  color:kTextLightColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Text(
                          "See Details",
                          style:TextStyle(
                            color:kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height:10),
              Container(
                margin:EdgeInsets.symmetric(horizontal:20),
                padding:EdgeInsets.all(10),
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(20),
                  color:Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset:Offset(0,4),
                      blurRadius:30,
                      color:kShadowColor,
                    ),
                  ],
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Counter(
                       color:kInfectedColor,
                       title:"Infected",
                       number:1046
                    ),Counter(
                       color:kDeathColor,
                       title:"Death",
                       number:87
                    ),Counter(
                       color:kRecoverColor,
                       title:"Recovered",
                       number:46
    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:20),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Spread of Virus",
                      style:TextStyle(
                        color:kTitleTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ), Text(
                      "See Details",
                      style:TextStyle(
                        color:kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],

                ),
              ),
              Container(
                margin:EdgeInsets.symmetric(vertical:10,horizontal:20),
                padding:EdgeInsets.all(20),
                width:double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(20),
                  color:Colors.white,
                  boxShadow:[
                    BoxShadow(
                    offset:Offset(0,10),
                      blurRadius:30,
                      color:kShadowColor,
                  ),
                  ],
                ),
                child:Image.asset("assets/images/map.jpg", fit:BoxFit.fill),
              ),
            ]
          ),
      ),
      //),
    );
  }
}

