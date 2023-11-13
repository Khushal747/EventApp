import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/event_detail_model.dart';
import '../widgets/disposable_provider.dart';

class EventDetailService extends DisposableProvider {
  // final String baseUrl;

  // EventDetailService({});

  Future<EventDetail> getEventDetail(int eventId,String baseUrl) async {
    final response = await http.get(Uri.parse('$baseUrl/v1/event/$eventId'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      notifyListeners();

      return EventDetail.fromJson(data['content']['data']);
    } else {
      notifyListeners();

      throw Exception('Failed to load event details');
    }
  }

  @override
  void disposeValues() {
    // TODO: implement disposeValues
  }
}
