//
//  AuthorizationService.swift
//
//
//  Created by Piotrek Jeremicz on 11.02.2024.
//

import WebKit
import Foundation

public protocol AuthorizationService {

    var initialRequestUrl: URL? { get }
    var signInRequestUrl: URL? { get }
    var exportRequestUrl: URL? { get }
    
    var state: AuthorizationState? { get set }
    
    func validate(navigation action: WKNavigationAction) -> AuthorizationState?
    func validate(navigation response: WKNavigationResponse) -> AuthorizationState?
}

public enum AuthorizationState: Equatable {
    case userSignedIn
    case userIsAuthorized
    case isAttachmentAvailable
    case isFileDownloaded
}

public enum AuthorizationError: Error {
    case defectedInitialRequestUrl
    case defectedExportRequestUrl
}
