
class EventResponse {
  final Content content;
  final bool status;

  EventResponse({
    required this.content,
    required this.status,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) {
    return EventResponse(
      content: Content.fromJson(json['content']),
      status: json['status'],
    );
  }

}

class Content {
  final List<Event> data;
  final Meta meta;

  Content({
    required this.data,
    required this.meta,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List<dynamic>; // Explicit cast to dynamic
    List<Event> events = dataList.map((item) => Event.fromJson(item)).toList();

    return Content(
      data: events,
      meta: Meta.fromJson(json['meta']),
    );
  }

}

class Event {
  final int id;
  final String title;
  final String description;
  final String bannerImage;
  final DateTime dateTime;
  final String organiserName;
  final String organiserIcon;
  final String venueName;
  final String venueCity;
  final String venueCountry;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerImage,
    required this.dateTime,
    required this.organiserName,
    required this.organiserIcon,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      bannerImage: json['banner_image'],
      dateTime: DateTime.parse(json['date_time']),
      organiserName: json['organiser_name'],
      organiserIcon: json['organiser_icon'],
      venueName: json['venue_name'],
      venueCity: json['venue_city'],
      venueCountry: json['venue_country'],
    );
  }
}

class Meta {
  final int total;

  Meta({required this.total});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'],
    );
  }
}
