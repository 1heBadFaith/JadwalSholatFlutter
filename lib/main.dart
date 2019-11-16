import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jadwal_sholat_flutter/header_content.dart';
import 'package:jadwal_sholat_flutter/list_jadwal.dart';
import 'package:jadwal_sholat_flutter/model/ResponJadwal.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyHomeScreen(),
));//HomeScreen

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  //Membuat Request
  Future<ResponJadwal> getJadwal() async {
    //mengambil data dengan url
    final response = await http.get("https://muslimsalat.com/jonggol/2.json?key=b70f80d1abf52ddfbe6af782fc5392cf");
    //menguraikan data/memilah data(decode) dari json response
    final jsonResponse = json.decode(response.body);
    //masukan kedalam class data ResponJadwal
    return ResponJadwal.fromJsonMap(jsonResponse);

  }
  @override
  void initState() {
    super.initState();
    getJadwal();
  }


  @override
  Widget build(BuildContext context) {
    final header = Stack(
      children: <Widget>[
        Container(
          color: Colors.grey,
          height: MediaQuery.of(context).size.width - 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0)
                  ,bottomLeft: Radius.circular(20.0)),

              boxShadow: [
                BoxShadow(
                    blurRadius: 6.0,
                    offset: Offset(0.0, 2.0),
                    color: Colors.black26
                )
              ],
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://hdwallpaperim.com/wp-content/uploads/2017/08/22/82830-anime-sky-skyline-power_lines-sunlight-sun_rays-cityscape-birds-utility_pole.jpg"))
          ),
        ),//Container
        Padding(
          padding:
          const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 40.0
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.location_on)
                  , onPressed: (){}),

              IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.map)
                  , onPressed: (){}),
            ],
          ),
        ),//Padding
        FutureBuilder(
          future: getJadwal(),
          builder: (context, snapshot){
            if (snapshot.hasData){
              return HeaderText(snapshot.data);
            }else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return Positioned.fill(
                child: Align(alignment: Alignment.centerRight
                    ,child: CircularProgressIndicator()));
          },)
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          header,
          Expanded(
            child: FutureBuilder(
              future: getJadwal(),
              builder: (context, snapshot){
                if (snapshot.hasData){
                  return ListJadwal(snapshot.data);
                }else if(snapshot.hasError){
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }


Widget containerWaktu(String waktu, String jam) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0, vertical: 20.0
      ),
      child: Container(
        padding: EdgeInsets.all(15.0),
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              waktu,
              style: TextStyle(color: Colors.black26, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              jam,
              style: TextStyle(color: Colors.black26, fontSize: 10.0),
            )
          ],
        ),
      ),
    );
  }
}






