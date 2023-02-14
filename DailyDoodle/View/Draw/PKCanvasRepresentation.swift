//
//  OKCanvasRepresentation.swift
//  DailyDoodle
//
//  Created by Lais Godinho on 14/02/23.
//

import SwiftUI
import PencilKit

struct PKCanvasRepresentation: UIViewRepresentable {
    @Binding var canvas: PKCanvasView
    @State var tool = PKToolPicker()

    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput;
        showTools()
        return canvas;
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}

private extension PKCanvasRepresentation {
    func showTools() {
        tool.setVisible(true, forFirstResponder: canvas)
        tool.addObserver(canvas)
        canvas.becomeFirstResponder()
    }
}

