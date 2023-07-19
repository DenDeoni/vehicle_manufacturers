import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

 createMockImageHttpClient() {
  final client = MockClient((request) async {
    return http.Response.bytes([], 200);
  });
  return client;
}
