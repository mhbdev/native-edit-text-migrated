import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

typedef EditTextCreatedCallback = void Function(EditTextController controller);

class NativeEditTextMigrated extends StatefulWidget {
  const NativeEditTextMigrated({
    Key? key,
    required this.onEditTextCreated,
  }) : super(key: key);

  final EditTextCreatedCallback onEditTextCreated;

  @override
  State<StatefulWidget> createState() => _NativeEditTextMigratedState();
}

class _NativeEditTextMigratedState extends State<NativeEditTextMigrated> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'net.apexteam.native_edit_text_migrated/edittext',
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return Text('$defaultTargetPlatform is not yet supported by the NativeEditText plugin');
  }

  void _onPlatformViewCreated(int id) {
    widget.onEditTextCreated(EditTextController._(id));
  }
}

class EditTextController extends ValueNotifier<TextEditingValue> {
  EditTextController._(int id, {String? text})
      : _channel = MethodChannel('net.apexteam.native_edit_text_migrated/edittext_$id'),
        _eventChannel =
            EventChannel('net.apexteam.native_edit_text_migrated/edittext_$id/text_change'),
        super(text == null ? TextEditingValue.empty : TextEditingValue(text: text)) {
    _onTextChanged = _eventChannel.receiveBroadcastStream().map((dynamic event) => event as String);

    _onTextChanged.listen((event) {
      _setValue(event);
    });
  }

  final MethodChannel _channel;
  final EventChannel _eventChannel;
  late Stream<String> _onTextChanged;

  Future<String?> getText() async {
    return _channel.invokeMethod('getText');
  }

  String get text => value.text;

  _setValue(String newText) {
    value = value.copyWith(
      text: newText,
      selection: const TextSelection.collapsed(offset: -1),
      composing: TextRange.empty,
    );
  }

  set text(String newText) {
    _setValue(newText);
    _channel.invokeMethod('setText', newText);
  }

  void clear() {
    value = TextEditingValue.empty;
    _channel.invokeMethod('setText', '');
  }
}
