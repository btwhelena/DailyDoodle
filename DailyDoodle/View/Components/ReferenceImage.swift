//
//  ReferenceImage.swift
//  DailyDoodle
//
//  Created by Lais Godinho on 14/02/23.
//

import SwiftUI

struct ReferenceImage: View {
    var width: CGFloat = 240
    var height: CGFloat = 160

    @State var image: UIImage? = UIImage(named: "CHALLENGE-1")!

    var body: some View {
        if let image {
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(14.0)
                .frame(width: width, height: height, alignment: .center)
//                .clipShape(Circle())
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
