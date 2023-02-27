//
//  ContentView.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 13/02/23.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State var isActive = false

    var body: some View {
        NavigationView {
            ZStack{
                Color("Background")
                VStack {
                    Elements()
                    Spacer(minLength: 32)
                    Text("Today's Challenge")
                        .frame(maxWidth: 330, alignment: .leading)
                        .font(Font.custom("Comfortaa-Bold", size: 28))
                        .multilineTextAlignment(.leading)
                    NavigationLink(destination:
                                    DailyChallengeView()
                                   , isActive: $isActive) {
                        Button {
                            isActive.toggle()

                        } label: {
                            Image(decorative: "CHALLENGE-\(DateHelper.getCurrentDay())")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 330, height: 200)
                                .cornerRadius(15)
                                .clipShape(Rectangle())
                                .overlay(
                                    Rectangle()
                                        .fill(Color("Background")).opacity(0.5)
                                        .frame(width: 330, height: 50)
                                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                                        .padding(.top, 150)
                                        .overlay(alignment: .bottomTrailing) {
                                            HStack {
                                                Text("Start Challenge")
                                                    .font(Font.custom("Comfortaa-Bold", size: 24))
                                                    .foregroundColor(Color("Text"))

                                                Image(systemName: "chevron.right.circle")
                                                    .foregroundColor(Color("Text"))
                                                    .font(.title)
                                            } .padding(.trailing, 10)
                                                .padding(.bottom, 5)
                                        }
                                )
                        }
                    }
                                   .accessibilityLabel("Start Challenge")
                    Spacer(minLength: 32)
                    Text("Gallery")
                        .frame(maxWidth: 330, alignment: .leading)
                        .font(Font.custom("Comfortaa-Bold", size: 28))
                        .multilineTextAlignment(.leading)
                    GalleryPreviews().frame(maxWidth: 330, alignment: .leading)
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
