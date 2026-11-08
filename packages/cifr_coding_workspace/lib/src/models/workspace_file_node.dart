/// A node in the Cifr coding repository's file tree.
class WorkspaceFileNode {
  final String name;
  final String path;
  final bool isDirectory;
  final int size;
  final DateTime? modifiedAt;
  final List<WorkspaceFileNode> children;

  const WorkspaceFileNode({
    required this.name,
    required this.path,
    this.isDirectory = false,
    this.size = 0,
    this.modifiedAt,
    this.children = const [],
  });

  String get extension =>
      name.contains('.') ? name.split('.').last.toLowerCase() : '';
}
