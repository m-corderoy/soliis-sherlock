import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetTreeCall {
  static Future<ApiCallResponse> call({
    int? parentid = 1,
    String? apikey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtiaGVib3V1amVubHFuZG51bnd6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzczOTE5MzMsImV4cCI6MjA1Mjk2NzkzM30.seWvIhG9SXEpa0JwFEX3H34a2olwXi5wCwFLDsy_73Q',
    String? jwt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTree',
      apiUrl:
          'https://kbhebouujenlqndnunwz.supabase.co/rest/v1/location?parent_id=eq.${parentid}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey': '${apikey}',
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTeamCall {
  static Future<ApiCallResponse> call({
    int? parentid = 1,
    String? apikey =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtiaGVib3V1amVubHFuZG51bnd6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzczOTE5MzMsImV4cCI6MjA1Mjk2NzkzM30.seWvIhG9SXEpa0JwFEX3H34a2olwXi5wCwFLDsy_73Q',
    String? jwt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTeam',
      apiUrl:
          'https://kbhebouujenlqndnunwz.supabase.co/rest/v1/team?parent_id=eq.${parentid}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey': '${apikey}',
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTenantsCall {
  static Future<ApiCallResponse> call({
    String? apikey = '',
    int? limit,
    int? offset = 0,
    String? jwt = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Tenants',
      apiUrl: 'https://kbhebouujenlqndnunwz.co/rest/v1/user_tenant_view',
      callType: ApiCallType.GET,
      headers: {
        'apikey': ' ${apikey}',
        'Authorization': 'Bearer  ${jwt}',
      },
      params: {
        'limit': limit,
        'offset': offset,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FilterTenantsFromTenantSummaryCall {
  static Future<ApiCallResponse> call({
    String? supabaseKey,
    String? jwt = '',
    String? tenantname = '',
    String? status = '',
    String? contactName = '',
  }) async {
    supabaseKey ??= FFDevEnvironmentValues().supabaseAnonKey;

    final ffApiRequestBody = '''
{
  "p_name": "${escapeStringForJson(contactName)}",
  "p_status": "${escapeStringForJson(status)}",
  "p_tenant": "${escapeStringForJson(tenantname)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Filter Tenants from tenant summary',
      apiUrl:
          'https://kbhebouujenlqndnunwz.supabase.co/rest/v1/rpc/tenant_filter',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '${supabaseKey}',
        'Authorization': 'Bearer ${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? tenant(dynamic response) => getJsonField(
        response,
        r'''$.tenant''',
        true,
      ) as List?;
}

class GetOpsViewCall {
  static Future<ApiCallResponse> call({
    String? supabaseKey = '',
    String? jwt = '',
    String? currenttime = '',
    int? pTenantId,
    int? pOpsBoardId,
  }) async {
    final ffApiRequestBody = '''
{
  "p_tenant_id": ${pTenantId},
  "p_ops_board_id": ${pOpsBoardId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetOpsView',
      apiUrl:
          'https://kbhebouujenlqndnunwz.supabase.co/rest/v1/rpc/get_ops_with_tags_array_from_view',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${jwt}',
        'apikey': '${supabaseKey}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? opsID(dynamic response) => (getJsonField(
        response,
        r'''$[:].ops_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? tenantID(dynamic response) => (getJsonField(
        response,
        r'''$[:].tenant_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? tags(dynamic response) => getJsonField(
        response,
        r'''$[:].tags''',
        true,
      ) as List?;
  static List<String>? primarysummary(dynamic response) => (getJsonField(
        response,
        r'''$[:].primary_summary''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? totaltokens(dynamic response) => (getJsonField(
        response,
        r'''$[:].total_tokens''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? postedBy(dynamic response) => (getJsonField(
        response,
        r'''$[:].postedby''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? assetParam1(dynamic response) => (getJsonField(
        response,
        r'''$[:].assetGroupParam1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? assetParam2(dynamic response) => (getJsonField(
        response,
        r'''$[:].assetGroupParam2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? assetInt1(dynamic response) => (getJsonField(
        response,
        r'''$[:].assetGroupint1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? utp(dynamic response) => (getJsonField(
        response,
        r'''$[:].utp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? postedData(dynamic response) => (getJsonField(
        response,
        r'''$[:].postedData''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CreateNewFBuserCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createNewFBuser',
      apiUrl:
          'https://soliis-cloud-ydgk64qb7q-ew.a.run.app/content/create-firebase-user',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? returnUserID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.uid''',
      ));
}

class SendEmailAuthCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? code = '',
    String? url = '',
    String? subject = 'No subject set',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Send email auth',
      apiUrl: 'https://soliis.app.n8n.cloud/webhook/email-auth',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'email': '${email}',
        'code': '${code}',
        'url': '${url}',
        'subject': '${subject}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateFBUserAdminCall {
  static Future<ApiCallResponse> call({
    String? s3cretpass = '',
    String? email = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(s3cretpass)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create FB User Admin',
      apiUrl: 'https://soliis-cloud-ydgk64qb7q-ew.a.run.app/admin/create-user',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uid''',
      ));
}

class GetVerificationURLCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? continueUrl = '',
    String? key = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "continue_url": "${escapeStringForJson(continueUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Verification URL',
      apiUrl:
          'https://soliis-cloud-ydgk64qb7q-ew.a.run.app/tenant/generate-email-verification-link',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${key}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DataExtractionTestCall {
  static Future<ApiCallResponse> call({
    bool? extractData,
    String? url = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Data Extraction Test',
      apiUrl:
          'https://soliis.app.n8n.cloud/webhook-test/341de9c9-2218-493a-8c3a-3397ca8fc915',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'ExtractData': '${extractData}',
        'url': '${url}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateFBUserTenantCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create FB User Tenant',
      apiUrl: 'https://soliis-cloud-ydgk64qb7q-ew.a.run.app/tenant/create-user',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFBUserTenantCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? uid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete FB User Tenant',
      apiUrl:
          'https://soliis-cloud-ydgk64qb7q-ew.a.run.app/tenant/users/${uid}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReportTestCall {
  static Future<ApiCallResponse> call({
    dynamic reportDataJson,
    dynamic utpJson,
  }) async {
    final reportData = _serializeJson(reportDataJson);
    final utp = _serializeJson(utpJson);
    final ffApiRequestBody = '''
{
  "reportData": ${reportData},
  "utp": ${utp}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Report Test',
      apiUrl:
          'https://soliis.app.n8n.cloud/webhook/v1/2b53326c-86a7-4243-9b55-8e66e3149f97',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InitChatSessionCall {
  static Future<ApiCallResponse> call({
    String? pConfigType = '',
    String? pSessionId = '',
    int? pSourceSchemaId,
    int? pTenantId,
    String? token = '',
    String? supabaseKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "p_session_id": "${escapeStringForJson(pSessionId)}",
  "p_tenant_id": ${pTenantId},
  "p_config_type": "${escapeStringForJson(pConfigType)}",
  "p_source_schema_id": ${pSourceSchemaId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Init chat session',
      apiUrl:
          'https://kbhebouujenlqndnunwz.supabase.co/rest/v1/rpc/init_config_draft',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '${supabaseKey}',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendCommandnchatCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? supabaseKey = '',
    String? sessionId = '',
    String? userEmail = '',
    int? opsBoardId,
    String? content = '',
    int? tenantId,
  }) async {
    final ffApiRequestBody = '''
{
  "tenantId": ${tenantId},
  "sessionId": "${escapeStringForJson(sessionId)}",
  "userEmail": "${escapeStringForJson(userEmail)}",
  "content": "/publish ${opsBoardId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendCommandnchat',
      apiUrl: 'https://soliis.app.n8n.cloud/webhook/jsonBuilder/v1',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey': '${supabaseKey}',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetIconsCall {
  static Future<ApiCallResponse> call({
    String? apikey = 'WNMY1N1GM9KUegkh.d7f17dcd8dda3c54d0877ed1d207f731',
    String? searchQuery = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Icons',
      apiUrl:
          'https://public-api.streamlinehq.com/v1/search/global?productType=icons',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'x-api-key': '${apikey}',
      },
      params: {
        'query': searchQuery,
        'limit': 100,
        'productTier': "free",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? imageURL(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].imagePreviewUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
