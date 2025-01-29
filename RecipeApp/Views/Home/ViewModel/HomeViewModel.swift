import Combine
import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Published Properties
    
    @Published var searchText: String = ""
    @Published var selectedCuisine: PopularCuisine = .all
    @Published private(set) var viewState: HomeViewState = .loading
    
    // MARK: - Dependencies
    
    private let recipeService: RecipeFetchingService
    
    // MARK: - State
    
    private var simulationState: SimulateRecipeState = .success
    private var cancellables: Set<AnyCancellable> = []
    private var allRecipes: [Recipe] = []
    
    // MARK: - Initializer
    
    init(recipeService: RecipeFetchingService) {
        self.recipeService = recipeService
        setupBindings()
        loadInitialRecipes()
    }
    
    // MARK: - Public Methods
    
    func setSimulationState(_ state: SimulateRecipeState) {
        simulationState = state
        loadInitialRecipes()
    }
    
    func refreshRecipes() {
        resetFilters()
        fetchRecipes()
    }
    
    func loadInitialRecipes() {
        viewState = .loading
        fetchRecipes()
    }
    
    // MARK: - Private Methods
    
    private func fetchRecipes() {
        Task { @MainActor in
            do {
                let recipes = try await fetchRecipesBasedOnState()
                updateRecipeData(with: recipes)
            } catch {
                handleError(error)
            }
        }
    }
    
    private func setupBindings() {
        Publishers.CombineLatest($searchText, $selectedCuisine)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.applyFilters()
            }
            .store(in: &cancellables)
    }
    
    private func updateRecipeData(with recipes: [Recipe]) {
        allRecipes = recipes
        if recipes.isEmpty {
            viewState = .empty
            return
        }
        applyFilters()
    }
    
    private func resetFilters() {
        searchText = ""
        selectedCuisine = .all
    }
    
    private func handleError(_ error: Error) {
        debugPrint(error.localizedDescription)
        
        let friendlyMessage: String = {
            guard let localizedError = error as? LocalizedError,
                  let suggestionMessage = localizedError.recoverySuggestion
            else {
                return "An unexpected error occurred. Please try again later."
            }
            return suggestionMessage
        }()
        
        viewState = .failure(message: friendlyMessage)
    }
    
    /// **Note**: This function simulates the state using an enum (`SimulateRecipeState`).
    /// It is used to mimic API behavior in cases where the API might fail, return an empty response, or succeed.
    private func fetchRecipesBasedOnState() async throws -> [Recipe] {
        switch simulationState {
            case .success: try await recipeService.fetchRecipes()
            case .empty: try await recipeService.fetchEmptyRecipes()
            case .failure: try await recipeService.fetchMalformedRecipes()
        }
    }
    
    /// **Note**: This is a mock for local filtering. Ideally, the API should handle applying the necessary filters.
    /// If needed, this responsibility should be delegated to the service and/or repository layer.
    private func applyFilters() {
        let filteredRecipes = allRecipes.filter { recipe in
            let matchesSearch = searchText.isEmpty
            || recipe.name.localizedCaseInsensitiveContains(searchText)
            
            let matchesCuisine = selectedCuisine == .all
            || recipe.cuisine == selectedCuisine.rawValue
            
            return matchesSearch && matchesCuisine
        }
        
        viewState = .success(recipes: filteredRecipes)
    }
}
