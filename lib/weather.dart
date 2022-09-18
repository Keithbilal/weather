import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Weather(),
);
class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var temp;
  var description;
  var currently;
  var humitity;
  var windspeed;
  Future getWeather () async {
    http.Response response = await http.get(Uri.parse
      ("https://api.openweathermap.org/data/2.5/weather?q=Nairobi&units=metric&appid=843cca92c012a34cc540f7268b52066e"));
    var results= jsonDecode(response.body);
    setState(() {
      this.temp=results['main']['temp'];
      this.description=results['weather'][0]['description'];
      this.currently=results['weather'][0]['main'];
      this.humitity=results['main']['humidity'];
      this.windspeed=results['wind']['speed'];
    });
  }
  @override
  void initState(){
    super.initState();
    this.getWeather();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:
        RefreshIndicator(
          onRefresh:getWeather,
          child: SafeArea(
            child:Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 120.0,vertical: 10.0),
                        child:Text(
                          "Currently in Nairobi",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 130.0,vertical: 0.0),
                      child: Text(
                        temp != null ? temp.toString() +"\u00B0" :"loading...",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0.0,bottom: 100.0),
                      child:Text(
                        currently != null ? currently.toString():"loading...",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: ListView(
                          children: [
                            ListTile(
                              leading: FaIcon(FontAwesomeIcons.thermometer),
                              title: Text('Temparature'),
                              trailing: Text(temp != null ? temp.toString() +"\u00B0" :"loading..."),
                            ),
                            ListTile(
                              leading: FaIcon(FontAwesomeIcons.cloud),
                              title: Text('Weather'),
                              trailing: Text(description != null ? description.toString():"loading..."),
                            ),
                            ListTile(
                              leading: FaIcon(FontAwesomeIcons.sun),
                              title: Text('Humidity'),
                              trailing: Text(humitity != null ? humitity.toString():"loading..."),
                            ) ,
                            ListTile(
                              leading: FaIcon(FontAwesomeIcons.wind),
                              title: Text('Wind Speed'),
                              trailing: Text(windspeed != null ? windspeed.toString():"loading..."),
                            ),
                          ],
                        )
                    )
                ),
              ],
            ),
          ),
        )
    );


  }
}
