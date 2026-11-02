import 'package:flutter/material.dart';
import 'package:cifr_plugin_api/cifr_plugin_api.dart';
import 'package:cifr_plugin_runtime/cifr_plugin_runtime.dart';
import 'package:cifr_plugin_chat/cifr_plugin_chat.dart';
import 'package:cifr_plugin_editor/cifr_plugin_editor.dart';
import 'package:cifr_plugin_diff/cifr_plugin_diff.dart';
import 'package:cifr_plugin_mutations/cifr_plugin_mutations.dart';
import 'package:cifr_plugin_agent_run/cifr_plugin_agent_run.dart';
import 'package:cifr_plugin_terminal/cifr_plugin_terminal.dart';
import 'package:cifr_plugin_project/cifr_plugin_project.dart';
import 'widgets/vibe_coding_workspace_view.dart';

/// Domain Plugin Pack that encapsulates the entire AI Coding Agent suite.
/// Bundles chat, code editor, file explorer, git diffs, integrated terminal,
/// mutations history, and registers the dedicated Vibe Coding workspace mode.
class CodingAgentPluginPack implements CifrPlugin {
  static const pluginId = 'cifr.coding_agent_pack';

  final List<CifrPlugin> subPlugins;
  final WidgetBuilder? vibeSidebarBuilder;

  CodingAgentPluginPack({
    List<CifrPlugin>? plugins,
    this.vibeSidebarBuilder,
  }) : subPlugins = plugins ??
            [
              ChatPlugin(),
              EditorPlugin(),
              DiffPlugin(),
              MutationsPlugin(),
              AgentRunPlugin(),
              CheckpointPlugin(),
              ComposerPlugin(),
              TerminalPlugin(),
              ProjectPlugin(),
            ];

  @override
  PluginMetadata get metadata => const PluginMetadata(
        id: pluginId,
        name: 'Cifr AI Coding Agent Pack',
        version: '1.0.0',
        description:
            'Comprehensive AI coding assistant suite, VS Code style editor, diff review, and agent execution',
      );

  Widget _buildVibeView(BuildContext context) =>
      VibeCodingWorkspaceView(sidebarBuilder: vibeSidebarBuilder);

  @override
  Future<void> activate(PluginContext context) async {
    // 2. Register the specialized Vibe Coding Workspace Mode
    context.ui.modes.register(
      WorkspaceMode(
        id: CoreWorkspaceModes.vibe,
        title: 'Vibe Coding',
        subtitle: 'Agent-First',
        description:
            'AI-first agent-centric flow focused on prompt reasoning, live tool execution, and diff verification.',
        icon: Icons.auto_awesome,
        shortcut: '⌘⌥1',
        category: 'Coding',
        viewBuilder: _buildVibeView,
      ),
    );

    // 3. Register Coding Suite helper commands
    context.commands.register(
      AppCommand(
        id: 'cifr.coding.vibeMode',
        title: 'Coding: Switch to Vibe Coding Mode',
        category: 'Coding Agent',
        icon: Icons.auto_awesome,
        action: (cmdCtx) {},
      ),
    );

    context.commands.register(
      AppCommand(
        id: 'cifr.coding.ideMode',
        title: 'Coding: Switch to IDE Workspace Mode',
        category: 'Coding Agent',
        icon: Icons.space_dashboard_outlined,
        action: (cmdCtx) {},
      ),
    );
  }

  @override
  Future<void> deactivate(PluginContext context) async {}
}
