
enum SimulateRecipeState: String, CaseIterable, Identifiable {
    case success = "Simulate Success State"
    case empty = "Simulate Empty State"
    case failure = "Simulate Failure State"
    
    var id: Self { self }
}
