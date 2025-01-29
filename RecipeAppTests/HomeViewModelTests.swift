import Testing
import Foundation
@testable import RecipeApp

struct HomeViewModelTests {
    @Test
    func loadRecipesSuccessfully() async throws {
        // Given
        let service = MockRecipeService()
        let viewModel = HomeViewModel(recipeService: service)
        let expectedRecipes = MockData.recipes

        // When
        viewModel.loadInitialRecipes()

        // Then
        try await waitForExpectedState(.success(recipes: expectedRecipes), in: viewModel)
    }

    @Test
    func loadRecipesWhenEmpty() async throws {
        // Given
        let service = MockRecipeService()
        let viewModel = HomeViewModel(recipeService: service)

        // When
        viewModel.setSimulationState(.empty)

        // Then
        try await waitForExpectedState(.empty, in: viewModel)
    }

    @Test
    func loadRecipesWhenError() async throws {
        // Given
        let service = MockRecipeService()
        let viewModel = HomeViewModel(recipeService: service)
        let expectedMessage = "An unexpected error occurred. Please try again later."

        // When
        viewModel.setSimulationState(.failure)
        
        // Then
        try await waitForExpectedState(.failure(message: expectedMessage), in: viewModel)
    }
    
    @Test
    func refreshRecipesSuccessfully() async throws {
        // Given
        let service = MockRecipeService()
        let viewModel = HomeViewModel(recipeService: service)
        let expectedRecipes = MockData.recipes
        
        // When
        viewModel.refreshRecipes()
        
        // Then
        try await waitForExpectedState(.success(recipes: expectedRecipes), in: viewModel)
    }
    
    @Test
    func searchRecipesSuccessfully() async throws {
        // Given
        let service = MockRecipeService()
        let viewModel = HomeViewModel(recipeService: service)
        let expectedRecipes = [MockData.bananaRecipe]

        // When
        viewModel.searchText = "Banana Pancakes"

        // Then
        try await waitForExpectedState(.success(recipes: expectedRecipes), in: viewModel)
    }
    
    /// **Note**::  Waits for `viewState` to match `expectedState` within a timeout.
    /// Acts as an alternative to `XCTestExpectation` in Swift Testing.
    /// Uses polling with `usleep(100_000)` to reduce CPU usage.
    /// Fails with `#expect` if the expected state is not reached in time.
    private func waitForExpectedState(
        _ expectedState: HomeViewState,
        in viewModel: HomeViewModel,
        timeout: TimeInterval = 2.0
    ) async throws {
        let startTime = Date()

        while Date().timeIntervalSince(startTime) < timeout {
            if viewModel.viewState == expectedState {
                break
            }
            usleep(100_000)
        }

        #expect(
            viewModel.viewState == expectedState,
            "Timeout waiting for state \(expectedState), current state: \(viewModel.viewState)"
        )
    }
}
