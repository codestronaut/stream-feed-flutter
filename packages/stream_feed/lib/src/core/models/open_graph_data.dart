import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'open_graph_data.g.dart';

/// Open graph data from a website.
@JsonSerializable(createToJson: true)
class OpenGraphData extends Equatable {
  /// [OpenGraphData] constructor
  const OpenGraphData({
    this.title,
    this.type,
    this.url,
    this.site,
    this.siteName,
    this.description,
    this.determiner,
    this.locale,
    this.images,
    this.videos,
    this.audios,
  });

  /// Create a new instance from a json
  factory OpenGraphData.fromJson(Map<String, dynamic> json) =>
      _$OpenGraphDataFromJson(json);

  ///	Value of the title OG field.
  final String? title;

  /// Value of the type OG field.
  final String? type;

  /// URL to scrape.
  final String? url;

  /// Value of the site OG field
  final String? site;

  /// Value of the site_name OG field.
  final String? siteName;

  ///	Value of the description OG field.
  final String? description;

  ///	Value of the determiner OG field.
  final String? determiner;

  /// Value of the locale OG field.
  final String? locale;

  ///	List of og images
  final List<Image>? images;

  ///	List of og videos
  final List<Video>? videos;

  ///	List of og audios
  final List<Audio>? audios;

  @override
  List<Object?> get props => [
        title,
        type,
        url,
        site,
        siteName,
        description,
        determiner,
        locale,
        images,
        videos,
        audios,
      ];

  /// Serialize to json
  Map<String, dynamic> toJson() => _$OpenGraphDataToJson(this);
}

/// OG Image object
@JsonSerializable(createToJson: true)
class Image extends Equatable {
  /// [Image] constructor
  const Image({
    this.image,
    this.url,
    this.secureUrl,
    this.width,
    this.height,
    this.type,
    this.alt,
  });

  /// Create a new instance from a json
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  /// Value of the image OG field.
  final String? image;

  ///	Value of the url OG field.
  final String? url;

  /// Value of the secure_url OG field.
  final String? secureUrl;

  /// Value of the width OG field.
  final String? width;

  ///	Value of the height OG field.
  final String? height;

  /// Value of the type OG field.
  final String? type;

  /// Value of the alt OG field.
  final String? alt;

  @override
  List<Object?> get props => [
        image,
        url,
        secureUrl,
        width,
        height,
        type,
        alt,
      ];

  /// Serialize to json
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

/// OG Video object
@JsonSerializable(createToJson: true)
class Video extends Equatable {
  /// [Video] constructor
  const Video({
    this.image,
    this.url,
    this.secureUrl,
    this.width,
    this.height,
    this.type,
    this.alt,
  });

  /// Create a new instance from a json
  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  /// Value of the image OG field.
  final String? image;

  /// Value of the url OG field.
  final String? url;

  ///	Value of the secure_url OG field.
  final String? secureUrl;

  /// Value of the width OG field.
  final String? width;

  /// Value of the height OG field.
  final String? height;

  /// Value of the type OG field.
  final String? type;

  /// Value of the alt OG field.
  final String? alt;

  @override
  List<Object?> get props => [
        image,
        url,
        secureUrl,
        width,
        height,
        type,
        alt,
      ];

  /// Serialize to json
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

/// OG Audio object
@JsonSerializable(createToJson: true)
class Audio extends Equatable {
  /// [Audio] constructor
  const Audio({
    this.audio,
    this.url,
    this.secureUrl,
    this.type,
  });

  /// Create a new instance from a json
  factory Audio.fromJson(Map<String, dynamic> json) => _$AudioFromJson(json);

  /// Serialize to json the [Audio] object
  Map<String, dynamic> toJson() => _$AudioToJson(this);

  /// Value of the audio OG field.
  final String? audio;

  /// Value of the url OG field.
  final String? url;

  /// Value of the secureUrl OG field.
  final String? secureUrl;

  /// Value of the type OG field.
  final String? type;

  @override
  List<Object?> get props => [
        audio,
        url,
        secureUrl,
        type,
      ];
}
