//
//  FullPictureView.swift
//  DailyDoodle
//
//  Created by Lais Godinho on 14/02/23.
//

import SwiftUI

struct FullPictureView: View {
  var image: UIImage
  var body: some View {
    ZoomableScrollView {
        Image(uiImage: image)
        .resizable()
        .scaledToFit()
    }
  }
}
