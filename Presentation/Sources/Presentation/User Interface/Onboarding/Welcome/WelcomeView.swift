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
                }
                .padding(.horizontal, Constants.horizontalSpacing)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    WelcomeView()
        .environment(OnboardingCoordinator.Navigator())
}
