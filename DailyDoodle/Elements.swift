//
//  Elements.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 14/02/23.
//

import SwiftUI

struct Elements: View {
    var body: some View {

        // Circulo mais claro
        Circle()
            .fill(Color("CTA").opacity(0.62))
            .frame(width: 1000, height: 1000)
            .position(x: 220, y: -340)

        // Circulo mais escuro
        Circle()
            .fill(Color("CTA"))
            .frame(width: 1000, height: 1000)
            .position(x: 200, y: -350)

        Text("Tema do mês:")
            .foregroundColor(.white)
            .font(Font.custom("Comfortaa-Bold", size: 28))
            .position(x: 200, y: 45)

        Text("Carnaval")
            .foregroundColor(.white)
            .font(Font.custom("Comfortaa-Bold", size: 36, relativeTo: .title))
            .position(x: 200, y: 90)
    }
}

struct Elements_Previews: PreviewProvider {
    static var previews: some View {
        Elements()
    }
}
