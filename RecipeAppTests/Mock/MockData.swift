
@testable import RecipeApp

struct MockModel: Equatable {
    let id: Int
    var name: String
}

final class MockData {
    static let bananaRecipe = Recipe(
        id: "f8b20884-1e54-4e72-a417-dabbc8d91f12",
        cuisine: "American",
        name: "Banana Pancakes",
        photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg",
        photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg",
        sourceUrl: "https://www.bbcgoodfood.com/recipes/banana-pancakes",
        youtubeUrl: "https://www.youtube.com/watch?v=kSKtb2Sv-_U"
    )
    
    static let recipes: [Recipe] = [
        Recipe(
            id: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
            cuisine: "Malaysian",
            name: "Apam Balik",
            photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
            photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
            sourceUrl: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
            youtubeUrl: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
        ),
        Recipe(
            id: "599344f4-3c5c-4cca-b914-2210e3b3312f",
            cuisine: "British",
            name: "Apple & Blackberry Crumble",
            photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
            photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
            sourceUrl: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
            youtubeUrl: "https://www.youtube.com/watch?v=4vhcOwVBDO4"
        ),
        Recipe(
            id: "f8b20884-1e54-4e72-a417-dabbc8d91f12",
            cuisine: "American",
            name: "Banana Pancakes",
            photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg",
            photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg",
            sourceUrl: "https://www.bbcgoodfood.com/recipes/banana-pancakes",
            youtubeUrl: "https://www.youtube.com/watch?v=kSKtb2Sv-_U"
        ),
        Recipe(
            id: "39ad8233-c470-4394-b65f-2a6c3218b935",
            cuisine: "Canadian",
            name: "Canadian Butter Tarts",
            photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f18384e7-3da7-4714-8f09-bbfa0d2c8913/large.jpg",
            photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f18384e7-3da7-4714-8f09-bbfa0d2c8913/small.jpg",
            sourceUrl: "https://www.bbcgoodfood.com/recipes/1837/canadian-butter-tarts",
            youtubeUrl: "https://www.youtube.com/watch?v=WUpaOGghOdo"
        ),
        Recipe(
            id: "563dbb27-5323-443c-b30c-c221ae598568",
            cuisine: "Italian",
            name: "Budino Di Ricotta",
            photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/large.jpg",
            photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/small.jpg",
            sourceUrl: "https://thehappyfoodie.co.uk/recipes/ricotta-cake-budino-di-ricotta",
            youtubeUrl: "https://www.youtube.com/watch?v=6dzd6Ra6sb4"
        )
    ]
}
