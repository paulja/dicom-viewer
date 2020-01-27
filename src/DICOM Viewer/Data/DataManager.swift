//
//  DataManager.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 27/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import Foundation
import Combine

class DataManager {
    public static let shared = DataManager()

    public var subscriptions = [AnyCancellable]()

    private let manifestURL = URL(string: "https://cm-file-cache.s3-eu-west-1.amazonaws.com/dicom/manifest.json")!

    public func getFileList() -> AnyPublisher<FileList?, Never> {
        return URLSession.shared.dataTaskPublisher(for: manifestURL)
            .map { data, _ in try? JSONDecoder().decode(FileList.self, from: data) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
