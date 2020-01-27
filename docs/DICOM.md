# DICOM

> We would be very grateful if you could look into the possibility of managing DICOM images or .jpeg stacks within your platform

The first thing we have to do to understand what this request actually means for us. It breaks down in to aspects: Hosting and presenting the content i.e. what would then be involved in hosting and presenting a DICOM file.

## Hosting

We host all content in AWS S3, and then serve over any files over HTTPS by using NGINX servers, which is gate-kept with time limited security tokens. 

## Presenting

We present our content, typically, in Web based viewers (such as web browsers, or WebView controls on mobile platforms). In some cases we present specific file content in purpose built viewers, for example Video and Audio, Office style documents and PDFs.

## DICOM Explained

DICOM is an image format typically using the medical industry, which is also a standard for a transfer protocol. The DICOM specification also has provision for storing embedded user/patient identifiable information, so as the image data cannot be divorced from the subject patient.

A DICOM file, which typically has a .DCM file extension, requires a bespoke viewer to render the stack of images contained, much like a PDF; however, more analogous in actual usage to a GIF file. In that the file contains many images "stacked", but in the case of DICOM, on the z-axis; where all the images are the same scale and perspective. But unlike a GIF, the images are not moving, they are static and user/consumer of the file is expected to then "scroll" through the images in sequence.

From my brief analysis it appears these files can also be served over HTTPS.

## Solution

- We can easily store the files in the CCDN (however, data sovereignty is something that might need to be considered further given that the file format also includes identifiable patient data)
- The files can be served via HTTPS to a rendering tech so no further action is needed there, our current hosting technology is suitable
- To render we'd look into using and open source 3rd party renderer, for example:
    - DWV ([https://github.com/ivmartel/dwv](https://github.com/ivmartel/dwv) ([demo](https://ivmartel.github.io/dwv/)))
    - Cornerstone JS [https://github.com/cornerstonejs/cornerstone](https://github.com/cornerstonejs/cornerstone)
- As the proposed rendering technology is browser/web based it is feasible that the same solution could be employed by both the portal and mobile apps — however, the interactions would be different (mouse scroll wheel, compared to "pinch and zoom" etc.)

## Questions

- How big are the DICOM files typically? (the magnitude of the files is what we're after here, is it 10's, 100's or 1000's of MB's?)
- The images contain what we would considered as identifiable patient data, our CCDN does typically does not store identifiable information, so data sovereignty is a non-issue, what additional considerations are expected?
- What are the typical use-cases for wanting to view these images on our platform? (this is to help understand what features of DICOM will be needed and to what extent, including what "viewer" interactions are needed)

## Next Steps

As I can see no issue in principal in being able to host and render these images on our platform, I would like to perform a brief PoC—time-boxed to 1-2 days—where we push a file onto the CCDN and attempt to render it by using the DWV or Cornerstone JS solutions within a Web Browser environment.

This will give us some certainty around whether our platform needs any further modification and additionally what effort would be required to bake the viewer in to our portal (and/or mobile) solution.

(Note: This PoC could be performed purely from mobile perspective to achieve a similar outcome if resources are more readily available in that area)
