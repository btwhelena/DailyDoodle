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

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animation = LottieAnimationView(name: name)
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop

        animation.play()

        animation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animation)

        NSLayoutConstraint.activate([
            animation.heightAnchor.constraint(equalTo: view.heightAnchor),
            animation.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}
