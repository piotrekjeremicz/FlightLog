//
//  WelcomeItemView.swift
//
//
//  Created by Piotrek Jeremicz on 02.03.2024.
//

import SwiftUI

struct WelcomeItemView: View {
    
    private let title: String
    private let description: String
    private let image: Image
    
    init(title: LocalizedStringResource, description: LocalizedStringResource, image: Image) {
        self.title = String(localized: title)
        self.description = String(localized: description)
        self.image = image
    }
    
    enum Constants {
        static let horizontalSpacing = 32.0
        static let imageSize = CGSize(width: 32, height: 32)
    }
    
    var body: some View {
        HStack(spacing: Constants.horizontalSpacing) {
            image
                .resizable()
                .scaledToFill()
                .frame(
                    width: Constants.imageSize.width,
                    height: Constants.imageSize.height
                )
                .foregroundStyle(Color.accentColor)
            
            VStack(alignment: .leading) {
                Text(verbatim: title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(verbatim: description)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview("Item") {
    WelcomeItemView(
        title: "Test",
        description: "Test",
        image: Image(systemName: "chevron.right")
    )
}
