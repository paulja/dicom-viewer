//
//  MasterView.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 24/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @State private var fileList: FileList?

    var body: some View {
        Group {
            if fileList != nil {
                ListView(fileList: fileList!)
            }
            else {
                LoadingView()
            }
        }
        .onAppear {
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                self.fetchFileList()
            }
        }
    }

    private func fetchFileList() {
        DataManager.shared
            .getFileList()
            .sink { data in
                self.fileList = data
            }
            .store(in: &DataManager.shared.subscriptions)
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
