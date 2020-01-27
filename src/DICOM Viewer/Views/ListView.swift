//
//  ListView.swift
//  DICOM Viewer
//
//  Created by Paul Jackson on 27/01/2020.
//  Copyright © 2020 Jaaco UK. All rights reserved.
//

import SwiftUI

struct ListView: View {
    var fileList: FileList

    var body: some View {
        List {
            ForEach(fileList.files, id: \.name) { file in
                NavigationLink(
                    destination: DetailView(selectedFile: file)
                ) {
                    Text(file.name)
                }
            }
        }.animation(.easeIn)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(fileList: PreviewData.shared.previewFileList())
    }
}
