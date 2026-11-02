import 'package:flutter_test/flutter_test.dart';
import 'package:cifr_plugin_terminal/cifr_plugin_terminal.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';

void main() {
  test('TerminalPlugin can be instantiated and metadata verified', () {
    final plugin = TerminalPlugin();
    expect(plugin.metadata.id, equals('cifr.terminal'));
  });
}
