
import Foundation

enum AppTransition: Hashable {
    case showRecipes
    case showDetail(recipe: Recipe)
    case showSource(url: URL)
}
