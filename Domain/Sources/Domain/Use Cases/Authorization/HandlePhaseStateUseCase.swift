//
//  HandlePhaseState.swift
//
//
//  Created by Piotrek Jeremicz on 12.02.2024.
//

import Foundation
import WebView

public final class HandlePhaseStateUseCase {
    
    private var authorizationService: AuthorizationService
    
    public init(authorizationService: AuthorizationService) {
        self.authorizationService = authorizationService
    }
    
    public func invoke(_ phase: WebView.Phase) throws -> URLRequest? {
        if phase == .finish && authorizationService.state == .userIsAuthorized {
            guard let initialRequestUrl = authorizationService.exportRequestUrl else {
                throw AuthorizationError.defectedExportRequestUrl
            }
            
            return URLRequest(url: initialRequestUrl)
        } else {
            return nil
        }
    }
}
