import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:login_flutter/add_experience.dart';
import 'package:login_flutter/constants.dart';
import 'package:latlong/latlong.dart';

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
            Container(
              child: FlutterMap(
                options: new MapOptions(
                  center: new LatLng(51.5, -0.09),
                  zoom: 13.0,
                ),
                layers: [
                  new TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                ],
              ),
            ),
            Container(
              child: Center(child: Text('profile')),
            ),
          ],
        ),
      ),
    );
  }
}
