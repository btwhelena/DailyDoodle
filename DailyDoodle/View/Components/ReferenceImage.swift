//
//  ReferenceImage.swift
//  DailyDoodle
//
//  Created by Lais Godinho on 14/02/23.
//

import SwiftUI

struct ReferenceImage: View {
    var width: CGFloat = 160
    var height: CGFloat = 160

    @State var image: UIImage? = UIImage(named: "CHALLENGE-\(DateHelper.getCurrentDay())")!

    var body: some View {
        if let image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height, alignment: .center)
                .clipShape(Circle())
                .accessibilityLabel("Reference Image")
        } else {
            Text("Loading Image")
                .task {
                    DispatchQueue.main.async {
                        image = UIImage(named: "CHALLENGE-1")!
                    }
                }
        }
    }
}

struct ReferenceImage_Previews: PreviewProvider {
    static var previews: some View {
        ReferenceImage()
    }
}
