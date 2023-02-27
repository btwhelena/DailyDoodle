//
//  SecondPage.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 18/02/23.
//

import SwiftUI
import UIKit
import Lottie

struct SecondPage: View {

    private var animationView: LottieAnimationView?
    @Environment(\.colorScheme) var colorScheme

    var body: some View {

        ZStack{
            Color("Background")
            VStack {
                Text("Daily Doodle")
                    .frame(maxWidth: 330, alignment: .center)
                    .font(Font.custom("Comfortaa-Bold", size: 48))
                    .multilineTextAlignment(.leading)
                    .padding(50)

                if colorScheme == .dark {
                    LottieView(name: "DarkMode")
                        .frame(width: 260.0, height: 250.0)
                } else {
                    LottieView(name: "LightMode")
                        .frame(width: 260.0, height: 250.0)
                }
                Text("You will do daily challenges trying to reproduce reference images through drawings.")
                    .frame(maxWidth: 330, alignment: .leading)
                    .font(Font.custom("Comfortaa-Regular", size: 24))
                    .multilineTextAlignment(.center)
                    .padding(50)
            }.ignoresSafeArea()
        }.ignoresSafeArea()
    }
}

struct SecondPage_Previews: PreviewProvider {
    static var previews: some View {
        SecondPage()
    }
}
