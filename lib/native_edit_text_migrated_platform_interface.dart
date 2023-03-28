import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_edit_text_migrated_method_channel.dart';

abstract class NativeEditTextMigratedPlatform extends PlatformInterface {
  /// Constructs a NativeEditTextMigratedPlatform.
  NativeEditTextMigratedPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeEditTextMigratedPlatform _instance = MethodChannelNativeEditTextMigrated();

  /// The default instance of [NativeEditTextMigratedPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeEditTextMigrated].
  static NativeEditTextMigratedPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeEditTextMigratedPlatform] when
  /// they register themselves.
  static set instance(NativeEditTextMigratedPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
