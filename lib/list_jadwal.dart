import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jadwal_sholat_flutter/model/ResponJadwal.dart';
import 'package:http/http.dart' as http;
import 'package:jadwal_sholat_flutter/text_style.dart';

class ListJadwal extends StatelessWidget {
  ResponJadwal data;
  ListJadwal(this.data);

  Widget containerWaktu(String waktu, String jam) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0, vertical: 20.0
      ),
      child: Container(
        color: Colors.black12,
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
              style: styleListText,
            ),
            Text(
              jam,
              style: styleListText,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        containerWaktu("Subuh", data.items[0].fajr.toUpperCase()),
        containerWaktu("Dzuhur", data.items[0].dhuhr.toUpperCase()),
        containerWaktu("Ashar", data.items[0].asr.toUpperCase()),
        containerWaktu("Maghrib", data.items[0].maghrib.toUpperCase()),
        containerWaktu("Isya", data.items[0].isha.toUpperCase()),
      ],
    );
  }
}
