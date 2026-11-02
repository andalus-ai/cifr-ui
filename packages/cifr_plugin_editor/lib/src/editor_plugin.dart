import 'package:flutter/material.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';
import 'widgets/editor_panel_shell.dart';

class EditorPlugin implements CifrPlugin {
  static const pluginId = 'cifr.editor';
  static const viewId = 'cifr.editor.main';

  @override
  PluginMetadata get metadata => const PluginMetadata(
        id: pluginId,
        name: 'Cifr Multi-Tab Code Editor',
        version: '1.0.0',
        description:
            'Syntax highlighted code editing with language diagnostics and mutation previews',
      );

  @override
  Future<void> activate(PluginContext context) async {
    context.ui.views.register(
      ViewContribution(
        id: viewId,
        ownerId: pluginId,
        title: 'Editor',
        icon: Icons.code,
        preferredPlacement: ViewPlacement.main,
        behavior: ViewBehavior.editor,
        builder: (_) => const EditorPanelShell(),
      ),
    );

    context.commands.register(
      AppCommand(
        id: 'cifr.editor.open',
        title: 'Editor: Focus Code Editor',
        category: 'Editor',
        icon: Icons.code,
        action: (cmdCtx) {},
      ),
    );

    // Editor Context Menu items (Copy, Format)
    context.ui.menus.register(
      MenuContribution(
        id: 'cifr.editor.copy',
        ownerId: pluginId,
        targetId: MenuTargets.editor,
        label: 'Copy',
        icon: Icons.copy_outlined,
        group: 'clipboard',
        order: 100,
        action: (ctx) {},
      ),
    );

    context.ui.menus.register(
      MenuContribution(
        id: 'cifr.editor.format',
        ownerId: pluginId,
        targetId: MenuTargets.editor,
        label: 'Format Document',
        icon: Icons.format_align_left_rounded,
        group: 'edit',
        order: 200,
        action: (ctx) {},
      ),
    );
  }

  @override
  Future<void> deactivate(PluginContext context) async {}
}
