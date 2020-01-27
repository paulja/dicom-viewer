//
//  ContentView.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 23/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MasterView()
                .navigationBarTitle(Text("DICOM Samples"))
            DetailView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
