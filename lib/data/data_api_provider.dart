import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:vehicle_manufacturers/utils/constants.dart';

class DataApiProvider {
  final RetryClient _client = RetryClient(http.Client());

  Future<Map<String, dynamic>> getDataFromNetwork(String url) async {
    try {
      final Response response = await _client.get(Uri.parse(url));
      final Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } catch (e) {
      throw Exception(failedRequest);
    } finally {
      _client.close();
    }
  }
}
