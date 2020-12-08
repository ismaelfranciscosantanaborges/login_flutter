import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login_flutter/add_experience.dart';
import 'package:login_flutter/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> experiences;

  @override
  void initState() {
    super.initState();
    experiences = [];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'HISTORY'),
              Tab(text: 'MAP'),
              Tab(text: 'PROFILE'),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddExperience(),
                  ),
                ).then(
                  (value) {
                    if (value != null) {
                      experiences.add(value);
                      setState(() {});
                    }
                  },
                );
              },
              child: Text(
                'ADD',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              child: (experiences?.length ?? 0) > 0
                  ? ListView(
                      children: [
                        for (String experience in experiences)
                          ListTile(
                            title: Text(
                              experience,
                              style: kStyleTitle3,
                            ),
                          )
                      ],
                    )
                  : Center(
                      child: Text('List Empty'),
                    ),
            ),
            // Container(
            //   child: FlutterMap(
            //     options: new MapOptions(
            //       center: new LatLng(51.5, -0.09),
            //       zoom: 13.0,
            //     ),
            //     layers: [
            //       new TileLayerOptions(
            //         urlTemplate:
            //             "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            //         subdomains: ['a', 'b', 'c'],
            //       ),
            //     ],
            //   ),
            // ),
            Map(),
            Container(
              child: Center(child: Text('profile')),
            ),
          ],
        ),
      ),
    );
  }
}

class Map extends StatefulWidget {
  const Map({
    Key key,
  }) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  CameraPosition _initialPosition =
      CameraPosition(target: LatLng(26.2806, 30.8025));
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: _initialPosition,
      onMapCreated: _onMapCreated,
      // child: RaisedButton(
      //   onPressed: () => showLocationPicker(
      //     context,
      //     "AIzaSyAIZqCaI4b2JUGrcwall2RTAaNs_xu62dk",
      //     initialCenter: const LatLng(31.1975844, 29.9598339),
      //     myLocationButtonEnabled: true,
      //     layersButtonEnabled: true,
      //     countries: ['AE', 'NG'],

      //   ),
      // ),
    );
  }
}
