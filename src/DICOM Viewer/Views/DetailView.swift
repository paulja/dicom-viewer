//
//  DetailView.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 24/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import SwiftUI
import Combine

struct DetailView: View {
    @State var selectedFile: File?

    @State private var isReady = false
    @State private var markup = ""
    @State private var pickerObserver = PickerObserver()

    private let modes = ["WindowLevel", "Scroll"]

    var body: some View {
        Group {
            if isReady {
                VStack {
                    Picker(selection: $pickerObserver.value, label: Text("Mode")) {
                        ForEach(0 ..< modes.count) {
                            Text(self.modes[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onReceive(pickerObserver.publisher) { _ in
                        self.loadFile()
                    }

                    WebView(htmlString: markup)
                        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 300, maxHeight: 400)

                    Text(selectedFile?.name ?? "Unknown")

                    Spacer()

                }.padding(10)
            } else {
                VStack {
                    ActivityView(isAnimating: .constant(true))
                    Text("\"\(selectedFile?.name ?? "Unknown")\"...").foregroundColor(.gray)
                    Spacer()
                }.padding(100)
            }
        }
        .navigationBarTitle(Text("Detail"), displayMode: .inline)
        .onAppear {
            self.loadFile()
        }
    }

    private func loadFile() {
        guard
            let file = selectedFile,
            let templateURL = Bundle.main.url(forResource: "index", withExtension: "html"),
            let templateHTML = try? String(contentsOf: templateURL)
            else {
                return
        }

        let urls = file.files.map { "\"\($0)\"" } .joined(separator: ",")
        let html = templateHTML
            .replacingOccurrences(of: "$URLS$", with: urls)
            .replacingOccurrences(of: "$MODE$", with: modes[pickerObserver.value])

        self.markup = html
        self.isReady = true
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
