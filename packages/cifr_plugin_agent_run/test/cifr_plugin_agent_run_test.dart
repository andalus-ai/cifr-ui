import 'package:flutter_test/flutter_test.dart';
import 'package:cifr_plugin_agent_run/cifr_plugin_agent_run.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';

void main() {
  test('AgentRunPlugin can be instantiated and metadata verified', () {
    final plugin = AgentRunPlugin();
    expect(plugin.metadata.id, equals('cifr.agent_run'));
  });
}
