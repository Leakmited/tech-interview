console.log("Question 1 - Basic Typing");

// Question 1: Fix the TypeScript types in this code

// Function that processes user data (intentionally using 'any')
function processUserData(user: any) {
  console.log(user.name.toUpperCase());
  return user.age + 5;
}

// Function that handles API response (intentionally using 'unknown')
function handleApiResponse(response: unknown) {
  if (response) {
    console.log(response.data);
    return response.status;
  }
  return null;
}

// Object with mixed types
const config = {
  apiKey: "12345",
  settings: {
    timeout: 5000,
    retries: 3,
  },
  features: ["auth", "logging", "caching"],
};

// Function that processes the config (intentionally using 'any')
function updateConfig(newSettings: any) {
  config.settings = newSettings;
  return config;
}

// Example usage (this will have type errors)
const user = {
  name: "John",
  age: 30,
};

const apiResponse = {
  data: { message: "Success" },
  status: 200,
};

// These calls will have type errors
processUserData(user);
handleApiResponse(apiResponse);
updateConfig({ timeout: 10000 });
