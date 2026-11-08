import 'package:cifr_coding_workspace/cifr_coding_workspace.dart';
import 'package:test/test.dart';

void main() {
  group('CodingWorkspaceInfo', () {
    test('copyWith preserves unspecified fields', () {
      const workspace = CodingWorkspaceInfo(
        id: 'ws-1',
        name: 'Repository',
        path: '/workspace/repository',
      );
      final updated = workspace.copyWith(branch: 'feature/auth');

      expect(updated.name, 'Repository');
      expect(updated.branch, 'feature/auth');
    });
  });

  group('WorkspaceFileNode', () {
    test('derives file extension', () {
      const file = WorkspaceFileNode(name: 'main.DART', path: 'lib/main.DART');
      expect(file.extension, 'dart');
      expect(file.isDirectory, isFalse);
    });
  });

  group('CodingWorkItem', () {
    test('round trips JSON and identifies terminal status', () {
      final item = CodingWorkItem(
        id: 'work-1',
        workspaceId: 'ws-1',
        type: CodingWorkType.feature,
        title: 'Implement authentication',
        description: 'Add token validation',
        status: CodingWorkStatus.completed,
        createdAt: DateTime.utc(2026, 1, 1),
        updatedAt: DateTime.utc(2026, 1, 2),
      );

      final restored = CodingWorkItem.fromJson(item.toJson());
      expect(restored.type, CodingWorkType.feature);
      expect(restored.status.isTerminal, isTrue);
      expect(restored.updatedAt, item.updatedAt);
    });
  });

  group('CodingTimelineEvent', () {
    test('round trips structured event data', () {
      final event = CodingTimelineEvent(
        id: 'event-1',
        executionId: 'execution-1',
        phase: 'PLANNING',
        kind: CodingTimelineEventKind.decisionMade,
        title: 'Selected implementation approach',
        payload: const {'strategy': 'incremental'},
        timestamp: DateTime.utc(2026, 2, 1),
      );

      final restored = CodingTimelineEvent.fromJson(event.toJson());
      expect(restored.kind, CodingTimelineEventKind.decisionMade);
      expect(restored.payload['strategy'], 'incremental');
      expect(restored.timestamp, event.timestamp);
    });
  });
}
