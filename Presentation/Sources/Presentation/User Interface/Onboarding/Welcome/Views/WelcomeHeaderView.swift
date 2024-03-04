//
//  WelcomeHeaderView.swift
//
//
//  Created by Piotrek Jeremicz on 03.03.2024.
//

import SwiftUI

struct WelcomeHeaderView: View {
    
    let title: String
    let description: String
    
    init(title: LocalizedStringResource, description: LocalizedStringResource) {
        self.title = String(localized: title)
        self.description = String(localized: description)
    }
    
    enum Constants {
        static let bottomPadding = 32.0
    }
    
    var body: some View {
        Text(verbatim: title)
            .padding(.vertical)
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
        
        Text(verbatim: description)
            .font(.title3)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom, Constants.bottomPadding)
    }
}

#Preview {
    WelcomeHeaderView(
        title: "Welcome to\nFlightLog",
        description: "An application created to show the best design patterns and admire your air expeditions!"
    )
}
