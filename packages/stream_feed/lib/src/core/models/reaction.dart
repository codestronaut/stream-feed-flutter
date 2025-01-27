import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stream_feed/src/core/util/serializer.dart';

import 'package:stream_feed/src/core/models/feed_id.dart';

part 'reaction.g.dart';

/// Reactions are a special kind of data that
/// can be used to capture user interaction
///  with specific activities. Common examples of reactions are likes, comments,
/// and upvotes.
///  Reactions are automatically returned to feeds' activities at read time
/// when the reactions parameters are used.
@JsonSerializable()
class Reaction extends Equatable {
  /// [Reaction] constructor
  const Reaction({
    this.id,
    this.kind,
    this.activityId,
    this.userId,
    this.parent,
    this.createdAt,
    this.updatedAt,
    this.targetFeeds,
    this.user,
    this.targetFeedsExtraData,
    this.data,
    this.latestChildren,
    this.childrenCounts,
  });

  /// Create a new instance from a json
  factory Reaction.fromJson(Map<String, dynamic> json) =>
      _$ReactionFromJson(json);

  /// Reaction ID
  @JsonKey(includeIfNull: false, toJson: Serializer.readOnly)
  final String? id;

  /// Type of reaction. Must not be empty or longer than 255 characters.
  final String? kind;

  /// Activity ID for the reaction. Must be a valid activity ID.
  final String? activityId;

  ///	user_id of the reaction. Must not be empty or longer than 255 characters.
  final String? userId;

  /// ID of the parent reaction.
  /// If provided, it must be the ID of a reaction that has no parents.
  @JsonKey(includeIfNull: false)
  final String? parent;

  /// When the reaction was created.
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;

  ///	When the reaction was last updated.
  @JsonKey(includeIfNull: false, toJson: Serializer.readOnly)
  final DateTime? updatedAt;

  /// Target feeds for the reaction. List of feed ids (e.g.: timeline:bob)
  @JsonKey(includeIfNull: false, fromJson: FeedId.fromIds, toJson: FeedId.toIds)
  final List<FeedId>? targetFeeds;

  /// User of the reaction
  @JsonKey(includeIfNull: false)
  final Map<String, Object>? user;

  /// Extra Data of the target Feed
  @JsonKey(includeIfNull: false)
  final Map<String, Object>? targetFeedsExtraData;

  /// Extra data of the reaction
  @JsonKey(includeIfNull: false)
  final Map<String, Object>? data;

  /// Children reactions, grouped by reaction type.
  @JsonKey(includeIfNull: false, toJson: Serializer.readOnly)
  final Map<String, List<Reaction>>? latestChildren;

  /// Child reaction count, grouped by reaction kind
  @JsonKey(includeIfNull: false, toJson: Serializer.readOnly)
  final Map<String, int>? childrenCounts;

  /// Known top level fields.
  /// Useful for [Serializer] methods.
  static const topLevelFields = [
    'id',
    'kind',
    'activity_id',
    'user_id',
    'user',
    'data',
    'created_at',
    'updated_at',
    'parent',
    'latest_children',
    'children_counts',
  ];

  ///allows us to copy a Reaction
  ///and pass in arguments that overwrite settable values.
  Reaction copyWith({
    String? id,
    String? kind,
    String? activityId,
    String? userId,
    String? parent,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<FeedId>? targetFeeds,
    Map<String, Object>? user,
    Map<String, Object>? targetFeedsExtraData,
    Map<String, Object>? data,
    Map<String, List<Reaction>>? latestChildren,
    Map<String, int>? childrenCounts,
  }) =>
      Reaction(
        id: id ?? this.id,
        kind: kind ?? this.kind,
        activityId: activityId ?? this.activityId,
        userId: userId ?? this.userId,
        parent: parent ?? this.parent,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        targetFeeds: targetFeeds ?? this.targetFeeds,
        user: user ?? this.user,
        targetFeedsExtraData: targetFeedsExtraData ?? this.targetFeedsExtraData,
        data: data ?? this.data,
        latestChildren: latestChildren ?? this.latestChildren,
        childrenCounts: childrenCounts ?? this.childrenCounts,
      );

  @override
  List<Object?> get props => [
        id,
        kind,
        activityId,
        userId,
        parent,
        createdAt,
        updatedAt,
        targetFeeds,
        user,
        targetFeedsExtraData,
        data,
        latestChildren,
        childrenCounts,
      ];

  /// Serialize to json
  Map<String, dynamic> toJson() => _$ReactionToJson(this);
}
