//
//  GalleryPreviews.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 14/02/23.
//

import SwiftUI

struct GalleryPreviews: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Drawing.date, ascending: false)])
    var draws: FetchedResults<Drawing>

    @State var isPaused: Bool = false

    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 160))
    ]

    var body: some View {
            if !draws.isEmpty{
                ScrollView {
                    LazyVGrid(columns: adaptiveColumns, spacing: 8) {
                        ForEach(draws, id: \.challenge) { draw in
                            if (draw.challenge != nil) {
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
            } else {
                VStack {
                    if colorScheme == .dark{
                        LottieView(name: "empty-screen-dark1", isPaused: $isPaused, contentMode: .scaleAspectFit)
                    } else {
                        LottieView(name: "empty-screen-light", isPaused: $isPaused, contentMode: .scaleAspectFit)
                    }

                    Text("Complete challenges to see your drawings.")
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                        .font(.system(.subheadline, design: .rounded))
                        .multilineTextAlignment(.center)

                    Spacer(minLength: 100)
                }
                .opacity(0.75)

        }
    }
}


