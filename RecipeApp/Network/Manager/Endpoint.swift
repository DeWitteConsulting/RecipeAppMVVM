
import Foundation

/// **Note**: This implementation is designed specifically for APIs that only support
/// GET requests without parameters. This approach has been intentionally chosen to
/// optimize development time for this specific use case.
enum Endpoint {
    case recipes
    case empty
    case malformed
    
    private var baseURL: URL {
        AppEnvironment.apiURL
    }
    
    private var path: String {
        switch self {
            case .recipes: "/recipes.json"
            case .empty: "/recipes-empty.json"
            case .malformed: "/recipes-malformed.json"
        }
    }
    
    /// **Note**: This implementation assumes no query parameters or additional
    /// modifications are required for the URL.
    func buildURL() -> URL {
        baseURL.appendingPathComponent(path)
    }
}
