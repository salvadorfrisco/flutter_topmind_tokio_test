require("dotenv").config({ path: "assets/.env" });
const fs = require("fs");
const path = require("path");

const firebaseConfig = {
  apiKey: process.env.FIREBASE_API_KEY,
  authDomain: process.env.FIREBASE_AUTH_DOMAIN,
  projectId: process.env.FIREBASE_PROJECT_ID,
  storageBucket: process.env.FIREBASE_STORAGE_BUCKET,
  messagingSenderId: process.env.FIREBASE_MESSAGING_SENDER_ID,
  appId: process.env.FIREBASE_APP_ID,
  measurementId: process.env.FIREBASE_MEASUREMENT_ID,
};

const content = `\nconst firebaseConfig = ${JSON.stringify(
  firebaseConfig,
  null,
  2
)};\n\nfirebase.initializeApp(firebaseConfig);\n`;

fs.writeFileSync(path.join(__dirname, "../web/firebase-config.js"), content);
console.log("Arquivo firebase-config.js gerado com sucesso!");
