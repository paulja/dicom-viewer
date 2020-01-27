# DICOM Viewer Demo App
The purpose of this app is to demonstrate that Agylia can host and render [DICOM](https://en.wikipedia.org/wiki/DICOM) images. The app uses the excellent [DWV](https://github.com/ivmartel/dwv) Javascript engine for rendering DICOM images, by hosting the content in a web view.

All source DCM files are stored in Agylia's AWS S3 infrastructure, where there is also a custom JSON file describing the contents of the bucket for the App to render. The App uses a `WKWebView` wrapped in a [SwiftUI](https://developer.apple.com/documentation/swiftui) interface and uses the [Combine](https://developer.apple.com/documentation/combine) framework to get the remote assets as needed.

## App Demo
![App Demo](https://github.com/paulja/dicom-viewer/blob/master/docs/app-demo.gif)