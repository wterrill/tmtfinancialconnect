import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmtfinancialconnect/post_page.dart';

class HttpApi {
  HttpApi();
  Future<http.Response> postData(String title) {
    print('-------%%%%%%%%%%%%');
    print('sending this json:');
    String jsonBody = jsonEncode(finalStructure?.toJson());
    // String jsonBody = jsonEncode({
    //   "realmId": 9130351527639376,
    //   "Sales": [
    //     {
    //       "Id": 3,
    //       "RealmId": 0,
    //       "ItemId": 5,
    //       "ItemText": "Sales",
    //       "ItemVal": 125650,
    //       "Mapping": 1
    //     }
    //   ],
    //   "Costs": [
    //     {
    //       "Id": 6,
    //       "RealmId": 0,
    //       "ItemId": 93,
    //       "ItemText": "Cost of labor - COGS",
    //       "ItemVal": 13000,
    //       "Mapping": 2
    //     },
    //     {
    //       "Id": 7,
    //       "RealmId": 0,
    //       "ItemId": 96,
    //       "ItemText": "Supplies & materials - COGS",
    //       "ItemVal": 30005,
    //       "Mapping": 3
    //     }
    //   ],
    //   "Expenses": [
    //     {
    //       "Id": 0,
    //       "RealmId": 0,
    //       "ItemId": 18,
    //       "ItemText": "Business licenses",
    //       "ItemVal": 3500,
    //       "Mapping": 4
    //     },
    //     {
    //       "Id": 7,
    //       "RealmId": 0,
    //       "ItemId": 32,
    //       "ItemText": "Entertainment",
    //       "ItemVal": 10742,
    //       "Mapping": 5
    //     },
    //     {
    //       "Id": 0,
    //       "RealmId": 0,
    //       "ItemId": 115,
    //       "ItemText": "Travel meals",
    //       "ItemVal": 33333.33,
    //       "Mapping": 4
    //     },
    //     {
    //       "Id": 9,
    //       "RealmId": 0,
    //       "ItemId": 122,
    //       "ItemText": "Salaries & wages",
    //       "ItemVal": 20333,
    //       "Mapping": 3
    //     }
    //   ]
    // });

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
