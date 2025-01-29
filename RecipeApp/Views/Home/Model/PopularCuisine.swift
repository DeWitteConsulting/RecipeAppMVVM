
enum PopularCuisine: String, CaseIterable, Identifiable {
    case all = "All"
    case british = "British"
    case american = "American"
    case french = "French"
    case canadian = "Canadian"
    
    var id: Self { self }
}
