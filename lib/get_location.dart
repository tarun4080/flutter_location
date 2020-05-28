import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';


class GetLocationWidget extends StatefulWidget {
  const GetLocationWidget({Key key}) : super(key: key);

  @override
  _GetLocationState createState() => _GetLocationState();
}


class _GetLocationState extends State<GetLocationWidget> {
  final Location location = Location();
  var locationAddressPrint;


  LocationData _location;
  String _error;

  Future<void> _getLocation() async {
    setState(() {
      _error = null;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        _location = _locationResult;
        locationAddress();
      });
    } on PlatformException catch (err) {
      setState(() {
        _error = err.code;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Location: ' + (_error ?? '${_location ?? "unknown"}'),
          style: Theme.of(context).textTheme.body2,
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              child: const Text('Get'),
              onPressed: _getLocation,
            ),

          ],
        ),
        locationAddressPrint == null?Text("No address found"):Text(locationAddressPrint)
      ],
    );
  }

  void locationAddress() async{
    final coordinates = new Coordinates(_location.latitude,_location.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var  first = addresses.first;
    setState(() {
      locationAddressPrint = first.addressLine;
    });
    print("${first.featureName} : ${first.addressLine}");
  }

}