//
//  ThirdPage.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 18/02/23.
//

import SwiftUI

struct ThirdPage: View {
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding :Bool?
    @EnvironmentObject var lnManager : LocalNotificationManager
    @State private var scheduleDate = Date()

    var body: some View {
        ZStack{
            Color("Background")

            VStack {
                Image("TopCircles")
                    .resizable().scaledToFit()
                    .frame(width: 450, height: 200)


                Text("Cronograma")
                    .frame(maxWidth: 330, alignment: .leading)
                    .font(Font.custom("Comfortaa-Bold", size: 48))
                    .multilineTextAlignment(.leading)
                Text("Escolha seu horário favorito para desenhar")
                    .frame(maxWidth: 330, alignment: .leading)
                    .font(Font.custom("Comfortaa-Regular", size: 24))
                    .multilineTextAlignment(.leading)

                DatePicker("", selection: $scheduleDate, displayedComponents: .hourAndMinute)
                    .multilineTextAlignment(.center)
                    .labelsHidden()
                    .padding(.bottom, 50)
                    .datePickerStyle(WheelDatePickerStyle())

                Button {
                    shouldShowOnboarding = false
                    Task{
                        try? await lnManager.requestNotification()
                        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: scheduleDate)
                        // let notification = LocalNotification(identifier: UUID().uuidString, title: "Daily Doodle", body: "It's time to draw some doodles!", dateComponents: dateComponents, repeats: true)
                        // try? await lnManager.schedule(localNotification: notification)
                    }
                } label: {
                    ZStack{
                        Rectangle()
                            .cornerRadius(30.0)
                            .foregroundColor(Color("CTA"))
                            .frame(width: 153.0, height: 44.0, alignment: .center)
                        Text("Iniciar")
                            .foregroundColor(Color.white)
                            .font(Font.custom("Comfortaa-Regular", size: 24))
                    }
                }

            }.ignoresSafeArea()

        }.ignoresSafeArea()

    }
}


