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
                    .font(.system(size: 48, design: .rounded))
                    .multilineTextAlignment(.leading)
                    .padding(50)

                LottieView(name: colorScheme == .dark ? "DarkMode" : "LightMode", isPaused: .constant(false))
                    .frame(width: 260.0, height: 250.0)

                Text("You will do daily challenges trying to reproduce reference images through drawings.")
                    .frame(maxWidth: 330, alignment: .center)
                    .font(.system(.title2, design: .rounded))
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
