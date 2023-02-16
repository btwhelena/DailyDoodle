//
//  DrawView.swift
//  DailyDoodle
//
//  Created by Lais Godinho on 14/02/23.
//

import SwiftUI
import PencilKit
struct DrawView: View {
    @State private var isImageFullScreen = false
    @Binding var canvasView: PKCanvasRepresentation
    
    var body: some View {
        VStack {
            Button(action: {isImageFullScreen.toggle()}) {
                ReferenceImage()
            }
            .fullScreenCover(isPresented: $isImageFullScreen, content: {
                FullScreenModalView(image: UIImage(named: "CHALLENGE-1")!)
            })
            canvasView
        }
    }
}
