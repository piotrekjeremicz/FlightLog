//
//  WelcomeView.swift
//
//
//  Created by Piotrek Jeremicz on 08.12.2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @Environment(OnboardingCoordinator.Navigator.self) private var navigator
    
    enum Constants {
        static let verticalSpacing = 24.0
        static let horizontalSpacing = 36.0
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .center) {
                    WelcomeHeaderView(
                        title: "Welcome to\nFlightLog",
                        description: "An application created to show the best design patterns and admire your air expeditions!"
                    )
                    
                    VStack(spacing: Constants.verticalSpacing) {
                        WelcomeItemView(
                            title: "Clean Architecture",
                            description: "Probably the most sufficient approach to making mobile apps. Not overscaled, easy to test with high code coverage.",
                            image: Image(systemName: "photo.artframe")
                        )
                        
                        WelcomeItemView(
                            title: "Fully SwiftUI",
                            description: "Model, View and View Model is common pattern for SwiftUI apps. Adding Coordinator and Navigator provides better navigation flow.",
                            image: Image(systemName: "swift")
                        )
                        
                        WelcomeItemView(
                            title: "Something for Flight Lovers",
                            description: "Model, View and View Model is common pattern for SwiftUI apps. Adding Coordinator and Navigator provides better navigation flow.",
                            image: Image(systemName: "airplane.departure")
                        )
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, Constants.horizontalSpacing)
            }
            .scrollIndicators(.hidden)
            
            WelcomeFooterView(
                icon: Image(systemName: "lightbulb.max.fill"),
                description: "This app is used only in self development purpose. I do not mean to do something against somebody. My goal is to help people and share my knowledge.",
                buttonTitle: "Login Flightdiary",
                action: { navigator.present(.authorization) }
            )
            .padding(.horizontal, Constants.horizontalSpacing)
        }
    }
}

#Preview {
    WelcomeView()
        .environment(OnboardingCoordinator.Navigator())
}
