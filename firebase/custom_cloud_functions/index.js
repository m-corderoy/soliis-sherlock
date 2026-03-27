const admin = require("firebase-admin/app");
admin.initializeApp();

const mintWebSupabaseTokenWithTenantId = require("./mint_web_supabase_token_with_tenant_id.js");
exports.mintWebSupabaseTokenWithTenantId =
  mintWebSupabaseTokenWithTenantId.mintWebSupabaseTokenWithTenantId;
