//
//  ContentView.swift
//  UsingMantis
//
//  Created by APPLE on 2021/05/23.
//

import SwiftUI
import Mantis

struct ContentView: View {
    @State var ourImage = UIImage(named: "graphic03")
    @State var isShowing = false
    
    var body: some View {
        VStack {
            Image(uiImage: ourImage!)
                .resizable()
            Button(action: { // Start editing the image
                isShowing = true
            }, label: {
                Text("Edit")
            })
            .fullScreenCover(isPresented: $isShowing) {
                ImageEditor(theimage: $ourImage, isShowing: $isShowing)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ImageEditor: UIViewControllerRepresentable {
    typealias Coordinator = ImageEditorCoordinator
    @Binding var theimage: UIImage?
    @Binding var isShowing: Bool
    
    func makeCoordinator() -> ImageEditorCoordinator {
        return ImageEditorCoordinator(image: $theimage, isShowing: $isShowing)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImageEditor>) -> Mantis.CropViewController {
        let Editor = Mantis.cropViewController(image: UIImage(imageLiteralResourceName: "graphic03"))
        Editor.delegate = context.coordinator
        return Editor
    }
}

class ImageEditorCoordinator: NSObject, CropViewControllerDelegate {
    @Binding var theimage: UIImage?
    @Binding var isShowing: Bool
    
    init(image: Binding<UIImage?>, isShowing: Binding<Bool>) {
        _theimage = image
        _isShowing = isShowing
    }
    
    func cropViewControllerDidCrop(_ cropViewController: CropViewController, cropped: UIImage, transformation: Transformation) {
        theimage = cropped
        isShowing = false
    }
    
    func cropViewControllerDidFailToCrop(_ cropViewController: CropViewController, original: UIImage) {
        
    }
    
    func cropViewControllerDidCancel(_ cropViewController: CropViewController, original: UIImage) {
        isShowing = false
    }
    
    func cropViewControllerDidBeginResize(_ cropViewController: CropViewController) {
        
    }
    
    func cropViewControllerDidEndResize(_ cropViewController: CropViewController, original: UIImage, cropInfo: CropInfo) {
        
    }
    
    
}
