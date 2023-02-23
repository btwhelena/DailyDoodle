//
//  GalleryPreviews.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 14/02/23.
//

import SwiftUI

struct GalleryPreviews: View {
    private var data: [Int] = Array(1...10)
    private let colors: [Color] = [.red, .pink, .purple, .yellow]

    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 160))
    ]

    var body: some View {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 8) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            NavigationLink {
                                GalleryScreenView()
                            } label: {
                                Rectangle()
                                    .frame(width: 160, height: 120)
                                    .foregroundColor(colors[number%4])
                                    .cornerRadius(15)
                            }
                        }
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
