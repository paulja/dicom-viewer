//
//  LoadingView.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 27/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ActivityView(isAnimating: .constant(true))
            Text("Loading manifest...").foregroundColor(.gray)
            Spacer()
        }.padding(100)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
