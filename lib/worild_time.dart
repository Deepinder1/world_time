import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; // the time in that location
  String flag; // url to asset flag icon
  String url; // location url for api end point

  //constructo
  WorldTime({this.location, this.flag, this.url});

  //asynchronous programming
  Future<void> getTime() async {
    //simulate network request for username
    // String username = await Future.delayed(Duration(seconds: 3), () {
    //   return 'yoyo';
    // });

    //if one request depends on other we could use async await
    // String bio = await Future.delayed(Duration(seconds: 3), () {
    //   return 'vegan';
    // });

    // print('$username - $bio');

    // Response response =
    //     await get('https://jsonplaceholder.typicode.com/todos/1');
    // Map data = jsonDecode(response.body);
    // print(data['title']);

    try {
      //make a time request
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties of data from the map

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(datetime);
      // print(offset); //preview your code as early as possible

      //create a datetime obj

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('err $e');
      time = 'Could not get time data';
    }
  }
}
