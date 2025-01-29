
import SwiftUI

extension View {
    func frame(square: CGFloat,
               alignment: Alignment = .center) -> some View {
        frame(
            width: square,
            height: square,
            alignment: alignment
        )
    }
    
    func frame(maxSquare: CGFloat,
               alignment: Alignment = .center) -> some View {
        frame(
            maxWidth: maxSquare,
            maxHeight: maxSquare,
            alignment: alignment
        )
    }
}

