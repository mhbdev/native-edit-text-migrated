import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_edit_text_migrated/native_edit_text_migrated_method_channel.dart';

void main() {
  MethodChannelNativeEditTextMigrated platform = MethodChannelNativeEditTextMigrated();
  const MethodChannel channel = MethodChannel('native_edit_text_migrated');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
