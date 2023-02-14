//
//  ContentView.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 13/02/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    DrawView()
                        .toolbar {
                            // 1
                            ToolbarItem(placement: .principal) {

                                HStack {
                                    Button(action: {}, label: {
                                        Image(systemName: "arrow.uturn.backward.circle")
                                    })
                                    Button(action: {}, label: {
                                        Image(systemName: "arrow.uturn.forward.circle")
                                    })
                                }

                            }

                            ToolbarItem(placement: .navigationBarTrailing) {

                                HStack {
                                    Button(action: {}, label: {
                                        Image(systemName: "square.and.arrow.up")
                                    })
                                    Button(action: {}, label: {
                                        Image(systemName: "checkmark.circle.fill")
                                    })
                                }

                            }
                        }
                } label: {
                    Label("Work Folder", systemImage: "folder")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
