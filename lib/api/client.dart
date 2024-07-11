import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void client() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'PREieFQjosJZx171aB66zYQ9jXIqRXmFiIu9MdPj';
  const keyClientKey = 'D1FnnJ9Ur7nYaf5cMc2oew7WZR8DGP3Uh0idvfox';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);
}
