
import SwiftUI

private enum Constants {
    static let bannerHeight: CGFloat = 30
    static let generalPadding: CGFloat = 10
    static let itemHeight: CGFloat = 180
    static let cornerRadius: CGFloat = 15
    static let imageOpacity: CGFloat = 0.4
}

struct RecipeItemView: View {
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.cuisine)
                .frame(height: Constants.bannerHeight)
                .padding(.horizontal)
                .foregroundStyle(.white)
                .background(.primaryApp, in: .capsule)
            
            Text(recipe.name)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(
                    maxHeight: .infinity,
                    alignment: .bottomLeading
                )
        }
        .padding(Constants.generalPadding)
        .frame(height: Constants.itemHeight)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(recipeImage)
    }
    
    // MARK: - UI Components
    
    private var recipeImage: some View {
        CacheAsyncImage(url: recipe.photoUrlSmall)
            .overlay {
                Color.black.opacity(Constants.imageOpacity)
            }
            .clipShape(.rect(cornerRadius: Constants.cornerRadius))
    }
}
