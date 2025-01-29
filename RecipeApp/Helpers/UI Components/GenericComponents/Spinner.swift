
import SwiftUI

private enum Constants {
    static let initialAngle: CGFloat = .zero
    static let maxAngle: CGFloat = 360
    static let spinnerSize: CGFloat = 80
    static let animationDuration: CGFloat = 1.5
    static let lineWidth: CGFloat = 15
    static let ratio: CGFloat = 2
}

struct Spinner: View {
    @State private var rotationAngle = Constants.initialAngle
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    AngularGradient(
                        colors: [.primaryApp, .clear],
                        center: .center,
                        startAngle: .zero,
                        endAngle: .degrees(Constants.maxAngle)
                    ),
                    lineWidth: Constants.lineWidth
                )
                .frame(square: Constants.spinnerSize)
            
            Circle()
                .frame(square: Constants.lineWidth)
                .foregroundStyle(.primaryApp)
                .offset(x: Constants.spinnerSize / Constants.ratio)
            
        }
        .rotationEffect(.degrees(rotationAngle))
        .onAppear {
            withAnimation(.linear(duration: Constants.animationDuration)
                .repeatForever(autoreverses: false)) {
                    rotationAngle = Constants.maxAngle
                }
        }
        .onDisappear{
            rotationAngle = Constants.initialAngle
        }
        .frame(maxSquare: .infinity)
        .ignoresSafeArea()
    }
}
