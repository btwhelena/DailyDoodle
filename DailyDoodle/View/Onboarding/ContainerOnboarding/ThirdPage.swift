//
//  ThirdPage.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 18/02/23.
//

import SwiftUI
import UserNotifications

struct ThirdPage: View {
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding :Bool?
    @EnvironmentObject var lnManager : LocalNotificationManager
    @State private var scheduleDate = Date()

    var body: some View {
        ZStack(alignment: .top) {
            Color("Background")

            VStack {
                Image("TopCircles")
                    .resizable().scaledToFit()
                    .frame(width: 450, height: 200)


                Text("Notifications")
                    .frame(maxWidth: 330, alignment: .leading)
                    .font(.system(size: 48, design: .rounded))
                    .multilineTextAlignment(.leading)
                Text("Pick your favorite time to draw")
                    .frame(maxWidth: 330, alignment: .leading)
                    .font(.system(size: 24, design: .rounded))
                    .multilineTextAlignment(.leading)

                DatePicker("", selection: $scheduleDate, displayedComponents: .hourAndMinute)
                    .multilineTextAlignment(.center)
                    .labelsHidden()
                    .padding(.bottom, 50)
                    .datePickerStyle(WheelDatePickerStyle())
                    .onAppear {
                        guard let date = Calendar.current.date(bySettingHour: 20, minute: 30, second: 0, of: Date()) else {
                            return
                        }
                        scheduleDate = date
                    }

                Button {
                    shouldShowOnboarding = false
                    Task{
                        await lnManager.scheduleNotification(scheduleDate: scheduleDate)
                    }
                } label: {
                    ZStack{
                        Rectangle()
                            .cornerRadius(30.0)
                            .foregroundColor(Color("CTA"))
                            .frame(width: 180.0, height: 44.0, alignment: .center)
                        Text("Start Now")
                            .foregroundColor(Color.white)
                            .font(.system(size: 24, design: .rounded))
                    }
                }

            }


        }
        .ignoresSafeArea()

    }
}


