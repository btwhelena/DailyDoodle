//
//  OnboardingFirst.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 18/02/23.
//

import SwiftUI

struct OnboardingView: View {

    @StateObject var lnManager = LocalNotificationManager()


    var body: some View {
            TabView {
                FirstPage()
                SecondPage()
                ThirdPage()
                    .environmentObject(lnManager)
            }
            .tabViewStyle(PageTabViewStyle())
            .ignoresSafeArea()
            .onAppear {
                setupAppearancce()
            }
    }

    func setupAppearancce() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "CTA")
        UIPageControl.appearance().pageIndicatorTintColor = .gray
    }
}

