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
        NavigationView {
            ZStack{
                Color("Background")
                VStack {
                    Elements()
                    Spacer(minLength: 32)
                    HStack{
                        Text("Today's Challenge")
                            .frame(maxWidth: 330, alignment: .leading)
                            .font(Font.custom("Comfortaa-Bold", size: 24))
                            .multilineTextAlignment(.leading)
                        Button {
                            self.sheetNotification = true
                        } label: {
                            Image(systemName: "bell.and.waves.left.and.right.fill")
                                .sheet(isPresented: $sheetNotification) {
                                    NotificationView( sheetNotification: $sheetNotification)
                                        .environmentObject(self.lnManager)
                                        .presentationDetents([.medium])
                                        .presentationDragIndicator(.visible)
            
                                }
                        }

                    }
                    .frame(maxWidth: 330)

                    NavigationLink(destination:
                                    DailyChallengeView()
                                   , isActive: $isActive) {
                        Button {
                            isActive.toggle()

                        } label: {
                            Image(decorative: "CHALLENGE-\(DateHelper.getCurrentDay())")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 330, height: 200)
                                .cornerRadius(15)
                                .clipShape(Rectangle())
                                .overlay(
                                    Rectangle()
                                        .fill(Color("Background")).opacity(0.5)
                                        .frame(width: 330, height: 50)
                                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                                        .padding(.top, 150)
                                        .overlay(alignment: .bottomTrailing) {
                                            HStack {
                                                Text("Start Challenge")
                                                    .font(Font.custom("Comfortaa-Bold", size: 24))
                                                    .foregroundColor(Color("Text"))

                                                Image(systemName: "chevron.right.circle")
                                                    .foregroundColor(Color("Text"))
                                                    .font(.title)
                                            } .padding(.trailing, 10)
                                                .padding(.bottom, 5)
                                        }
                                )
                        }
                    }
                    .accessibilityLabel("Start Challenge")
                    Spacer(minLength: 32)
                    VStack {
                        Text("Gallery")
                            .frame(maxWidth: 330, alignment: .leading)
                            .font(Font.custom("Comfortaa-Bold", size: 24))
                            .multilineTextAlignment(.leading)
                            .padding(20)
                        GalleryPreviews().frame(maxWidth: 330, alignment: .leading)
                    }
                }
//                .padding(20)

            }
            .ignoresSafeArea()
        }
    }

}




