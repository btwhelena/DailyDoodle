//
//  ContentView.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 13/02/23.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let title: String
}

struct CardView: View {
    let draw : Drawing

    @State var isImageFullScreen = false
    @State var canvasView = PKCanvasRepresentation()


    var body: some View {
        VStack {
            Button(action: {isImageFullScreen.toggle()}) {
                Image(uiImage: draw.imagJPEG!)
                        .resizable()
                        .foregroundColor(.accentColor)
                        .frame(width: UIScreen.main.bounds.width/3.2)
                        .padding(10)

                Text(draw.challenge!)
                    .font(.title2)
            }
            .fullScreenCover(isPresented: $isImageFullScreen, content: {
                FullScreenModalView(image: draw.imagJPEG!)

                HStack {
                    Button(action: share, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                }
            })
        }
    }

    func share(){
        let activityVC = UIActivityViewController(activityItems: [self.draw.imagJPEG], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct GalleryScreenView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Drawing.date, ascending: false)])
    var draws: FetchedResults<Drawing>

    var body: some View {
        NavigationView {
            DrawsView(results: draws)
                .navigationTitle("Galeria")

        }
    }
}

struct DrawsView<Results:RandomAccessCollection>: View where Results.Element == Drawing {
    @State var drawVM = DrawViewModel()

    let results: Results

    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 140)),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    let height: CGFloat = 150

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(results, id: \.id) { draw in
                    if draw.imagJPEG != nil {
                        CardView(draw: draw)
                            .frame(height: height)
                    }
                }
            }
            .padding()

        }
    }
}
