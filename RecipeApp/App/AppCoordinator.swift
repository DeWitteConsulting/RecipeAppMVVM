
import SwiftUI

// MARK: - App Coordinator

final class AppCoordinator: Coodinator {
    @Published var navigationPath: NavigationPath = .init()
    
    private lazy var homeView: some View = {
        let recipeService = RecipeService()
        let homeViewModel = HomeViewModel(recipeService: recipeService)
        return HomeView(viewModel: homeViewModel)
    }()
    
    func start() {
        WKWebViewProvider.shared.configureWebView()
    }
    
    @ViewBuilder
    func buildView(for route: AppTransition) -> some View {
        switch route {
            case .showRecipes: homeView
            case .showDetail(let recipe): DetailView(recipe: recipe)
            case .showSource(let url): SafariView(url: url)
        }
    }
}

// MARK: - App Router

extension AppCoordinator: AppRouter {
    func push(to route: AppTransition) {
        navigationPath.append(route)
    }
    
    func pop() {
        guard !navigationPath.isEmpty else { return }
        navigationPath.removeLast()
    }
}
