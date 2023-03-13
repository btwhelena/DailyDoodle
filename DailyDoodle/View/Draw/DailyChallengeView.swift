//
//  DailyChallengeView.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 15/02/23.
//

import SwiftUI
import Lottie

struct DailyChallengeView: View {

    @State private var image = UIImage()
    @State private var showSheet = false
    @State var isActive = false
    @State var canvasView = PKCanvasRepresentation()
    @State var isPaused: Bool = true
    @Environment(\.colorScheme) var colorScheme
    //@ObservedObject var decoder = DecoderJSON()

    var body: some View {
            ZStack {
                Color("Background").ignoresSafeArea()

                Image(decorative: "Circles")
                    .resizable().scaledToFit()
                    .frame(maxHeight: .infinity, alignment: .bottom)

                VStack {

                    Text("Today's Challenge")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(.title, design: .rounded).weight(.bold))
                        .padding(.bottom, 15)
                        .multilineTextAlignment(.center)


                    Image("CHALLENGE-\(DateHelper.getCurrentDay())")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 220, height: 220)
                        .cornerRadius(15)
                        .clipShape(Rectangle())
                    //.accessibilityLabel(decoder.getTodaysImageDescription())


                    Text("Try drawing the reference image above or draw it on a paper and upload it to complete the challenge.")
                        .frame(maxWidth: 330, alignment: .center)
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                        .font(.system(.body, design: .rounded))
                        .multilineTextAlignment(.center)


                    NavigationLink(destination:
                                    DrawView(canvasView: $canvasView)
                        .toolbar {
                            // 1
                            ToolbarItem(placement: .principal) {
                                UndoAndRedoButtons()
                            }

                            ToolbarItem(placement: .navigationBarTrailing) {

                                HStack {
                                    Button(action: canvasView.shareDrawing, label: {
                                        Image(systemName: "square.and.arrow.up")
                                    })
                                    Button(
                                        action: {
                                            isPaused.toggle()
                                            canvasView.finishChallenge()
                                            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { time in
                                                NavigationUtil.popToRootView()
                                            }
                                        },
                                        label:
                                            {
                                                LottieView(name: colorScheme == .dark ? "confirm-dark" : "confirm", loopMode: .autoReverse, isPaused: $isPaused)
                                                    .frame(width: 40.0, height: 40.0)
                                                    .accessibilityLabel("Finish challenge")


                                    })
                                    .onTapGesture {
                                        let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                                            impactHeavy.impactOccurred()
                                    }
                                }

                            }
                        },
                                   isActive: $isActive
                    ) {
                        Button {
                            isActive.toggle()

                        } label: {

                            ZStack{
                                Rectangle()
                                    .fill(Color("CTA"))
                                    .frame(width: 250, height: 60)
                                    .cornerRadius(35)

                                Text("Start drawing")
                                    .font(.system(.headline, design: .rounded))
                                    .foregroundColor(.white)
                            }
                        }
                    }

                    Button {
                        showSheet.toggle()
                    } label: {

                        ZStack{
                            Rectangle()
                                .fill(Color("Background"))
                                .frame(width: 250, height: 60)
                                .cornerRadius(35)

                                .overlay(
                                    RoundedRectangle(cornerRadius: 35)
                                        .stroke(Color("CTA"), lineWidth: 2)
                                        .background(Rectangle().fill(Color("Background")))
                                        .cornerRadius(35)
                                    )

                            Text("Upload drawing")
                                .font(.system(.headline, design: .rounded))
                                .foregroundColor(Color("CTA"))
                        }
                        .sheet(isPresented: $showSheet) {
                            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                        }
                    }
                }
            }.ignoresSafeArea(.all)
    }
}

struct DailyChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        DailyChallengeView()
    }
}
