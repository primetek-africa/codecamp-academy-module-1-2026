// Author : Cristian Camilo Cortes Ortiz <Cristianco9>

// Simulated server response code
const statusCode = 400;

switch (statusCode) {

    case 200:
        console.log("Request successful.");
        break;

    case 400:
        console.log("bad request.");
        break;

    case 401:
        console.log("Unauthorized access.");
        break;

    case 404:
        console.log("Resource not found.");
        break;

    case 500:
        console.log("Internal server error.");
        break;

    default:
        console.log("Unknown status code.");
}