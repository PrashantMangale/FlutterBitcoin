import 'dart:convert';

import 'package:flutter_bitcoin_assignment_prashant/network/ApiUrls.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static getDecodedResponse(var response) {
    return jsonDecode(response);
  }

  static getHeaders() {
    return {
      "X-CMC_PRO_API_KEY": "62151188-0dcc-4eaa-8b0f-44459e53c67b",
      "Accept": "application/json",
    };
  }

  static Future<http.Response> callGetTopCryptoCurrencyAPI(
      String sortValue) async {
    String url = sortValue.isEmpty
        ? ApiUrls.strLatestCryptoCoins
        : '${ApiUrls.strLatestCryptoCoins}&sort=$sortValue';
    print(url);
    return http.get(Uri.parse(url), headers: getHeaders());
  }

  static Future<http.Response> callGetCryptoDataByIdAPI(
      dynamic cryptoId) async {
    String url = "${ApiUrls.strGetCryptoInfo}?id=$cryptoId";
    // print(url);
    return http.get(Uri.parse(url), headers: getHeaders());
  }
}
