
protocol RecipeFetchingService {
    func fetchRecipes() async throws -> [Recipe]
    func fetchEmptyRecipes() async throws -> [Recipe]
    func fetchMalformedRecipes() async throws -> [Recipe]
}

final class RecipeService: RecipeFetchingService {
    private let networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func fetchRecipes() async throws -> [Recipe] {
        try await simulateServerDelay()
        let base: BaseRecipe = try await networkManager.fetch(from: .recipes)
        return base.recipes
    }
    
    func fetchEmptyRecipes() async throws -> [Recipe] {
        try await simulateServerDelay()
        let base: BaseRecipe = try await networkManager.fetch(from: .empty)
        return base.recipes
    }
    
    func fetchMalformedRecipes() async throws -> [Recipe] {
        try await simulateServerDelay()
        let base: BaseRecipe = try await networkManager.fetch(from: .malformed)
        return base.recipes
    }
    
    /// Simulates a server delay to mimic real-world API response times.
    private func simulateServerDelay() async throws {
        try await Task.sleep(for: .seconds(0.5))
    }
}
