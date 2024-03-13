//
//  AuthorizationViewModel.swift
//
//
//  Created by Piotrek Jeremicz on 09.02.2024.
//

import Domain
import WebKit
import WebView
import SwiftUI

@Observable
final class AuthorizationViewModel {
        
    var fileUrl: URL?
    var request: URLRequest?
    
    let webViewNavigator: WebViewNavigator = WebViewNavigator()
    var authorizationDownloadObserver: AuthorizationDownloadObserver?

    private let dataImportService: DataImportService

    private let getInitialRequestUseCase: GetInitialRequestUseCase
    private let handleAuthorizationStateUseCase: HandleAuthorizationStateUseCase
    private let handlePhaseStateUseCase: HandlePhaseStateUseCase
    
    init(authorizationService: AuthorizationService, dataImportService: DataImportService) {
        getInitialRequestUseCase = GetInitialRequestUseCase(authorizationService: authorizationService)
        handleAuthorizationStateUseCase = HandleAuthorizationStateUseCase(authorizationService: authorizationService)
        handlePhaseStateUseCase = HandlePhaseStateUseCase(authorizationService: authorizationService)
        
        authorizationDownloadObserver = AuthorizationDownloadObserver(onDownloadCompleted: proceed(with:))
    }
    
    func initialRequest() {
        request = try? getInitialRequestUseCase.invoke()
    }
    
    func handleAuthorizationState(in navigation: WebView.Navigation) -> WebView.Policy {
        handleAuthorizationStateUseCase.invoke(navigation)
    }
    
    func handleAttachmentDownload(in: WebView.Navigation, download: WKDownload) {
        download.delegate = authorizationDownloadObserver
    }
    
    func observe(phase: WebView.Phase, in navigation: WKNavigation) {
        guard let exportRequest = try? handlePhaseStateUseCase.invoke(phase) else { return }
        request = exportRequest
    }
    
    func proceed(with file: URL?) {
        dataImportService.registerFile(url: file)
        fileUrl = file
    }
    
    func shouldCompleteAuthorizationFlow(_ oldValue: URL?, _ newValue: URL?, whenCompleted dismiss: DismissAction) {
        guard oldValue == nil, let newValue else { return }
        dismiss()
    }
}


