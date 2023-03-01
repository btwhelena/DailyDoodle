//
//  PopUp.swift
//  DailyDoodle
//
//  Created by Ieda Xavier on 28/02/23.
//

import SwiftUI

public struct Popup<PopupContent>: ViewModifier where PopupContent: View {

    init(isPresented: Binding<Bool>,
         view: @escaping () -> PopupContent) {
        self._isPresented = isPresented
        self.view = view
    }

    /// Controls if the sheet should be presented or not
    @Binding var isPresented: Bool

    /// The content to present
    var view: () -> PopupContent
    
}

extension View {

    public func popup<PopupContent: View>(
        isPresented: Binding<Bool>,
        view: @escaping () -> PopupContent) -> some View {
        self.modifier(
            Popup(
                isPresented: isPresented,
                view: view)
        )
    }
}
