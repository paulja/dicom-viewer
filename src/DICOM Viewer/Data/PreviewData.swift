//
//  PreviewData.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 27/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import Foundation

final class PreviewData {
    static let shared = PreviewData()

    func previewFileList() -> FileList {
        let json = """
        {
            "name": "DICOM Samples",
            "files": [
                {
                    "name": "Item one",
                    "files": [
                        "https://cm-file-cache.s3-eu-west-1.amazonaws.com/dicom/101.dcm"
                    ]
                },
                {
                    "name": "Item two",
                    "files": [
                        "https://cm-file-cache.s3-eu-west-1.amazonaws.com/dicom/102.dcm"
                    ]
                }
             ]
        }
        """.data(using: .utf8)!

        return try! JSONDecoder().decode(FileList.self, from: json)
    }
}
