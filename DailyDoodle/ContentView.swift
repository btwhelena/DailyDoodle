//
//  ContentView.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 13/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Elements()
            Text("Desafio de Hoje")
                .font(Font.custom("Comfortaa-Bold", size: 28))
                .multilineTextAlignment(.leading)
            Button {
                print("aiii papai cliquei")

            } label: {
                Image("caxorro")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 330, height: 200)
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
                                        .font(Font.custom("Comfortaa-Bold", size: 24))
                                        .foregroundColor(.black)

                                    Image(systemName: "chevron.right.circle")
                                        .foregroundColor(.black)
                                        .font(.title)
                                } .padding(.trailing, 10)
                                    .padding(.bottom, 5)
                            }
                    )
            }
            Text("Galeria")
                .font(Font.custom("Comfortaa-Bold", size: 28))
                .multilineTextAlignment(.leading)
            GalleryPreviews()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
