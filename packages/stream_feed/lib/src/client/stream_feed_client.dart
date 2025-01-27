import 'package:stream_feed/src/client/aggregated_feed.dart';
import 'package:stream_feed/src/client/flat_feed.dart';
import 'package:stream_feed/src/client/notification_feed.dart';
import 'package:stream_feed/src/client/batch_operations_client.dart';
import 'package:stream_feed/src/client/collections_client.dart';
import 'package:stream_feed/src/client/file_storage_client.dart';
import 'package:stream_feed/src/client/image_storage_client.dart';
import 'package:stream_feed/src/client/personalization_client.dart';
import 'package:stream_feed/src/core/http/stream_http_client.dart';
import 'package:stream_feed/src/core/http/token.dart';
import 'package:stream_feed/src/core/index.dart';

import 'package:stream_feed/src/client/reactions_client.dart';
import 'package:stream_feed/src/client/user_client.dart';
import 'package:stream_feed/src/client/stream_feed_client_impl.dart';

/// Different sides on which you can run this [StreamFeedClient] on
enum Runner {
  /// Marks the [StreamFeedClient] that it is currently running on server-side
  server,

  /// Marks the [StreamFeedClient] that it is currently running on client-side
  client,
}

/// The client class that manages API calls and authentication
/// To instantiate the client you need an API key and secret.
/// You can find the key and secret on the dashboard.
abstract class StreamFeedClient {
  /// If you want to use the API client directly on your web/mobile app
  /// you need to generate a user token server-side and pass it.
  ///
  ///
  /// - Instantiate a new client (server side) with [StreamFeedClient.connect]
  /// using your api [secret] parameter and [apiKey]
  /// ```dart
  /// var client = connect('YOUR_API_KEY',secret: 'API_KEY_SECRET');
  /// ```
  /// - Create a token for user with id "the-user-id"
  /// ```dart
  /// var userToken = client.frontendToken('the-user-id');
  /// ```
  /// - if you are using the SDK client side, get a userToken in your dashboard
  /// and pass it to [StreamFeedClient.connect] using the [token] parameter
  /// and [apiKey]
  /// ```dart
  /// var client = connect('YOUR_API_KEY',token: Token('userToken'));
  /// ```
  factory StreamFeedClient.connect(
    String apiKey, {
    Token? token,
    String? secret,
    String? appId,
    StreamHttpClientOptions? options,
    Runner runner = Runner.client,
  }) =>
      StreamFeedClientImpl(
        apiKey,
        userToken: token,
        secret: secret,
        appId: appId,
        options: options,
        runner: runner,
      );

  /// Convenient getter for [BatchOperationsClient]
  BatchOperationsClient get batch;

  /// Convenient getter for [CollectionsClient]:
  ///
  /// {@macro collections}
  CollectionsClient get collections;

  /// Convenient getter for [ReactionsClient]:
  ///
  /// {@macro reactions}
  ReactionsClient get reactions;

  /// Convenient getter for [UsersClient]:
  ///
  /// {@macro user}
  UserClient user(String userId);

  /// Convenient getter for [PersonalizationClient]:
  ///
  /// {@macro personalization}
  PersonalizationClient get personalization;

  /// Convenient getter for [FileStorageClient]:
  ///
  /// {@macro filesandimages}
  ///
  /// {@macro files}
  FileStorageClient get files;

  /// Convenient getter for [ImageStorageClient]:
  ///
  /// {@macro filesandimages}
  ImageStorageClient get images;

  /// Convenient getter for [FlatFeed]:
  ///
  /// {@macro flatFeed}
  FlatFeed flatFeed(String slug, [String? userId]);

  /// Convenient getter for [AggregatedFeed]:
  ///
  /// {@macro aggregatedFeed}
  AggregatedFeed aggregatedFeed(String slug, [String? userId]);

  /// Convenient getter for [NotificationFeed]:
  ///
  /// {@macro aggregatedFeed}
  NotificationFeed notificationFeed(String slug, [String? userId]);

  /// Generate a JWT tokens that include the [userId] as payload
  /// and that are signed using your Stream API Secret.
  ///
  /// Optionally you can have tokens expire after a certain amount of time.
  ///
  /// By default all SDK libraries generate user tokens
  /// without an expiration time.
  Token frontendToken(
    String userId, {
    DateTime? expiresAt,
  });

  ///This endpoint allows you to retrieve open graph information from a URL
  ///which you can then use to add images and a description to activities.
  ///
  ///For example:
  ///```dart
  /// final urlPreview = await client.og(
  ///   'http://www.imdb.com/title/tt0117500/',
  /// );
  /// ```
  Future<OpenGraphData> og(String targetUrl);

  ///
  UserClient? get currentUser;

  ///
  Future<User> setUser(Map<String, Object> data);
}
