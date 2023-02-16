//
//  UndoAndRedoButtons.swift
//  DailyDoodle
//
//  Created by Lais Godinho on 15/02/23.
//

import SwiftUI

struct UndoAndRedoButtons: View {
    @Environment(\.undoManager) private var undoManager
    var body: some View {

        HStack {
            Button(action: {
                undoManager?.undo()
            }, label: {
                Image(systemName: "arrow.uturn.backward.circle")
            })
            Button(action: {
                undoManager?.redo()
            }, label: {
                Image(systemName: "arrow.uturn.forward.circle")
            })
        }
    }
}

struct UndoAndRedoButtons_Previews: PreviewProvider {
    static var previews: some View {
        UndoAndRedoButtons()
    }
}
