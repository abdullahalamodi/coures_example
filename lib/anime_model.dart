class AnimeModel {
  List<Data>? data;

  AnimeModel({
    this.data,
  });

  AnimeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

class Data {
  final String url;
  final Images images;
  final String title;
  final double score;
  final int rank;
  final String synopsis;
  final int year;
  Data({
    required this.url,
    required this.images,
    required this.title,
    required this.score,
    required this.rank,
    required this.synopsis,
    required this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'images': images.toJson(),
      'title': title,
      'score': score,
      'rank': rank,
      'synopsis': synopsis,
      'year': year,
    };
  }

  factory Data.fromJson(Map<String, dynamic> map) {
    return Data(
      url: map['url'] ?? '',
      images: Images.fromJson(map['images']),
      title: map['title'] ?? '',
      score: map['score']?.toDouble() ?? 0.0,
      rank: map['rank']?.toInt() ?? 0,
      synopsis: map['synopsis'] ?? '',
      year: map['year'] ?? 0,
    );
  }
}

class Images {
  Jpg? jpg;

  Images({this.jpg});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jpg != null) {
      data['jpg'] = jpg!.toJson();
    }

    return data;
  }
}

class Jpg {
  String? imageUrl;
  String? smallImageUrl;
  String? largeImageUrl;

  Jpg({this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
    largeImageUrl = json['large_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    data['small_image_url'] = smallImageUrl;
    data['large_image_url'] = largeImageUrl;
    return data;
  }
}
