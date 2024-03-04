//
//  OnboardingCoordinator.swift
//
//
//  Created by Piotrek Jeremicz on 08.12.2023.
//

import Domain
import SwiftUI

public struct OnboardingCoordinator: View {
    
    @State private var navigator = Navigator()
    
    public var body: some View {
        WelcomeView()
            .environment(navigator)
    }
}

extension OnboardingCoordinator {
    @Observable
    final class Navigator {
        var destination: Destination?
        
        enum Destination: Identifiable, Hashable {
            case authorization
            
            var id: Int { hashValue }
        }
        
        func present(_ destination: Destination) {
            self.destination = destination
        }
    }
}
