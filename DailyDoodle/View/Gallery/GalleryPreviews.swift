//
//  GalleryPreviews.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 14/02/23.
//

import SwiftUI

struct GalleryPreviews: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Drawing.date, ascending: false)])
    var draws: FetchedResults<Drawing>

    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 160))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 8) {
                ForEach(draws, id: \.challenge) { draw in
                    ZStack {
                        NavigationLink {
                            GalleryScreenView(challenge: draw.challenge!)
                        } label: {
                            Image(draw.challenge!)
                                .resizable()
                                .frame(width: 160, height: 120)
                                .cornerRadius(15)
                        }
                    }
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 3)
                }
            }
        }
    }
}

struct GalleryPreviews_Previews: PreviewProvider {
    static var previews: some View {
        GalleryPreviews()
    }
}
