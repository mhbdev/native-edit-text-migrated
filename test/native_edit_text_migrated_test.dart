import 'package:flutter_test/flutter_test.dart';
import 'package:native_edit_text_migrated/native_edit_text_migrated.dart';
import 'package:native_edit_text_migrated/native_edit_text_migrated_platform_interface.dart';
import 'package:native_edit_text_migrated/native_edit_text_migrated_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeEditTextMigratedPlatform
    with MockPlatformInterfaceMixin
    implements NativeEditTextMigratedPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NativeEditTextMigratedPlatform initialPlatform = NativeEditTextMigratedPlatform.instance;

  test('$MethodChannelNativeEditTextMigrated is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeEditTextMigrated>());
  });

  // test('getPlatformVersion', () async {
  //   NativeEditTextMigrated nativeEditTextMigratedPlugin = NativeEditTextMigrated();
  //   MockNativeEditTextMigratedPlatform fakePlatform = MockNativeEditTextMigratedPlatform();
  //   NativeEditTextMigratedPlatform.instance = fakePlatform;
  //
  //   expect(await nativeEditTextMigratedPlugin.getPlatformVersion(), '42');
  // });
}
