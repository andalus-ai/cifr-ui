import 'package:flutter_test/flutter_test.dart';
import 'package:cifr_plugin_project/cifr_plugin_project.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';

void main() {
  test('ProjectPlugin can be instantiated and metadata verified', () {
    final plugin = ProjectPlugin();
    expect(plugin.metadata.id, equals('cifr.project'));
  });
}
