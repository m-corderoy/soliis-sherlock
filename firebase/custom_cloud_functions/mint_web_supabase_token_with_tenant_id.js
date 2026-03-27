/* functions/index.js  (for FlutterFlow UI) */

const functions = require("firebase-functions");
const admin = require("firebase-admin");
const jwt = require("jsonwebtoken");

// **DO NOT** call admin.initializeApp() here — the FF UI does it for you.

exports.mintWebSupabaseTokenWithTenantId = functions
  .region("us-central1")
  .https.onCall(async (data, context) => {
    // Debug log so we know it's being invoked
    console.log(
      "🛎️ mintWebSupabaseTokenWithTenantId called with:",
      JSON.stringify(data),
    );

    const { token, tenantId } = data || {};
    if (!token) {
      throw new functions.https.HttpsError("invalid-argument", "Missing token");
    }
    if (tenantId == null) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Missing tenantId",
      );
    }

    let fbUser;
    try {
      fbUser = await admin.auth().verifyIdToken(token);
    } catch (e) {
      console.error("Firebase token verify failed", e);
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Invalid Firebase token",
      );
    }

    const now = Math.floor(Date.now() / 1000);
    const exp = now + 2 * 3600;
    const supaJwt = jwt.sign(
      {
        sub: fbUser.uid,
        user_id: fbUser.uid,
        iss: "supabase",
        aud: "authenticated",
        role: "authenticated",
        iat: now,
        exp,
        tenant_id: tenantId,
      },
      process.env.SUPABASE_JWT_SECRET,
      { algorithm: "HS256" },
    );

    return { access_token: supaJwt };
  });
