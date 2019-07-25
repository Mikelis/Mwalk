const functions = require('firebase-functions');

// https://firebase.google.com/docs/functions/get-started
// https://firebase.google.com/docs/database/admin/save-data
// https://github.com/firebase/functions-samples/blob/master/quickstarts/thumbnails/functions/index.js
// firebase deploy --only functions

const admin = require("firebase-admin");
const path = require('path');

admin.initializeApp();
const db = admin.firestore();
//// Take the text parameter passed to this HTTP endpoint and insert it into the
//// Realtime Database under the path /messages/:pushId/original
//exports.addMessage = functions.https.onRequest(async (req, res) => {
//  // Grab the text parameter.
//  const original = req.query.text;
//  // Push the new message into the Realtime Database using the Firebase Admin SDK.
//  const snapshot = await db.ref("server/saving-data/fireblog").push({original: original});
//  // Redirect with 303 SEE OTHER to the URL of the pushed object in the Firebase console.
//  res.redirect(303, snapshot.ref.toString());
//});

exports.saveFieldOnStorageChange = functions.storage.object().onFinalize(async (object) => {
    const filePath = object.name; // File path in the bucket.
    const fileName = path.basename(filePath);

    let ref = db.collection("user").doc(fileName)
    let escapedPath = require('querystring').escape(filePath)

    let imageUri = "https://firebasestorage.googleapis.com/v0/b/tryangle-27376.appspot.com/o/"+escapedPath+"?alt=media"

    let setWithOptions = ref.set({
      image:imageUri
    }, {merge: true});
});