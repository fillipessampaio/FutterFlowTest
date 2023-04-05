import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ProfessionalsDemoGetCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'ProfessionalsDemoGet',
      apiUrl:
          'https://artemis.hadronlink.cloud/api:8r_tvYt4/profile_professionals/demo/v1/get',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic root(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  static dynamic pictureUrl(dynamic response) => getJsonField(
        response,
        r'''$[:].profile_picture_path.url''',
        true,
      );
  static dynamic skills(dynamic response) => getJsonField(
        response,
        r'''$[:].top_3_skills[:].skills''',
        true,
      );
  static dynamic trade(dynamic response) => getJsonField(
        response,
        r'''$[:]._dict_trades.trade''',
        true,
      );
  static dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$[:].first_name''',
        true,
      );
  static dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$[:].last_name''',
        true,
      );
  static dynamic unionName(dynamic response) => getJsonField(
        response,
        r'''$[:].union_name''',
        true,
      );
  static dynamic rate(dynamic response) => getJsonField(
        response,
        r'''$[:].professional_rate''',
        true,
      );
  static dynamic isCertified(dynamic response) => getJsonField(
        response,
        r'''$[:].is_certified''',
        true,
      );
  static dynamic isBestProfessionals(dynamic response) => getJsonField(
        response,
        r'''$[:].Best_Professionals''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
