require("dotenv").config({ path: "assets/.env" });
const fs = require("fs");
const path = require("path");

const googleServices = {
  project_info: {
    project_number: process.env.FIREBASE_PROJECT_NUMBER,
    project_id: process.env.FIREBASE_PROJECT_ID,
  },
  client: [
    {
      client_info: {
        mobilesdk_app_id: process.env.FIREBASE_MOBILESDK_APP_ID,
        android_client_info: {
          package_name: process.env.FIREBASE_ANDROID_PACKAGE_NAME,
        },
      },
      oauth_client: [],
      api_key: [
        {
          current_key: process.env.FIREBASE_CURRENT_KEY,
        },
      ],
      services: {
        appinvite_service: {
          other_platform_oauth_client: [],
        },
      },
    },
  ],
  configuration_version: "1",
};

fs.writeFileSync(
  path.join(__dirname, "../android/app/google-services.json"),
  JSON.stringify(googleServices, null, 2)
);
console.log("Arquivo google-services.json gerado com sucesso!");
