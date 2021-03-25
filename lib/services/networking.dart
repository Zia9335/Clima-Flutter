import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
var url;
      NetworkHelper(this.url);

  Future<dynamic> getdata() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String Data = response.body;
         var data=jsonDecode(Data);
      return data;
    }
    else print(response.statusCode);
  }
}


