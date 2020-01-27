//
//  ActivityView.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 24/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityView: UIViewRepresentable {
    @Binding var isAnimating: Bool

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return  UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(isAnimating: .constant(true))
    }
}
