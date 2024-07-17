import 'package:champions_organizer/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'routes/app_routes.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initParse();
  runApp(const MyApp());
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ParseUser?>(
      future: AuthService.getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data != null) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Home',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: AppRoutes.home,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Login',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: AppRoutes.initial,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        }
      },
    );
  }
}
