import 'package:flutter/material.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';
import 'widgets/smart_composer.dart';

class ComposerPlugin implements CifrPlugin {
  static const pluginId = 'cifr.composer';
  static const viewId = 'cifr.composer.panel';

  @override
  PluginMetadata get metadata => const PluginMetadata(
        id: pluginId,
        name: 'Cifr Smart Composer',
        version: '1.0.0',
        description:
            'Context-aware agent composer with @mention and file referencing',
      );

  @override
  Future<void> activate(PluginContext context) async {
    context.commands.register(
      AppCommand(
        id: 'cifr.composer.focus',
        title: 'Composer: Focus Prompt Input',
        category: 'Composer',
        icon: Icons.edit_note,
        action: (cmdCtx) {},
      ),
    );

    context.ui.views.register(
      ViewContribution(
        id: viewId,
        ownerId: pluginId,
        title: 'Composer',
        icon: Icons.edit_note,
        preferredPlacement: ViewPlacement.bottomPanel,
        behavior: ViewBehavior.panel,
        builder: (_) => const SmartComposer(),
      ),
    );
  }

  @override
  Future<void> deactivate(PluginContext context) async {}
}
