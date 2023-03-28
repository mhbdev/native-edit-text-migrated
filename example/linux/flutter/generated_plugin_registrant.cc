//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <native_edit_text_migrated/native_edit_text_migrated_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) native_edit_text_migrated_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NativeEditTextMigratedPlugin");
  native_edit_text_migrated_plugin_register_with_registrar(native_edit_text_migrated_registrar);
}
