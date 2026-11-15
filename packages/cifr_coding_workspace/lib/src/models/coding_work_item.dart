enum CodingWorkType {
  feature,
  bug,
  refactor,
  review,
  research;

  String get label => switch (this) {
        CodingWorkType.feature => 'Feature',
        CodingWorkType.bug => 'Bug Fix',
        CodingWorkType.refactor => 'Refactor',
        CodingWorkType.review => 'Code Review',
        CodingWorkType.research => 'Research',
      };
}

enum CodingWorkStatus {
  todo,
  inProgress,
  verified,
  completed,
  failed;

  bool get isTerminal =>
      this == CodingWorkStatus.completed || this == CodingWorkStatus.failed;
}

/// A unit of coding-agent work associated with a repository workspace.
class CodingWorkItem {
  final String id;
  final String workspaceId;
  final CodingWorkType type;
  final String title;
  final String description;
  final CodingWorkStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;

  CodingWorkItem({
    required this.id,
    required this.workspaceId,
    required this.type,
    required this.title,
    required this.description,
    this.status = CodingWorkStatus.todo,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  CodingWorkItem copyWith({
    String? id,
    String? workspaceId,
    CodingWorkType? type,
    String? title,
    String? description,
    CodingWorkStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CodingWorkItem(
      id: id ?? this.id,
      workspaceId: workspaceId ?? this.workspaceId,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, Object?> toJson() => {
        'id': id,
        'workspaceId': workspaceId,
        'type': type.name,
        'title': title,
        'description': description,
        'status': status.name,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory CodingWorkItem.fromJson(Map<String, dynamic> json) {
    return CodingWorkItem(
      id: json['id'] as String? ?? '',
      workspaceId: json['workspaceId'] as String? ?? '',
      type: CodingWorkType.values.firstWhere(
        (value) => value.name == json['type'],
        orElse: () => CodingWorkType.feature,
      ),
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      status: CodingWorkStatus.values.firstWhere(
        (value) => value.name == json['status'],
        orElse: () => CodingWorkStatus.todo,
      ),
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? ''),
    );
  }
}
