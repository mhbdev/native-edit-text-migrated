import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_edit_text_migrated_platform_interface.dart';

/// An implementation of [NativeEditTextMigratedPlatform] that uses method channels.
class MethodChannelNativeEditTextMigrated extends NativeEditTextMigratedPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_edit_text_migrated');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
