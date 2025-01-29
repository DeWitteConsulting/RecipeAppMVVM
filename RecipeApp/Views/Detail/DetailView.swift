
import SwiftUI

// MARK: - Constants

private enum Constants {
    static let imageSize: CGFloat = 160
    static let mainSpacing: CGFloat = 5
    static let videoSize: CGFloat = 230
    static let bannerSize: CGFloat = 30
    static let buttonSize: CGFloat = 50
    static let cornerRadius: CGFloat = 15
}

// MARK: - DetailView

struct DetailView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        VStack(spacing: Constants.mainSpacing) {
            recipeImage
            youTubeVideo
            cuisineBanner
            recipeTitle
        }
        .navigationTitle("Recipe Detail")
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxHeight: .infinity, alignment: .top)
        .toolbar {
            sourceToolbarItem
        }
    }
    
    // MARK: - UI Components
    
    private var recipeImage: some View {
        CacheAsyncImage(url: recipe.photoUrlLarge)
            .frame(height: Constants.imageSize)
            .clipped()
    }
    
    @ViewBuilder
    private var youTubeVideo: some View {
        if let videoUrl = recipe.youtubeUrl {
            YouTubePlayerView(url: videoUrl)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: Constants.videoSize
                )
        }
    }
    
    private var cuisineBanner: some View {
        Text(recipe.cuisine)
            .fontWeight(.semibold)
            .frame(height: Constants.bannerSize)
            .padding(.horizontal)
            .foregroundStyle(.white)
            .background(.primaryApp, in: .capsule)
            .padding(.top)
    }
    
    private var recipeTitle: some View {
        Text(recipe.name)
            .font(.title)
            .fontWeight(.black)
    }
    
    private var sourceToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .bottomBar) {
            if let sourceUrl = URL(string: recipe.sourceUrl ?? "") {
                websiteButton(url: sourceUrl)
            }
        }
    }
    
    private func websiteButton(url: URL) -> some View {
        Button {
            appCoordinator.push(to: .showSource(url: url))
        } label: {
            HStack {
                Image(systemName: "globe")
                Text("Go to website")
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: Constants.buttonSize)
        .foregroundStyle(.white)
        .background(
            .primaryApp,
            in: .rect(cornerRadius: Constants.cornerRadius)
        )
    }
}
