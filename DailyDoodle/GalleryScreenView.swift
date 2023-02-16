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
    let title: String
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12).foregroundColor(.blue)
            Text(title)
                .font(.title2)
        }
    }
}

struct GalleryScreenView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var persistence = PersistenceController.shared
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Drawing.date, ascending: false)])
    var draws: FetchedResults<Drawing>


    var body: some View {
        NavigationStack{
            DrawsView(results: draws)
                .navigationTitle("Galeria")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add") {
                            print("Add tapped!")
                            persistence.addDraw()

                        }
                    }
                }
        }
    }
}

struct DrawsView<Results:RandomAccessCollection>: View where Results.Element == Drawing {

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
                ForEach(results, id: \.self) { draw in
                    CardView(title: draw.challenge ?? "Unknow")
                        .frame(height: height)
                }
            }
            .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryScreenView()
    }
}
