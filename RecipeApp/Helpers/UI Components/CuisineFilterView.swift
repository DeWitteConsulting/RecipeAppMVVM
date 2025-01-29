
import SwiftUI

private enum Constants {
    static let filterHeight: CGFloat = 40
}

struct CuisineFilterView: View {
    @Binding private var selectedCuisine: PopularCuisine
    
    init(selectedCuisine: Binding<PopularCuisine>) {
        _selectedCuisine = selectedCuisine
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            ScrollViewReader { scrollViewProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        cuisineTypesView(in: scrollViewProxy)
                    }
                    .padding(.horizontal)
                }
                .frame(height: Constants.filterHeight)
                .onChange(of: selectedCuisine) { cuisine in
                    withAnimation {
                        scrollViewProxy.scrollTo(cuisine, anchor: .center)
                    }
                }
            }
        }
    }
    
    // MARK: - UI Components
    
    private var headerView: some View {
        Text("Cuisine Types")
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.horizontal)
    }
    
    private func cuisineTypesView(in scrollViewProxy: ScrollViewProxy) -> some View {
        ForEach(PopularCuisine.allCases) { cuisine in
            Button(cuisine.rawValue) {
                selectedCuisine = cuisine
            }
            .buttonStyle(
                .filterStyle(selectedCuisine == cuisine)
            )
        }
    }
}
