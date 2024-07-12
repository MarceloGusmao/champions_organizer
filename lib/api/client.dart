import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import '../utils/constants.dart';

void client() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Parse().initialize(
    PARSE_APP_ID,
    PARSE_SERVER_URL,
    clientKey: PARSE_CLIENT_KEY,
    autoSendSessionId: true,
  );
}