import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turist_app/src/aplication/app.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Size screenSize;

  int _markersIds = 0;

  Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = Set();


  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {


    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: FutureBuilder(
        future: _getPosition(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: snapshot.data,
                    myLocationEnabled: true,
                    zoomGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    myLocationButtonEnabled: false,
                    onTap: (position){
                      //_addMarker(position);
                      print(position);
                    },
                    onLongPress: (position){
                      //_addMarker(position);
                      print(position);
                    },
                    markers: _markers,
                  ),
                )
              ],
            );
          }

          return Container();
        },
      ),
    );
  }

  _addMarker(LatLng position){
    setState(() {

    });
    _markers.add(Marker(
      markerId: MarkerId(_markersIds.toString()),
      position: position
    ));
    _markersIds++;
  }

  _getPosition() async{
    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    CameraPosition cameraPosition = new CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14.5);
    return cameraPosition;
  }
}