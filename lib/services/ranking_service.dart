import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

Future<List<ParseObject>> getRanking() async {
  final QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject('ranking'));
  final ParseResponse apiResponse = await query.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}
