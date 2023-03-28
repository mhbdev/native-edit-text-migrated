#ifndef FLUTTER_PLUGIN_NATIVE_EDIT_TEXT_MIGRATED_PLUGIN_H_
#define FLUTTER_PLUGIN_NATIVE_EDIT_TEXT_MIGRATED_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace native_edit_text_migrated {

class NativeEditTextMigratedPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  NativeEditTextMigratedPlugin();

  virtual ~NativeEditTextMigratedPlugin();

  // Disallow copy and assign.
  NativeEditTextMigratedPlugin(const NativeEditTextMigratedPlugin&) = delete;
  NativeEditTextMigratedPlugin& operator=(const NativeEditTextMigratedPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace native_edit_text_migrated

#endif  // FLUTTER_PLUGIN_NATIVE_EDIT_TEXT_MIGRATED_PLUGIN_H_
