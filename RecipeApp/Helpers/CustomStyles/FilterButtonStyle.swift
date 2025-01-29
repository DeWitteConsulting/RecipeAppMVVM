
import SwiftUI

struct FilterButtonStyle: ButtonStyle {
    private let isSelected: Bool
    private let buttonSize: CGFloat
    
    init(isSelected: Bool, buttonSize: CGFloat = 40) {
        self.isSelected = isSelected
        self.buttonSize = buttonSize
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(.plain)
            .frame(height: buttonSize)
            .padding(.horizontal)
            .background(
                isSelected ? .primaryApp : .clear,
                in: .capsule
            )
            .foregroundStyle(
                isSelected ? .white : .blackLightWhiteDark
            )
            .fontWeight(
                isSelected ? .bold : .regular
            )
    }
}
