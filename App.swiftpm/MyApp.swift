import SwiftUI

import Data
import Domain
import Presentation

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingNavigation()
        }
    }
}

#Preview {
    OnboardingNavigation()
}
