
import SwiftUI

extension ButtonStyle where Self == FilterButtonStyle {
    static func filterStyle(_ isSelected: Bool) -> FilterButtonStyle {
        .init(isSelected: isSelected)
    }
}
