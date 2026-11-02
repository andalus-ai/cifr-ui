import 'package:flutter_test/flutter_test.dart';
import 'package:cifr_plugin_mutations/cifr_plugin_mutations.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';

void main() {
  test('MutationsPlugin can be instantiated and metadata verified', () {
    final plugin = MutationsPlugin();
    expect(plugin.metadata.id, equals('cifr.mutations'));
  });
}
