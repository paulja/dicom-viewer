//
//  WebView.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 24/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let htmlString: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(htmlString: "<body>Web Preview</body>")
    }
}
