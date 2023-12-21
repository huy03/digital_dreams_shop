import 'dart:convert';

import 'package:digital_dreams_shop/core/common/models/city.dart';
import 'package:http/http.dart' as http;

String convertAddressName(String name) {
  final addressList = name.split("_");
  final newAddressList = [];
  for (final item in addressList) {
    newAddressList
        .add('${item[0].toUpperCase()}${item.substring(1).toLowerCase()}');
  }

  return newAddressList.join(" ");
}

Future<List<City>> getCities() async {
  List<City> cities = [];
  final url = Uri.parse('https://provinces.open-api.vn/api/?depth=2');
  final response = await http.get(url);

  // print(response.body);
  final List<dynamic> data = jsonDecode(response.body);

  for (final item in data) {
    cities.add(
      City(
        name: convertAddressName(item['codename']),
        code: item['code'],
        districts: item['districts']
            .map<String>(
              (district) => convertAddressName(district['codename']),
            )
            .toList(),
      ),
    );
  }

  return cities;
}
