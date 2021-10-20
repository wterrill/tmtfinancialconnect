import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmtfinancialconnect/post_page.dart';

class HttpApi {
  HttpApi();
  Future<http.Response> postData(String title) {
    print('-------%%%%%%%%%%%%');
    print('sending this json:');
    String jsonBody = jsonEncode(finalStructure?.toJson());

    print(jsonBody);
    print('-------%%%%%%%%%%%%');
    return http.post(
        Uri.parse('https://mxoapptesting.azurewebsites.net/api/qbo/PostData'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody

        // jsonEncode(<String, String>{
        //   'title': title,
        // }),
        );
  }
}
