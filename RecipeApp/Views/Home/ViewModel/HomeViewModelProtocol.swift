
import Foundation

protocol HomeViewModelProtocol: ObservableObject {
    var viewState: HomeViewState { get }
    var searchText: String { get set }
    var selectedCuisine: PopularCuisine { get set }
    
    func loadInitialRecipes()
    func refreshRecipes()
    func setSimulationState(_ state: SimulateRecipeState)
}
