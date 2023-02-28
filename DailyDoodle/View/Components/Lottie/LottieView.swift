//
//  LottieView.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 27/02/23.
//

import SwiftUI
import UIKit
import Lottie

struct LottieView: UIViewRepresentable {

    var name: String
    var loopMode: LottieLoopMode = .loop
    let animationView = LottieAnimationView()
    @Binding var isPaused: Bool


    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

//        let animationView = LottieAnimationView(name: name)
        let animation = LottieAnimation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode

//        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        if(isPaused) {
            context.coordinator.parent.animationView.play(fromFrame: 60, toFrame: 60)
        } else {
            context.coordinator.parent.animationView.stop()
            context.coordinator.parent.animationView.play()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: LottieView

        init(_ parent: LottieView) {
            self.parent = parent
        }
    }
}
