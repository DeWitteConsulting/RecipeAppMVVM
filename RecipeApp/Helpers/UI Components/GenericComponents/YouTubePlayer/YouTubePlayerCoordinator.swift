
import WebKit

final class YouTubePlayerCoordinator: NSObject, WKNavigationDelegate {
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    private func setupActivityIndicatorIfNeeded(in webView: WKWebView) {
        guard activityIndicator.superview == nil else { return }
        activityIndicator.center = webView.center
        webView.addSubview(activityIndicator)
    }
}

// MARK: - WKNavigationDelegate

extension YouTubePlayerCoordinator {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        setupActivityIndicatorIfNeeded(in: webView)
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
