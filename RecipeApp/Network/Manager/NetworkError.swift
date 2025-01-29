
import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case clientError(Int)
    case serverError(Int)
    case decodingFailed
    case unknownError
    
    var errorDescription: String? {
        switch self {
            case .invalidURL: return "The URL provided is invalid or improperly formatted."
            case .invalidResponse: return "The server response was invalid or not received."
            case .clientError(let statusCode): return "A client-side error occurred. HTTP Status Code: \(statusCode)."
            case .serverError(let statusCode): return "A server-side error occurred. HTTP Status Code: \(statusCode)."
            case .decodingFailed: return "Failed to decode the response data."
            case .unknownError: return "An unknown error occurred."
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
            case .invalidURL: "The request couldn't be created. Please check the input and try again."
            case .invalidResponse: "We couldn't connect to the server. Please check your internet connection and try again."
            case .clientError: "There seems to be an issue with the request. Please verify the details and try again."
            case .serverError: "The server is currently experiencing problems. Please wait and try again later."
            case .decodingFailed: "We couldn't process the response from the server. Please ensure your app is up-to-date and try again."
            case .unknownError: "An unexpected error occurred. Please restart the app or contact support if the problem persists."
        }
    }
}
