import 'package:first/weather.dart';
import 'package:flutter/material.dart';

 Future <void> main() async => runApp(Background(),
);

class Background extends StatefulWidget {

  @override
  State<Background> createState() => _BackgroundState();
}
class _BackgroundState extends State<Background> {
  String morning='https://www.willseye.org/wp-content/uploads/2017/08/sun-clouds-blue-sky-14641020076aM.jpg';
  String evening='https://upload.wikimedia.org/wikipedia/commons/3/30/Beautiful_evening_sky.jpg';
  String night='https://addons-media.operacdn.com/media/CACHE/images/themes/05/144705/1.0-rev1/images/0993404e-79e0-4052-923d-89236e7c102f/e4f4077f6d1f715a07786ff7692a8d1d.jpg';
  late String image;

  String imageGet(){
    var hour=DateTime.now().hour;
    if(hour <12) {
      image = morning;
    } else if (hour <18){
      image = evening;
    }else {
      image = night;
    }
    return image;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: Container(
       width:MediaQuery.of(context).size.width,
       height:MediaQuery.of(context).size.height,
       decoration:BoxDecoration(
         image: DecorationImage(
           image: NetworkImage(
               imageGet()
           ),
           fit:BoxFit.cover,

         ),
       ),
       child:Weather() ,

    ),
    );
  }
}

