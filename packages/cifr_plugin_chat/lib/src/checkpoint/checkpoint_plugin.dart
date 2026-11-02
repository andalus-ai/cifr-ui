import 'package:flutter/material.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';

class CheckpointPlugin implements CifrPlugin {
  static const pluginId = 'cifr.checkpoint';

  @override
  PluginMetadata get metadata => const PluginMetadata(
        id: pluginId,
        name: 'Cifr Workspace Checkpoints',
        version: '1.0.0',
        description: 'Session snapshots and checkpoint rollback management',
      );

  @override
  Future<void> activate(PluginContext context) async {
    context.commands.register(
      AppCommand(
        id: 'cifr.checkpoint.create',
        title: 'Checkpoint: Create Session Snapshot',
        category: 'Checkpoint',
        icon: Icons.bookmark_add_outlined,
        action: (cmdCtx) {},
      ),
    );

    context.commands.register(
      AppCommand(
        id: 'cifr.checkpoint.restore',
        title: 'Checkpoint: Restore Snapshot',
        category: 'Checkpoint',
        icon: Icons.restore,
        action: (cmdCtx) {},
      ),
    );
  }

  @override
  Future<void> deactivate(PluginContext context) async {}
}
