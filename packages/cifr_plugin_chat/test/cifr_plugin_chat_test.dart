import 'package:flutter_test/flutter_test.dart';
import 'package:cifr_plugin_chat/cifr_plugin_chat.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';

void main() {
  test(
      'ChatPlugin, ComposerPlugin, CheckpointPlugin can be instantiated and metadata verified',
      () {
    final chat = ChatPlugin();
    expect(chat.metadata.id, equals('cifr.chat'));

    final composer = ComposerPlugin();
    expect(composer.metadata.id, equals('cifr.composer'));

    final checkpoint = CheckpointPlugin();
    expect(checkpoint.metadata.id, equals('cifr.checkpoint'));
  });
}
