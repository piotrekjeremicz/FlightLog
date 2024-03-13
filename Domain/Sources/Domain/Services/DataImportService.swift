//
//  DataImportService.swift
//
//
//  Created by Piotrek Jeremicz on 05.03.2024.
//

import Foundation

public protocol DataImportService {
    var fileUrl: URL? { get set }

    func registerFile(url: URL)
}
