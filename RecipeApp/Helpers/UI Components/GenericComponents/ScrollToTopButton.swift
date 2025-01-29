
import SwiftUI

private enum Constants {
    static let buttonSize: CGFloat = 50
    static let buttonPadding: CGFloat = 16
    static let shadowRadius: CGFloat = 10
}

struct ScrollToTopButton<ID: Hashable>: View {
    private let itemId: ID
    private let scrollViewProxy: ScrollViewProxy
    
    init(itemId: ID, scrollViewProxy: ScrollViewProxy) {
        self.itemId = itemId
        self.scrollViewProxy = scrollViewProxy
    }
    
    var body: some View {
        Button {
            scrollToTop()
        } label: {
            Image(systemName: "arrowshape.up")
                .resizable()
                .padding()
                .foregroundStyle(.white)
        }
        .frame(square: Constants.buttonSize)
        .background(.primaryApp, in: .circle)
        .shadow(
            color: .gray,
            radius: Constants.shadowRadius
        )
        .padding(.horizontal)
    }
    
    private func scrollToTop() {
        withAnimation {
            scrollViewProxy.scrollTo(itemId, anchor: .center)
        }
    }
}
