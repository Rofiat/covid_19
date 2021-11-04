import 'package:covid_19/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../info_screen.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  const MyHeader({Key key, this.image, this.textTop, this.textBottom}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:MyClipper(),
      child: Container(
        padding:EdgeInsets.only(left:40,top:50,right:20),
        height:270,
        width:double.infinity,
        //color:Colors.transparent,
        decoration:BoxDecoration(
          gradient:LinearGradient(
            begin:Alignment.topRight,
            end:Alignment.bottomLeft,
            colors:[
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),


          image:DecorationImage(
              fit:BoxFit.fill,
              image:AssetImage("assets/images/virus.png")),
        ),

        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:<Widget> [
            Align(
              alignment:Alignment.topRight,
              //child: SvgPicture.asset("assets/icons/menu.svg")
              child:GestureDetector(
                onTap:() {
                  Navigator.push(
                      context,MaterialPageRoute
                    (builder: (context)
                  {return InfoScreen();
                  },
                  ),
                  );
                },
                child: Icon(
                  Icons.menu_sharp,
                  color:Colors.white,
                ),
              ),
            ),
            // SizedBox(height:20),
            Expanded(
              child:Stack(
                children: [
                  SvgPicture.asset(
                    image,
                    width:200,
                    fit:BoxFit.fitHeight,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top:60,
                    left:70,
                    child:Text(
                      "$textTop\n$textBottom",
                      style:kHeadingTextStyle.copyWith(color:Colors.white),
                    ),
                  ),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(0,size.height-80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height-80);
    path.lineTo(size.width,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // throw UnimplementedError();
    return true;
  }

}


