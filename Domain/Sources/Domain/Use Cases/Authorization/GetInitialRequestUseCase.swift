//
//  GetInitialRequest.swift
//
//
//  Created by Piotrek Jeremicz on 11.02.2024.
//

import Foundation

public final class GetInitialRequestUseCase {
    
    private let authorizationService: AuthorizationService
    
    public init(authorizationService: AuthorizationService) {
        self.authorizationService = authorizationService
    }
    
    public func invoke() throws -> URLRequest {
        guard let initialRequestUrl = authorizationService.initialRequestUrl else {
            throw AuthorizationError.defectedInitialRequestUrl
        }
        
        return URLRequest(url: initialRequestUrl)
    }
}
