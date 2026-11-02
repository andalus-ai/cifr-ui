import 'package:flutter_test/flutter_test.dart';
import 'package:cifr_coding_pack/cifr_coding_pack.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';

void main() {
  test(
      'CodingAgentPluginPack can be instantiated and bundles all coding plugins',
      () {
    final pack = CodingAgentPluginPack();
    expect(pack.metadata.id, equals('cifr.coding_agent_pack'));
    expect(pack.subPlugins.length, equals(9));

    final ids = pack.subPlugins.map((p) => p.metadata.id).toSet();
    expect(
        ids,
        containsAll([
          'cifr.chat',
          'cifr.editor',
          'cifr.diff',
          'cifr.mutations',
          'cifr.agent_run',
          'cifr.checkpoint',
          'cifr.composer',
          'cifr.terminal',
          'cifr.project',
        ]));
  });
}
