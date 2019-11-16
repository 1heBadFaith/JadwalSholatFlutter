import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jadwal_sholat_flutter/model/ResponJadwal.dart';
import 'package:http/http.dart' as http;
import 'package:jadwal_sholat_flutter/text_style.dart';

class HeaderText extends StatelessWidget {
  ResponJadwal responJadwal;
  HeaderText(this.responJadwal);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 20.0,
        bottom: 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              responJadwal.city, style: styleCityHeader,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 20.0,
                ),
                Text(responJadwal.address, style: TextStyle(color: Colors.white, fontSize: 10.0),)
              ],
            )
          ],
        ));
  }
}
