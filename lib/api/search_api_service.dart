
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/search_event_model.dart';
import '../widgets/disposable_provider.dart';

class SearchEventService extends DisposableProvider {

  Future<SearchEventModel> searchEvents(String query,String baseUrl) async {
    final response = await http.get(Uri.parse('$baseUrl/v1/event?search=$query'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      notifyListeners();

      return SearchEventModel.fromJson(data['content']);
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
