//
//  Model.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 24/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import Foundation

class FileList: Decodable {
    public var name = ""
    public var files = [File]()
}

class File: Decodable {
    public var name = ""
    public var files = [String]()
}
