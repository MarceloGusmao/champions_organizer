// main.dart

import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'routes/app_routes.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initParse();
  runApp(MyApp());
}

Future<void> initParse() async {
  const keyApplicationId = PARSE_APP_ID;
  const keyClientKey = PARSE_CLIENT_KEY;
  const keyParseServerUrl = PARSE_SERVER_URL;

  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    autoSendSessionId: true,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parse Login Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.initial,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
