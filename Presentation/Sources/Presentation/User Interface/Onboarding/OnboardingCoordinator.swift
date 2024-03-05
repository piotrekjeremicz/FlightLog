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
    
    private let authorizationService: AuthorizationService
    
    public init(authorizationService: AuthorizationService) { 
        self.authorizationService = authorizationService
    }
    
    public var body: some View {
        WelcomeView()
            .environment(navigator)
            .sheet(item: $navigator.destination) { destination in
                switch destination {
                case .authorization:
                    AuthorizationView(
                        authorizationService: authorizationService
                    )
                }
            }
            .onChange(of: navigator.destination, monitorAuthorizationState(_:_:))
    }
    
    private func monitorAuthorizationState(_ oldValue: Navigator.Destination?, _ newValue: Navigator.Destination?) {
        if oldValue == .authorization, newValue == nil, authorizationService.state == .isFileDownloaded {
            
        }
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

#Preview {
    OnboardingCoordinator(
        authorizationService: AuthorizationServicePreview()
    )
}
