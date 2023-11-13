
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:khushal_s_application4/model/event_model.dart';

import '../widgets/disposable_provider.dart';

class ApiService extends DisposableProvider{
  // final String baseUrl;

  // /ApiService({});

  Future<List<Event>> getAllEvents(String baseUrl) async {
    final response = await http.get(Uri.parse('$baseUrl/v1/event'));

    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> data = json.decode(response.body);

      // Check if 'data' key is present and is a list
      if (data.containsKey('content') && data['content']['data'] is List) {
        List<dynamic> dataList = data['content']['data'];

        // Map the list to a list of Event objects
        List<Event> events = dataList.map((item) => Event.fromJson(item)).toList();
        notifyListeners();

        return events;
      } else {
        notifyListeners();

        throw Exception('Invalid data format');
      }
    } else {
      notifyListeners();

      throw Exception('Failed to load events');
    }
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }

}
