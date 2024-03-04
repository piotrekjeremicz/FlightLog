//
//  AuthorizationServiceImpl.swift
//
//
//  Created by Piotrek Jeremicz on 11.02.2024.
//

import WebKit
import Domain
import Foundation

public final class AuthorizationServiceImpl: AuthorizationService {

    public var state: AuthorizationState? = nil
    
    public let initialRequestUrl = URL(string: "https://www.flightradar24.com/user/signin?returnUrl=https://my.flightradar24.com/sign-in")
    public let signInRequestUrl = URL(string: "https://my.flightradar24.com/sign-in")
    public let exportRequestUrl = URL(string: "https://my.flightradar24.com/public-scripts/export")
    
    public init() { }
    
    public func validate(navigation action: WKNavigationAction) -> AuthorizationState? {
        if state == nil && action.request.url == signInRequestUrl {
            return .userSignedIn
        } else {
            return state
        }
    }
    
    public func validate(navigation response: WKNavigationResponse) -> AuthorizationState? {
        switch state {
        case .none, .userSignedIn:
            if response.response.url?.host == signInRequestUrl?.host && response.response.url?.pathComponents.filter({ $0 != "/" }).count == 1 {
                return .userIsAuthorized
            }
            
        case .userIsAuthorized:
            if let response = response.response as? HTTPURLResponse,
               let contentDisposition = response.allHeaderFields["Content-Disposition"] as? String,
               contentDisposition.contains("attachment") {
                return .isAttachmentAvailable
            }
        default:
            break
        }
        
        return state
    }
}
