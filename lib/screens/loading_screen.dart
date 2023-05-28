import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherscan/services/location.dart';
import 'package:weatherscan/services/networking.dart';
import 'package:weatherscan/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '05b7c9ddce491bb51a63594edd4b61e6';
double lat = 0;
double lon = 0;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String locationMessage = 'Current location of the user';
  String latitudeMessage = '';
  String longitudeMessage = '';

  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    lon = location.longitude;
    debugPrint('latitute $lat , $lon');
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    Map<String,dynamic> weatherData = await networkHelper.getData();
    debugPrint(weatherData.toString());
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return  LocationScreen(weatherData: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
      // appBar: AppBar(
      //   title: const Text('Flutter User Location'),
      //   centerTitle: true,
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         locationMessage,
      //         textAlign: TextAlign.center,
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       Text(
      //         latitudeMessage,
      //         style: TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //       Text(
      //         longitudeMessage,
      //         style: TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       ElevatedButton(
      //         onPressed: () async {
      //           await getLocationData();
      //         },
      //         child: const Text('Get Current Location'),
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
       
        


// var temperature = jsonDecode(data)['main']['temp'];
// var condition = jsonDecode(data)['weather'][0]['id'];
// var cityName = jsonDecode(data)['name'];
















// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weatherscan/location.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// const apiKey = '05b7c9ddce491bb51a63594edd4b61e6';
// double lat = 0;
// double lon = 0;

// class LocationScreen extends StatefulWidget {
//   const LocationScreen({Key? key}) : super(key: key);

//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   String locationMessage = 'Current location of the user';
//   String latitudeMessage = '';
//   String longitudeMessage = '';

//   Future<void> getLocation() async {
//     Location location = Location();
//     await location.getCurrentLocation();
//     lat = location.latitude;
//     lon = location.longitude;

//     setState(() {
//       latitudeMessage = 'Latitude: $lat';
//       longitudeMessage = 'Longitude: $lon';
//     });
//   }

//   void getData() async {
//     print(lat);
//     print(lon);
//     try {
//       http.Response response = await http.get(
//         Uri.parse(
//             'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey'),
//       );
//       if (response.statusCode == 200) {
//         String data = response.body;
//         //print(data); // Prints response.body
//         var decodeData = jsonDecode(data);
//         var temperature = jsonDecode(data)['main']['temp'];
//         var condition = jsonDecode(data)['weather'][0]['id'];
//         var cityName = jsonDecode(data)['name'];
//         print(temperature);
//         print(condition);
//         print(cityName);
//         setState(() {
//           locationMessage = data;
//         });
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter User Location'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               locationMessage,
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               latitudeMessage,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               longitudeMessage,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 await getLocation();
//                 getData();
//               },
//               child: const Text('Get Current Location'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





















































































// import 'package:flutter/material.dart';
// import 'package:weatherscan/location_code.dart';
// import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weatherscan/location.dart';
// import 'package:http/http.dart' as http;

// const apiKey = '05b7c9ddce491bb51a63594edd4b61e6';
// double lat = 0;
// double lon = 0;

// class LocationScreen extends StatefulWidget {
//   const LocationScreen({Key? key}) : super(key: key);

//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   String locationMessage = 'Current location of the user';

//   Future<void> getLocation() async {
//     Location location = Location();
//     await location.getCurrentLocation();
//     lat = location.latitude;
//     lon = location.longitude;

//     // print(location.latitude);
//     // print(location.longitude);
//   }

//   void getData() async {
//     print(lat);
//     print(lon);
//     try {
//       http.Response response = await http.get(
//         Uri.parse(
//             'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey'),
//       );
//       if (response.statusCode == 200) {
//         String data = response.body;
//         print(data); // Prints response.body

//         setState(() {
//           locationMessage = data;
//         });
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter User Location'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               locationMessage,
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 getLocation();
//                 getData();
//               },
//               child: const Text('Get Current Location'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



































// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weatherscan/location.dart';
// import 'package:http/http.dart' as http;

// const apiKey = '05b7c9ddce491bb51a63594edd4b61e6';
// double lat = 0;
// double lon = 0;

// class LocationScreen extends StatefulWidget {
//   const LocationScreen({Key? key}) : super(key: key);

//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   String locationMessage = 'Current location of the user';

//   Future<void> getLocation() async {
//     Location location = Location();
//     await location.getCurrentLocation();
//     lat = location.latitude;
//     lon = location.longitude;

//     // print(location.latitude);
//     // print(location.longitude);
//   }

//   void getData() async {
//       print(lat);
//       print(lon);
//     http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?$lat&$lon&appid=$apiKey'
//             as Uri);
//     if (response.statusCode == 200) {
//       String data = response.body;
//       print(data);
//     } else {
//       print(response.statusCode);
//     }
//   }

// //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API}'
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter User Location'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               locationMessage,
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 getLocation();
//                 getData();
//               },
//               child: const Text('Get Current Location'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
