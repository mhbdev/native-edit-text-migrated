#include "include/native_edit_text_migrated/native_edit_text_migrated_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "native_edit_text_migrated_plugin.h"

void NativeEditTextMigratedPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  native_edit_text_migrated::NativeEditTextMigratedPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
