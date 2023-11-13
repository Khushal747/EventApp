
class SearchEventModel {
  final List<SearchedEvent> data;
  final Meta meta;

  SearchEventModel({required this.data, required this.meta});

  factory SearchEventModel.fromJson(Map<String, dynamic> json) {
    return SearchEventModel(
      data: (json['data'] as List).map((event) => SearchedEvent.fromJson(event)).toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class SearchedEvent {
  final int id;
  final String title;
  final String description;
  final String bannerImage;
  final String dateTime;
  final String organiserName;
  final String organiserIcon;
  final String venueName;
  final String venueCity;
  final String venueCountry;

  SearchedEvent({
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

  factory SearchedEvent.fromJson(Map<String, dynamic> json) {
    return SearchedEvent(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      bannerImage: json['banner_image'],
      dateTime: json['date_time'],
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
    return Meta(total: json['total']);
  }
}
