
import SwiftUI

private enum Constants {
    static let containerSpacing: CGFloat = 20
    static let animationDuration: CGFloat = 0.6
    static let itemCount: Int = 2
}

struct RecipeListView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @Binding private var selectedCuisine: PopularCuisine
    
    private let recipes: [Recipe]
    
    private let columns: [GridItem] = Array(
        repeating: .init(spacing: Constants.containerSpacing),
        count: Constants.itemCount
    )
    
    init(selectedCuisine: Binding<PopularCuisine>, recipes: [Recipe]) {
        _selectedCuisine = selectedCuisine
        self.recipes = recipes
    }
    
    var body: some View {
        VStack {
            CuisineFilterView(selectedCuisine: $selectedCuisine)
            
            recipeGridView
        }
        .animation(
            .easeInOut(duration: Constants.animationDuration),
            value: recipes
        )
    }
    
    // MARK: - UI Components
    
    private var recipeGridView: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: Constants.containerSpacing) {
                    ForEach(recipes) { recipe in
                        recipeButton(for: recipe)
                    }
                }
                .padding()
            }
            .overlay(alignment: .bottomTrailing) {
                if let recipe = recipes.first {
                    ScrollToTopButton(
                        itemId: recipe.id,
                        scrollViewProxy: scrollViewProxy
                    )
                }
            }
        }
    }
    
    private func recipeButton(for recipe: Recipe) -> some View {
        Button {
            appCoordinator.push(to: .showDetail(recipe: recipe))
        } label: {
            RecipeItemView(recipe: recipe)
        }
        .buttonStyle(.plain)
        .id(recipe.id)
    }
}
