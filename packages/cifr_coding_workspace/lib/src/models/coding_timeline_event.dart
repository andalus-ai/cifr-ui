enum CodingTimelineEventKind {
  phaseStarted,
  decisionMade,
  toolInvoked,
  toolResult,
  verificationPassed,
  verificationFailed,
  thoughtToken,
  outputToken,
  error;
}

/// A structured event emitted during a Cifr coding-agent execution.
class CodingTimelineEvent {
  final String id;
  final String executionId;
  final String phase;
  final CodingTimelineEventKind kind;
  final String title;
  final String details;
  final Map<String, Object?> payload;
  final DateTime timestamp;

  CodingTimelineEvent({
    required this.id,
    required this.executionId,
    required this.phase,
    required this.kind,
    required this.title,
    this.details = '',
    this.payload = const {},
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, Object?> toJson() => {
        'id': id,
        'executionId': executionId,
        'phase': phase,
        'kind': kind.name,
        'title': title,
        'details': details,
        'payload': payload,
        'timestamp': timestamp.toIso8601String(),
      };

  factory CodingTimelineEvent.fromJson(Map<String, dynamic> json) {
    final rawPayload = json['payload'];
    return CodingTimelineEvent(
      id: json['id'] as String? ?? '',
      executionId: json['executionId'] as String? ?? '',
      phase: json['phase'] as String? ?? 'GENERAL',
      kind: CodingTimelineEventKind.values.firstWhere(
        (value) => value.name == json['kind'],
        orElse: () => CodingTimelineEventKind.error,
      ),
      title: json['title'] as String? ?? '',
      details: json['details'] as String? ?? '',
      payload: rawPayload is Map
          ? rawPayload.map((key, value) => MapEntry(key.toString(), value))
          : const {},
      timestamp: DateTime.tryParse(json['timestamp'] as String? ?? ''),
    );
  }
}
