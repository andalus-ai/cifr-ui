import 'package:cifr/core/license/edition.dart';
import 'package:cifr/main.dart' as platform;
import 'package:cifr_coding_pack/cifr_coding_pack.dart';

void main() async {
  await platform.runCifrApp(
    edition: CifrEdition.community,
    additionalPlugins: [CodingAgentPluginPack()],
  );
}
