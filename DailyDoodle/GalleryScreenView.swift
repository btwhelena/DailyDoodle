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
    @State var drawVM = DrawViewModel()


    var body: some View {
        VStack {
            NavigationLink {
                FullScreenModalView(image: draw.imagJPEG!)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack{
                                Button(action: share, label: {
                                    Image(systemName: "square.and.arrow.up")
                                })

                                Button(action: {drawVM.delete(draw: draw)}, label: {
                                    Image(systemName: "trash")
                                })
                            }
                        }
                    }
            } label: {
                Image(uiImage: draw.imagJPEG!)
                    .resizable()
                    .foregroundColor(.accentColor)
                    .frame(width: UIScreen.main.bounds.width/3.2)
                    .padding(10)
            }.accessibilityLabel("Your drawing")

        }
    }

    func share(){
        guard let image = draw.imagJPEG else { return }
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }

}

struct GalleryScreenView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Drawing.date, ascending: false)])
    var draws: FetchedResults<Drawing>
    let challenge: String

    var body: some View {
        DrawsView(results: draws, challenge: challenge)
            .navigationTitle(challenge.capitalized)
    }
}

struct DrawsView<Results:RandomAccessCollection>: View where Results.Element == Drawing {

    let results: Results
    let challenge: String

    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 140)),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    let height: CGFloat = 150

    var body: some View {

        let drawsFiltered = results.filter { $0.challenge!.contains(challenge) }

        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(drawsFiltered, id: \.self) { draw in
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
