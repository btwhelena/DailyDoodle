//
//  FirstPage.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 18/02/23.
//

import SwiftUI

struct FirstPage: View {

    var body: some View {
        ZStack{
            Color("Background")
            VStack {
                Spacer().frame(height: 120)
                Text("Vamos começar?")
                    .frame(maxWidth: 330, alignment: .leading)
                    .font(Font.custom("Comfortaa-Bold", size: 48.0))
                    .multilineTextAlignment(.leading)

                Spacer().frame(height: 100)
            }.ignoresSafeArea()
        }.ignoresSafeArea()

    }
}




struct FirstPage_Previews: PreviewProvider {
    static var previews: some View {
        FirstPage()
    }
}

