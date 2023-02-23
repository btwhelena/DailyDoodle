//
//  SecondPage.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 18/02/23.
//

import SwiftUI

struct SecondPage: View {

    var body: some View {

        ZStack{
            Color("Background")
            VStack {
                Text("Desenhos")
                    .frame(maxWidth: 330, alignment: .leading)
                    .font(Font.custom("Comfortaa-Bold", size: 48))
                    .multilineTextAlignment(.leading)
                Text("Você irá fazer desafios diários tentando reproduzir imagens de referência através dos desenhos.")
                    .frame(maxWidth: 330, alignment: .leading)
                    .font(Font.custom("Comfortaa-Regular", size: 24))
                    .multilineTextAlignment(.leading)
            }.ignoresSafeArea()
        }.ignoresSafeArea()
    }
}

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        SecondPage()
    }
}
