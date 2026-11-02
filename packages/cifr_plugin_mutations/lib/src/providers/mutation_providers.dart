import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cifr_coding_core/cifr_coding_core.dart';

final mutationIdsProvider =
    FutureProvider.autoDispose<List<String>>((ref) async {
  final service = ref.read(backendServiceProvider);
  return await service.listMutations();
});
