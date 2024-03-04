//
//  AuthorizationView.swift
//
//
//  Created by Piotrek Jeremicz on 08.02.2024.
//

import Domain
import WebKit
import WebView
import SwiftUI

struct AuthorizationView: View {
    
    @State private var viewModel: AuthorizationViewModel
    
    init(authorizationService: AuthorizationService) {
        _viewModel = State(
            wrappedValue: AuthorizationViewModel(
                authorizationService: authorizationService
            )
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                WebView(request: $viewModel.request, navigator: viewModel.webViewNavigator)
                    .decisionPolicy(viewModel.handleAuthorizationState(in:))
                    .loadingProgress(viewModel.observe(phase:in:))
                    .onDownload(viewModel.handleAttachmentDownload(in:download:))
            }
            .navigationTitle("Flightdiary")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: viewModel.initialRequest)
    }
}

#Preview {
    AuthorizationView(
        authorizationService: AuthorizationServicePreview()
    )
}
