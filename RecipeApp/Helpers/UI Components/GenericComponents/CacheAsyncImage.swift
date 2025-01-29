
import SwiftUI

struct CacheAsyncImage: View {
    private let url: String
    private let imageCache: ImageCache = .shared
    
    // MARK: - Initializer
    
    init(url: String) {
        self.url = url
    }
    
    // MARK: - Main View
    
    var body: some View {
        if let cachedImage = imageCache.getImage(key: url) {
            cachedImage
                .resizable()
        } else {
            imageLoaded
        }
    }
    
    // MARK: - UI Components
    
    private var imageLoaded: some View {
        AsyncImage(url: URL(string: url)) { image in
            imageCache
                .setImage(key: url, with: image)
                .resizable()
                .scaledToFill()
        } placeholder: {
            Color.gray
        }
    }
}
