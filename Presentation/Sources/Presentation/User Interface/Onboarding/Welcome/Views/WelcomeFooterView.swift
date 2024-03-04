//
//  WelcomeFooterView.swift
//
//
//  Created by Piotrek Jeremicz on 03.03.2024.
//

import SwiftUI

struct WelcomeFooterView: View {
    
    let buttonTitle: String
    let description: String
    let icon: Image
    let action: () -> Void
    
    init(icon: Image, description: LocalizedStringResource, buttonTitle: LocalizedStringResource, action: @escaping () -> Void) {
        self.buttonTitle = String(localized: buttonTitle)
        self.description = String(localized: description)
        self.icon = icon
        self.action = action
    }
    
    enum Constants {
        static let bottomPadding = 4.0
        static let buttonHeight = 36.0
        static let iconSize = CGSize(width: 24, height: 24)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            icon
                .resizable()
                .scaledToFill()
                .frame(
                    width: Constants.iconSize.width,
                    height: Constants.iconSize.height
                )
                .foregroundStyle(Color.accentColor)
                .symbolRenderingMode(.hierarchical)
                .padding(.bottom, Constants.bottomPadding)
            
            Text(verbatim: description)
                .font(.caption2)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            Button(action: action) {
                Text(buttonTitle)
                    .fontWeight(.bold)
                    .frame(height: Constants.buttonHeight)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    WelcomeFooterView(
        icon: Image(systemName: "lightbulb.max.fill"),
        description: "This app is used only in self development purpose. I do not mean to do something against somebody. My goal is to help people and share my knowledge.",
        buttonTitle: "Login Flightdiary",
        action: { }
    )
}
