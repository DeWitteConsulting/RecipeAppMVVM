
import SwiftUI

@main
struct RecipeAppApp: App {
    @StateObject private var appCoordinator: AppCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            EntryView()
                .environmentObject(appCoordinator)
                .onAppear {
                    appCoordinator.start()
                }
        }
    }
}
