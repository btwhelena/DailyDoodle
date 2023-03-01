//
//  OKCanvasRepresentation.swift
//  DailyDoodle
//
//  Created by Lais Godinho on 14/02/23.
//

import SwiftUI
import PencilKit

struct PKCanvasRepresentation: UIViewRepresentable {
    var canvas: PKCanvasView = PKCanvasView()
    var drawVM = DrawViewModel()

    @State var tool = PKToolPicker()

    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        showTools()
        return canvas
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }

    func shareDrawing() {
        let image = canvas.drawing.image(from: canvas.bounds, scale: UIScreen.main.scale)
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC,
                                    animated: true,
                                    completion: nil)
    }

    func finishChallenge() {
        let image = canvas.drawing.image(from: canvas.bounds, scale: UIScreen.main.scale)
        simpleSuccess()
        
    }

    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

private extension PKCanvasRepresentation {
    func showTools() {
        tool.setVisible(true, forFirstResponder: canvas)
        tool.addObserver(canvas)
        canvas.becomeFirstResponder()
    }
}
