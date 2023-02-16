//
//  DailyChallengeView.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 15/02/23.
//

import SwiftUI

struct DailyChallengeView: View {

    @State private var image = UIImage()
    @State private var showSheet = false

    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").ignoresSafeArea()

                Image("Circles")
                    .resizable().scaledToFit()
                    .frame(maxHeight: .infinity, alignment: .bottom)

                VStack {

                    Text("Desafio do dia")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(Font.custom("Comfortaa-Bold", size: 24))
                        .padding(.bottom, 15)
                        .multilineTextAlignment(.center)


                    Image("caxorro")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 220, height: 220)
                        .cornerRadius(15)
                        .clipShape(Rectangle())

//                    Spacer().frame(height: 25)

                    Text("Tente desenhar a imagem de referência acima ou escolha um desenho da sua galeria.")
                        .frame(maxWidth: 330, alignment: .center)
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                        .font(Font.custom("Comfortaa-Regular", fixedSize: 24))
                        .multilineTextAlignment(.center)

//                    Spacer().frame(height: 25)

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
//                    Spacer().frame(height: 25)
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
                        .onTapGesture {
                            showSheet = true
                        }
                        .sheet(isPresented: $showSheet) {
                            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                        }
                    }
                }
            }.ignoresSafeArea(.all)
        }.accentColor(Color("CTA"))
    }
}

struct DailyChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        DailyChallengeView()
    }
}
