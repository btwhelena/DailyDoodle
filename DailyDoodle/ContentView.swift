//
//  ContentView.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 13/02/23.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State var isActive = false
    @State var sheetNotification = false
    @StateObject var lnManager = LocalNotificationManager()

    var body: some View {
        NavigationStack {
            ZStack{
                Color("Background")
                VStack {
                    Elements()
                    Spacer(minLength: 32)
                    HStack{
                        Text("Today's Challenge")
                            .frame(maxWidth: 360, alignment: .leading)
                            .font(.system(.title, design: .rounded))
                            .multilineTextAlignment(.leading)
                        Button {
                            sheetNotification.toggle()
                        } label: {
                            Image(systemName: "bell.and.waves.left.and.right.fill")
                                .sheet(isPresented: $sheetNotification) {
                                    NotificationView( sheetNotification: $sheetNotification)
                                        .environmentObject(self.lnManager)
                                        .presentationDetents([.medium])
                                        .presentationDragIndicator(.visible)
            
                                }
                                .accessibilityLabel("Notification Settings")
                        }

                    }
                    .frame(maxWidth: 360)

                    NavigationLink(destination:
                                    DailyChallengeView()
                                   , isActive: $isActive) {
                        Button {
                            isActive.toggle()

                        } label: {
                            Image(decorative: "CHALLENGE-\(DateHelper.getCurrentDay())")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 360, height: 200)
                                .cornerRadius(15)
                                .clipShape(Rectangle())
                                .overlay(
                                    Rectangle()
                                        .fill(Color("Background")).opacity(0.5)
                                        .frame(width: 360, height: 50)
                                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                                        .padding(.top, 150)
                                        .overlay(alignment: .bottomTrailing) {
                                            HStack {
                                                Text("Start Challenge")
                                                    .font(.system(.title2, design: .rounded))
                                                    .foregroundColor(Color("Text"))

                                                Image(systemName: "chevron.right.circle")
                                                    .foregroundColor(Color("Text"))
                                                    .font(.headline)
                                            } .padding(.trailing, 10)
                                                .padding(.bottom, 5)
                                        }
                                )
                                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 3)
                        }
                    }
                    .accessibilityLabel("Start Challenge")
                    Spacer(minLength: 32)
                    VStack {
                    Text("Your drawings")
                            .frame(maxWidth: 360, alignment: .leading)
                            .font(.system(.title, design: .rounded))
                            .multilineTextAlignment(.leading)
                            .padding(20)
                        GalleryPreviews()
                            .frame(maxWidth: 360, alignment: .leading)
                    }


                }

            }
            .ignoresSafeArea()
        }
    }

}




