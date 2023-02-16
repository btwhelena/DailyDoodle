//
//  DailyChallengeView.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 15/02/23.
//

import SwiftUI

struct DailyChallengeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").ignoresSafeArea()

                Image("Circles")
                    .resizable().scaledToFit()
                    .offset(y: 320)

                VStack {

                    Text("Desafio do dia")
                        .frame(maxWidth: 330, alignment: .center)
                        .font(Font.custom("Comfortaa-Bold", size: 24))
                        .multilineTextAlignment(.center)

                    Spacer()

                    Image("caxorro")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 220, height: 220)
                        .cornerRadius(15)
                        .clipShape(Rectangle())

                    Spacer().frame(height: 25)

                    Text("Tente desenhar a imagem de referência acima ou escolha um desenho da sua galeria.")
                        .frame(maxWidth: 330, alignment: .center)
                        .font(Font.custom("Comfortaa-Bold", fixedSize: 24))
                        .multilineTextAlignment(.center)

                    Spacer().frame(height: 25)

                    Button {
                        print("aiii papai cliquei")

                    } label: {

                        ZStack{
                            Rectangle()
                                .fill(Color("CTA"))
                                .frame(width: 250, height: 60)
                                .cornerRadius(35)

                            Text("Desenhar")
                                .font(Font.custom("Comfortaa-Bold", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer().frame(height: 25)
                    Button {
                        print("aiii papai cliquei")

                    } label: {

                        ZStack{
                            Rectangle()
                                .fill(Color("Background"))
                                .frame(width: 250, height: 60)
                                .cornerRadius(35)

                                .overlay(
                                    RoundedRectangle(cornerRadius: 35)
                                        .stroke(Color("CTA"), lineWidth: 2)
                                        .background(Rectangle().fill(Color("Background")))
                                        .cornerRadius(35)


                                    )

                            Text("Escolher da galeria")
                                .font(Font.custom("Comfortaa-Bold", size: 20))
                                .foregroundColor(Color("CTA"))
                        }
                    }
                    Spacer().frame(height: 120)
                }
            }
        }
    }
}

struct DailyChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        DailyChallengeView()
    }
}
