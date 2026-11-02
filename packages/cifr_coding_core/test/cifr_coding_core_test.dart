import 'package:flutter_test/flutter_test.dart';
import 'package:cifr_coding_core/cifr_coding_core.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('cifr_coding_core models can be instantiated', () {
    final entry = ChatEntry(
      id: 'test_entry',
      type: ChatEntryType.userPrompt,
      status: ChatEntryStatus.completed,
      text: 'Hello Cifr',
      timestamp: DateTime.now(),
    );

    expect(entry.id, equals('test_entry'));
    expect(entry.text, equals('Hello Cifr'));

    final project = Project(
      id: 'proj_1',
      name: 'Andalus Platform',
      rootPath: '/workspace',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    expect(project.id, equals('proj_1'));
    expect(project.name, equals('Andalus Platform'));
  });
}
