import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class HomeModel {
  static Future getDoctorsInfo() async {
    String username = 'FlutterDev@LuminousKey.com';
    String password = 'Flutter2023';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);
    return await http.get(
      Uri.parse("https://flutter.linked4med.com/api/Doctors/GetDoctorsInfo"),
      headers: <String, String>{'authorization': basicAuth},
    );
  }

  static Future lunchEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=Mimits Feedback&body=This email from yazan', 
    );

    var url = params.toString();
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future lunchPhone(String phone) async {
    await launchUrl(Uri.parse("tel://$phone"));
  }

  static Future lunchMap(double lat, double long) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
  
}
