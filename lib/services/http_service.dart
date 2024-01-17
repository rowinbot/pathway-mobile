import 'package:http/http.dart' as http;
import 'package:pathway_mobile/constants/api.dart';

class HTTPService {
  final _baseUrl = apiBaseUrl;

  const HTTPService();

  Future<http.Response> get(
    String path, {
    Map<String, String>? headers,
  }) async {
    return await http.get(
      Uri.parse('$_baseUrl$path'),
      headers: headers,
    );
  }

  Future<http.Response> post(
    String path, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    return await http.post(
      Uri.parse('$_baseUrl$path'),
      body: body,
      headers: headers,
    );
  }

  Future<http.Response> put(
    String path, {
    dynamic body,
    Map<String, String>? headers,
  }) async {
    return await http.put(
      Uri.parse('$_baseUrl$path'),
      body: body,
      headers: headers,
    );
  }

  Future<http.Response> delete(
    String path, {
    Map<String, String>? headers,
  }) async {
    return await http.delete(
      Uri.parse('$_baseUrl$path'),
      headers: headers,
    );
  }
}
