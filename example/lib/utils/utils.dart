import 'package:flutter/widgets.dart';
import 'package:stream_feed/stream_feed.dart';

class ClientProvider extends InheritedWidget {
  const ClientProvider({
    Key? key,
    required this.client,
    required Widget child,
  }) : super(key: key, child: child);

  final StreamFeedClient client;

  static ClientProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ClientProvider>();
  }

  @override
  bool updateShouldNotify(ClientProvider old) {
    return old.child != child || old.client != client;
  }
}

extension ProviderX on BuildContext {
  StreamFeedClient get client => ClientProvider.of(this)!.client;
}
