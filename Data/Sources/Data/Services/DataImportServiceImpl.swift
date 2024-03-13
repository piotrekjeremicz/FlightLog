//
//  DataImportServiceImpl.swift
//
//
//  Created by Jeremicz Piotr on 08/03/2024.
//

import Domain
import Foundation

public final class DataImportServiceImpl: DataImportService {
    public var fileUrl: URL?

    public func registerFile(url: URL) {
        self.fileUrl = url
    }
}
