import SwiftUI

import Data
import Presentation

@main
struct FlightLogApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingCoordinator(
                authorizationService: AuthorizationServiceImpl()
            )
        }
    }
}

#Preview("FlightLog") {
    OnboardingCoordinator(
        authorizationService: AuthorizationServiceImpl()
    )
}
