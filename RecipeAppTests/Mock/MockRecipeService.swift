
@testable import RecipeApp

enum MockError: Error {
    case malformedRecipes
}

final class MockRecipeService: RecipeFetchingService {
    func fetchRecipes() async throws -> [Recipe] {
        MockData.recipes // Simulates fetching valid recipes.
    }
    
    func fetchEmptyRecipes() async throws -> [Recipe] {
        [] // Simulates fetching an empty recipe list.
    }
    
    func fetchMalformedRecipes() async throws -> [Recipe] {
        throw MockError.malformedRecipes // Simulates fetching malformed recipes, resulting in an error.
    }
}
