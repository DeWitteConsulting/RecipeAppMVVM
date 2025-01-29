
enum HomeViewState: Equatable {
    case success(recipes: [Recipe])
    case loading
    case empty
    case failure(message: String)
}
