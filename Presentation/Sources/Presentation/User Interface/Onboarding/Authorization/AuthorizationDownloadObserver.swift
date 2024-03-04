//
//  AuthorizationDownloadObserver.swift
//  
//
//  Created by Piotrek Jeremicz on 10.02.2024.
//

import WebKit

final class AuthorizationDownloadObserver: NSObject, WKDownloadDelegate {
    
    private var destinationUrl: URL?
    private var onDownloadCompleted: ((_ destinationUrl: URL?) -> Void)?
    
    init(onDownloadCompleted: ( (URL?) -> Void)? = nil) {
        self.onDownloadCompleted = onDownloadCompleted
    }
    
    func download(_ download: WKDownload, decideDestinationUsing response: URLResponse, suggestedFilename: String) async -> URL? {
        destinationUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(suggestedFilename)
        
        return destinationUrl
    }
    
    func downloadDidFinish(_ download: WKDownload) {
        onDownloadCompleted?(destinationUrl)
    }
}
