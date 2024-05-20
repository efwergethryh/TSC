import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  late String baseUrl;

  ApiClient({required this.baseUrl});

  Future<dynamic> getRequest(BuildContext context, String endpoint,
      Map<String, String> headers) async {
    try {
      var url = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON

        return json.decode(response.body);
      } else {
        // If the server returns an error response, throw an exception
        _showErrorDialog(context, 'Failed to load data');
      }
    } catch (e) {
      // Catch any exceptions thrown during the request
      _showErrorDialog(context, 'Failed to connect to the server: $e');
    }
  }

  Future<dynamic> postRequest({
    required BuildContext context,
    required String endpoint,
    required Map<String, String> headers,
    required Map<String, dynamic> body,
  }) async {
    try {
      var url = Uri.parse('$baseUrl$endpoint');
      final response =
          await http.post(url, headers: headers, body: json.encode(body));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        return json.decode(response.body);
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Catch any exceptions thrown during the request
      _showErrorDialog(context, 'Failed to connect to the server: $e');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
