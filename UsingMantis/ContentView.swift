//
//  ContentView.swift
//  UsingMantis
//
//  Created by APPLE on 2021/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var ourImage: UIImage?
    
    var body: some View {
        VStack {
            Image(uiImage: ourImage!)
                .resizable()
            Button(action: { // Start editing the image
                
            }, label: {
                Text("Edit")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
