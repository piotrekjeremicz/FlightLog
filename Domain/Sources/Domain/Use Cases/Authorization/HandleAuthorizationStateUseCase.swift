//
//  HandleAuthorizationState.swift
//
//
//  Created by Piotrek Jeremicz on 11.02.2024.
//

import WebView
import Foundation

public final class HandleAuthorizationStateUseCase {

    private var authorizationService: AuthorizationService
    
    public init(authorizationService: AuthorizationService) {
        self.authorizationService = authorizationService
    }
    
    public func invoke(_ navigation: WebView.Navigation) -> WebView.Policy {
        switch navigation {
        case .action(let action):
            authorizationService.state = authorizationService.validate(navigation: action)
        case .response(let response):
            authorizationService.state = authorizationService.validate(navigation: response)
            
            if authorizationService.state == .isAttachmentAvailable {
                return .download
            }
        }
        
        return .allow
    }
}
