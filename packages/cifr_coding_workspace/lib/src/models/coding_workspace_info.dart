/// Coding repository workspace metadata owned by Cifr.
class CodingWorkspaceInfo {
  final String id;
  final String name;
  final String path;
  final String branch;
  final bool isGit;

  const CodingWorkspaceInfo({
    required this.id,
    required this.name,
    required this.path,
    this.branch = 'main',
    this.isGit = true,
  });

  CodingWorkspaceInfo copyWith({
    String? id,
    String? name,
    String? path,
    String? branch,
    bool? isGit,
  }) {
    return CodingWorkspaceInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
      branch: branch ?? this.branch,
      isGit: isGit ?? this.isGit,
    );
  }
}
