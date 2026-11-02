import 'package:flutter/material.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';
import 'widgets/sidebar_project_section.dart';

class ProjectPlugin implements CifrPlugin {
  static const pluginId = 'cifr.project';
  static const viewId = 'cifr.project.sidebar';

  @override
  PluginMetadata get metadata => const PluginMetadata(
        id: pluginId,
        name: 'Cifr Project & Session Manager',
        version: '1.0.0',
        description:
            'Multi-project workspace management, session tracking, and settings',
      );

  @override
  Future<void> activate(PluginContext context) async {
    context.ui.views.register(
      ViewContribution(
        id: viewId,
        ownerId: pluginId,
        title: 'Projects',
        icon: Icons.source_outlined,
        preferredPlacement: ViewPlacement.sidebar,
        behavior: ViewBehavior.panel,
        builder: (_) => const SidebarProjectSection(),
      ),
    );

    context.commands.register(
      AppCommand(
        id: 'cifr.project.switch',
        title: 'Project: Switch Workspace or Session',
        category: 'Project',
        icon: Icons.switch_account_outlined,
        action: (cmdCtx) {},
      ),
    );

    context.commands.register(
      AppCommand(
        id: 'cifr.project.newSession',
        title: 'Project: Create New Session',
        category: 'Project',
        icon: Icons.add_circle_outline,
        action: (cmdCtx) {},
      ),
    );
  }

  @override
  Future<void> deactivate(PluginContext context) async {}
}
