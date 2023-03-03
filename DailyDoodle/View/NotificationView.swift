//
//  NotificationView.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 28/02/23.
//

import SwiftUI
import UserNotifications

struct NotificationView: View {
    @State var isOn: Bool = true
    @EnvironmentObject var lnManager : LocalNotificationManager
    @State private var scheduleDate = Date()
    @Binding var sheetNotification: Bool

    var body: some View {
        VStack(alignment: .trailing){
            HStack {

                Button("Cancel") {
                    self.sheetNotification = false
                }
                .buttonStyle(.plain)

                Spacer()

                Button("Save") {

                    Task {
                        if isOn {
                            await lnManager.scheduleNotification(scheduleDate: scheduleDate)

                        } else {
                            lnManager.deleteAllPendingNotifications()
                        }
                    }
                    self.sheetNotification = false

                }
                .buttonStyle(.borderedProminent)


            }
            .padding(.bottom, 50)

            Toggle("Enable notifications", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: Color("CTA")))
                .font(.system(size: 18, design: .rounded))
                .foregroundColor(Color("Text"))
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)


            DatePicker("Pick your favorite time to draw", selection: $scheduleDate, displayedComponents: .hourAndMinute)
                .font(.system(size: 18, design: .rounded))
                .foregroundColor(Color("Text"))
                .multilineTextAlignment(.leading)
                .onAppear {
                    guard let date = Calendar.current.date(bySettingHour: 20, minute: 30, second: 0, of: Date()) else {
                        return
                    }
                    scheduleDate = date
                }
            Spacer()
        }
        .padding(20)
        .background(Color("Background"))
    }
}

