import 'package:flutter_test/flutter_test.dart';
import 'package:cifr_plugin_editor/cifr_plugin_editor.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';

void main() {
  test('EditorPlugin can be instantiated and metadata verified', () {
    final plugin = EditorPlugin();
    expect(plugin.metadata.id, equals('cifr.editor'));
  });
}
