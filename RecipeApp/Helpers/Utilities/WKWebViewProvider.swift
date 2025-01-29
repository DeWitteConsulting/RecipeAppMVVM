import WebKit

/// **Note**: This implementation addresses performance issues observed with WKWebView on iOS 16+.
/// Known problems include warnings like "[Security] This method should not be called on the main thread"
/// and initialization delays due to changes introduced in these versions.
/// While this approach does not resolve the issues entirely, reusing a single WKWebView instance
/// helps optimize performance by reducing repeated initialization overhead.
///
/// References:
/// - StackOverflow: https://stackoverflow.com/questions/50537421/wkwebview-in-ios-app-takes-a-long-time-to-load
/// - Apple Developer Forums: https://developer.apple.com/forums/thread/712899
/// - Related Issue with AdMob: https://forums.developer.apple.com/forums/thread/714467
final class WKWebViewProvider {
    static let shared = WKWebViewProvider()

    private(set) lazy var webView: WKWebView = {
        WKWebView(frame: .zero, configuration: wkWebViewConfiguration)
    }()
    
    private lazy var wkWebViewConfiguration: WKWebViewConfiguration = {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []
        configuration.websiteDataStore = .nonPersistent()
        return configuration
    }()
    
    private init() { }

    func configureWebView() {
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.allowsLinkPreview = true
        resetWebView()
    }

    func resetWebView() {
        webView.stopLoading()
        webView.navigationDelegate = nil
        webView.uiDelegate = nil
        webView.configuration.userContentController.removeAllUserScripts()
        webView.loadHTMLString("", baseURL: nil)
    }
}
