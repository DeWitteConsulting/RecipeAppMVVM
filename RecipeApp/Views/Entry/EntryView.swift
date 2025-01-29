import SwiftUI

struct EntryView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    var body: some View {
        NavigationStack(path: $appCoordinator.navigationPath) {
            appCoordinator.buildView(for: .showRecipes)
                .navigationDestination(for: AppTransition.self) { route in
                    appCoordinator.buildView(for: route)
                }
        }
    }
}
