import 'package:flutter/material.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';
import 'widgets/agent_run_panel.dart';

class AgentRunPlugin implements CifrPlugin {
  static const pluginId = 'cifr.agent_run';
  static const viewId = 'cifr.agent_run.panel';

  @override
  PluginMetadata get metadata => const PluginMetadata(
        id: pluginId,
        name: 'Cifr Agent Execution Monitor',
        version: '1.0.0',
        description:
            'Real-time timeline, step details, and execution control for agent runs',
      );

  @override
  Future<void> activate(PluginContext context) async {
    context.ui.views.register(
      ViewContribution(
        id: viewId,
        ownerId: pluginId,
        title: 'Agent Run',
        icon: Icons.play_circle_outline,
        preferredPlacement: ViewPlacement.bottomPanel,
        behavior: ViewBehavior.panel,
        builder: (_) => const AgentRunPanel(),
      ),
    );

    context.commands.register(
      AppCommand(
        id: 'cifr.agent_run.open',
        title: 'Agent Run: Show Active Execution Panel',
        category: 'Agent',
        icon: Icons.play_circle_outline,
        action: (cmdCtx) {},
      ),
    );
  }

  @override
  Future<void> deactivate(PluginContext context) async {}
}
