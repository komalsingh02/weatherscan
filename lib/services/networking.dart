import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return convert.jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
























// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class NetworkHelper {
//   NetworkHelper(this.url);
//   final String url;
//   Future getData() async {
//     try {
//       http.Response response = await http.get(
//         Uri.parse(url),
//       );
//       if (response.statusCode == 200) {
//         String data = response.body;
//         return data;
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }
































// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class NetworkHelper {
//   NetworkHelper(this.url);
//   final String url;
//   Future getData() async {
//     try {
//       http.Response response = await http.get(
//         Uri.parse(url),
//       );
//       if (response.statusCode == 200) {
//         String data = response.body;
//         return data;
//         //print(data); // Prints response.body
//         //var decodeData = jsonDecode(data);
//         // setState(() {
//         //   locationMessage = data;
//         // });
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }
