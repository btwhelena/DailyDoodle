//
//  OnboardingFirst.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 18/02/23.
//

import SwiftUI
import Lottie

struct OnboardingView: View {

    @StateObject var lnManager = LocalNotificationManager()


    var body: some View {
            TabView {
                FirstPage()
                SecondPage()
                ThirdPage()
                    .environmentObject(lnManager)
            }
            .ignoresSafeArea()
            .tabViewStyle(PageTabViewStyle())
    }
}

