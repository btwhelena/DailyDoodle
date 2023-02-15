//
//  ContentView.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 13/02/23.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State var canvasView = PKCanvasRepresentation()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    DrawView(canvasView: $canvasView)
                        .toolbar {
                            // 1
                            ToolbarItem(placement: .principal) {
                                UndoAndRedoButtons()
                            }

                            ToolbarItem(placement: .navigationBarTrailing) {

                                HStack {
                                    Button(action: canvasView.shareDrawing, label: {
                                        Image(systemName: "square.and.arrow.up")
                                    })
                                    Button(action: canvasView.finishChallenge, label: {
                                        Image(systemName: "checkmark.circle.fill")
                                    })
                                }

                            }
                        }
                } label: {
                    Label("Work Folder", systemImage: "folder")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
