import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHeader(
              image:"assets/icons/doctor.svg",
              textTop:"Get to know",
              textBottom:"About Covid_19",
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal:20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Symptoms',
                    style:kTitleTextstyle,
                  ),
                  SizedBox(height:10),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                     SymptomCard(
                       image:"assets/images/headache.jpg",
                       title:'Headache',
                       isActive:true,
                     ),SymptomCard(
                       image:"assets/images/cough.jpg",
                       title:'Cough',
                      ),SymptomCard(
                       image:"assets/images/fever.jpg",
                       title:'Fever',
                      ),
                    ],
                  ),
                  SizedBox(height:10),
                  Text(
                    'Prevention',
                    style:kTitleTextstyle,
                  ),
                  SizedBox(height:10),
                  PreventCard(
                    image:'assets/images/wear_mask.jpg',
                    title:"Wear face mask",
                    text:"Since the start of the outbreak of coronavirus, some places ahve embraced fully wearing facemasks",
                  ),PreventCard(
                    image:'assets/images/wash_hands.jpg',
                    title:"Wear your hands",
                    text:"Since the start of the outbreak of coronavirus, some places ahve embraced fully wearing facemasks",
                  ),
                  SizedBox(height:10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({Key key, this.image, this.title, this.isActive=false}):super(key:key);
   @override
   Widget build(BuildContext context) {
     return  Container(
       padding:EdgeInsets.all(10),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(15),
         color:Colors.white,
         boxShadow:[
           isActive
            ? BoxShadow(
             offset:Offset(0,10),
             blurRadius: 20,
             color:kActiveShadowColor,
           )
           : BoxShadow(
             offset:Offset(0,3),
             blurRadius: 6,
             color:kShadowColor,
           ),

         ],
       ),
       child:Column(
         children: [
           Image.asset(
             image,
             height:80,
             width:80,
             fit: BoxFit.contain,
           ),
           Text(
              title,
             style: TextStyle(
               fontWeight: FontWeight.bold,
             ),
           ),
         ],
       ),
     );
   }
 }

 class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const PreventCard({Key key, this.image, this.title, this.text}) : super(key: key);
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(bottom:10),
       child: SizedBox(
         height:165,
         child:Stack(
           alignment:Alignment.centerLeft,
           children: [
             Container(
               height:136,
               width:double.infinity,
               decoration:BoxDecoration(
                   borderRadius:BorderRadius.circular(20),
                   color:Colors.white,
                   boxShadow:[
                     BoxShadow(
                       offset:Offset(0,8),
                       blurRadius: 24,
                       color:kShadowColor,
                     ),
                   ]
               ),

             ),
             Image.asset(
               image,
               height:130,
               width:125,
               fit:BoxFit.fitHeight,
             ),
             Positioned(
               left:130,
               child:Container(
                 padding:EdgeInsets.symmetric(horizontal:5,vertical:10),
                 height:160,
                 width:MediaQuery.of(context).size.width-170,
                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       title,
                       style:kTitleTextstyle.copyWith(fontSize: 16),
                     ),
                     Text(
                       text.replaceRange(70, text.length, "..."),
                       style:TextStyle(
                         fontSize:12,
                       ),
                     ),
                     Align(
                         alignment:Alignment.topRight,
                         child: Icon(Icons.keyboard_arrow_right)),
                   ],
                 ),
               ),
             ),
           ],
         ),
       ),
     );
   }
 }

