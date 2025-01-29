
import SwiftUI

private enum Constants {
    static let imageSize: CGFloat = 220
    static let buttonSize: CGFloat = 40
    static let buttonPadding: CGFloat = 20
    static let mainSpacing: CGFloat = 15
    static let reloadImage: String = "arrow.trianglehead.counterclockwise"
}

struct CustomContentUnavailableView: View {
    private let image: ImageResource
    private let message: String
    private let retryAction: (() -> Void)?
    
    init(image: ImageResource,
         message: String,
         retryAction: (() -> Void)? = nil) {
        self.image = image
        self.message = message
        self.retryAction = retryAction
    }
    
    var body: some View {
        VStack(spacing: Constants.mainSpacing) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: Constants.imageSize)
            
            Text(message)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.grayLightWhiteDark)
            
            if let retryAction {
                Button("Retry", systemImage: Constants.reloadImage) {
                    retryAction()
                }
                .buttonStyle(.plain)
                .frame(height: Constants.buttonSize)
                .padding(.horizontal, Constants.buttonPadding)
                .background(.primaryApp, in: .capsule)
                .foregroundStyle(.white)
            }
        }
        .frame(maxSquare: .infinity)
        .ignoresSafeArea()
        .padding(.horizontal)
    }
}
