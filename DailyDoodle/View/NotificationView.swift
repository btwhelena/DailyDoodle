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
                            try? await lnManager.requestNotification()
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: scheduleDate)
                            let notification = LocalNotification(identifier: UUID().uuidString, title: "Daily Doodle", body: "It's time to draw some doodles!", dateComponents: dateComponents, repeats: true)
                            try? await lnManager.schedule(localNotification: notification)

                        } else {
                            lnManager.deleteAllPendingNotifications()
                        }
                    }
                    self.sheetNotification = false

                }
                .buttonStyle(.borderedProminent)


            }
            .padding(.bottom, 50)

            Toggle("Apresentar as notificações", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: Color("CTA")))
                .font(Font.custom("Comfortaa-Regular", size: 18))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)


            DatePicker("Pick your favorite time to draw", selection: $scheduleDate, displayedComponents: .hourAndMinute)
                .font(Font.custom("Comfortaa-Regular", size: 18))
                .foregroundColor(.black)
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
    }
}

