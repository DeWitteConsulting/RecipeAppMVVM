
import SwiftUI
import WebKit

private enum YouTubeConstants {
    static let baseUrl: String = "https://www.youtube.com/embed/"
}

struct YouTubePlayerView: UIViewRepresentable {
    private let videoUrl: String
    
    init(url: String) {
        self.videoUrl = url
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebViewProvider.shared.webView
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let embedUrl,
              let url = URL(string: embedUrl) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func makeCoordinator() -> YouTubePlayerCoordinator {
        YouTubePlayerCoordinator()
    }
    
    static func dismantleUIView(_ uiView: WKWebView, coordinator: YouTubePlayerCoordinator) {
        WKWebViewProvider.shared.resetWebView()
    }
    
    private var embedUrl: String? {
        guard let components = URLComponents(string: videoUrl),
              let videoID = components.queryItems?.first(where: { $0.name == "v" })?.value else {
            return nil
        }
        return YouTubeConstants.baseUrl + videoID
    }
}
