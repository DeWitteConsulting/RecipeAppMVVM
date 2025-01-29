import Foundation

enum AppEnvironment {
    private enum PlistKeys {
        static let apiURL = "API_URL"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let info = Bundle.main.infoDictionary else {
            fatalError("[AppEnvironment] Missing Info.plist file in the bundle.")
        }
        return info
    }()
    
    static var apiURL: URL {
        guard let urlString = infoDictionary[PlistKeys.apiURL] as? String,
              let url = URL(string: urlString)
        else {
            fatalError("[AppEnvironment] Invalid or missing API_URL in Info.plist.")
        }
        return url
    }
}
