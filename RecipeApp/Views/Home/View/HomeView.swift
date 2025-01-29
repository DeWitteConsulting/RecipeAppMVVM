import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    @ObservedObject private var viewModel: ViewModel
    
    // MARK: - Initialization
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            mainContent
        }
        .navigationTitle("Recipes")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .toolbar { toolbarContent }
    }
    
    // MARK: - UI Components
    
    @ViewBuilder
    private var mainContent: some View {
        switch viewModel.viewState {
            case .success(let recipes): successStateView(with: recipes)
            case .loading: Spinner()
            case .empty: emptyStateView
            case .failure(let errorMessage): failureStateView(errorMessage)
        }
    }
    
    private func successStateView(with recipes: [Recipe]) -> some View {
        RecipeListView(
            selectedCuisine: $viewModel.selectedCuisine,
            recipes: recipes
        )
        .searchable(text: $viewModel.searchText)
        .refreshable { viewModel.refreshRecipes() }
    }
    
    private var emptyStateView: some View {
        CustomContentUnavailableView(
            image: .iceCream,
            message: "There isn't any recipe registered yet"
        )
    }
    
    private func failureStateView(_ errorMessage: String) -> some View {
        CustomContentUnavailableView(
            image: .errorCat,
            message: errorMessage,
            retryAction: viewModel.loadInitialRecipes
        )
    }
    
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Menu {
                ForEach(SimulateRecipeState.allCases, id: \.self) { state in
                    Button(state.rawValue) {
                        viewModel.setSimulationState(state)
                    }
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .imageScale(.large)
                    .foregroundStyle(.primaryApp)
            }
        }
    }
}
