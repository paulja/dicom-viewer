//
//  PickerObserver.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 27/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import Combine

class PickerObserver {
    public var publisher = PassthroughSubject<Int, Never>()
    public var value: Int = 0 {
        didSet {
            publisher.send(value)
        }
    }
}
