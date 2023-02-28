//
//  Elements.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 14/02/23.
//

import SwiftUI

struct Elements: View {
    var body: some View {
        ZStack {

            Image(decorative: "TopCircles")
                .resizable().scaledToFit()
                .frame(width: 450, height: 200)

            VStack {
                Text("This month challenge:")
                    .padding(.top, 30)
                    .foregroundColor(.white)
                    .font(.system(size: 24, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .center)

                Text("Animals")
                    .foregroundColor(.white)
                    .font(.system(size: 32, design: .rounded))
                    .frame(maxWidth: .infinity, alignment: .center)

            }
        }
        .frame(maxHeight: 170)
    }
}

struct Elements_Previews: PreviewProvider {
    static var previews: some View {
        Elements()
    }
}
