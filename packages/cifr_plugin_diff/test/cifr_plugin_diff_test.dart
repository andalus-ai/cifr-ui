import 'package:flutter_test/flutter_test.dart';
import 'package:cifr_plugin_diff/cifr_plugin_diff.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';

void main() {
  test('DiffPlugin can be instantiated and metadata verified', () {
    final plugin = DiffPlugin();
    expect(plugin.metadata.id, equals('cifr.diff'));
  });
}
