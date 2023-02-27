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
                    Text("Desafio de Hoje")
                        .frame(maxWidth: 330, alignment: .leading)
                        .font(Font.custom("Comfortaa-Bold", size: 24))
                        .multilineTextAlignment(.leading)
                        .padding(20)
                    NavigationLink(destination:
                                    DailyChallengeView()
                                   , isActive: $isActive) {
                        Button {
                            isActive.toggle()

                        } label: {
                            Image("CHALLENGE-\(DateHelper.getCurrentDay())")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 344, height: 213)
                                .cornerRadius(15)
                                .clipShape(Rectangle())
                                .overlay(
                                    Rectangle()
                                        .fill(.white).opacity(0.8)
                                        .frame(width: 330, height: 50)
                                        .cornerRadius(15)
                                        .padding(.top, 150)
                                        .overlay(alignment: .bottomTrailing) {
                                            HStack {
                                                Text("Iniciar desafio")
                                                    .font(Font.custom("Comfortaa-Bold", size: 20))
                                                    .foregroundColor(.black)

                                                Image(systemName: "chevron.right.circle")
                                                    .foregroundColor(.black)
                                                    .font(.title)
                                            } .padding(.trailing, 10)
                                                .padding(.bottom, 5)
                                        }
                                )
                        }
                    }

                    Text("Galeria")
                        .frame(maxWidth: 330, alignment: .leading)
                        .font(Font.custom("Comfortaa-Bold", size: 24))
                        .multilineTextAlignment(.leading)
                        .padding(20)
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


