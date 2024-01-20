import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List co = [
    [73.080646321, 29.01638908],
    [73.085775375, 29.016109667],
    [73.085736819, 29.013121103],
    [73.080674149, 29.013036368],
    [73.080646321, 29.01638908]
  ];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: LatLng(73.0, 29.0),
                zoom: 10,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                PolygonLayer(
                  polygonCulling: false,
                  polygons: [
                    Polygon(
                        points: [
                          LatLng(co[0][0], co[0][1]),
                          LatLng(co[1][0], co[1][1]),
                          LatLng(co[2][0], co[2][1]),
                          LatLng(co[3][0], co[3][1]),
                        ],
                        color: Colors.red.withOpacity(0.5),
                        borderStrokeWidth: 2,
                        borderColor: Colors.black,
                        isFilled: true),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
