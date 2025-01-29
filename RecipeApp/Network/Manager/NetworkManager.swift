import Foundation

protocol NetworkManaging {
    func fetch<T: Decodable>(from endpoint: Endpoint) async throws -> T
}

final class NetworkManager: NetworkManaging {
    static let shared = NetworkManager()

    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    // MARK: - Public Methods

    /// **Note**: For this specific API, only GET requests with no parameters are supported.
    /// If additional functionality is required (e.g., POST requests, headers, or parameters),
    /// the logic in `session.data(from:)` can be replaced with `session.data(for:)`
    /// to support a `URLRequest` instead of a simple URL.
    func fetch<T: Decodable>(from endpoint: Endpoint) async throws -> T {
        let url = endpoint.buildURL()
        let (data, response) = try await session.data(from: url)
        
        try validate(response: response)
        return try decode(data: data)
    }

    // MARK: - Private Methods
    
    private func validate(response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        let statusCode = httpResponse.statusCode

        switch statusCode {
        case 200...299: return
        case 400...499: throw NetworkError.clientError(statusCode)
        case 500...599: throw NetworkError.serverError(statusCode)
        default: throw NetworkError.unknownError
        }
    }
    
    private func decode<T: Decodable>(data: Data) throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
