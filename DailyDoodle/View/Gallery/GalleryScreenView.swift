//
//  ContentView.swift
//  DailyDoodle
//
//  Created by Helena Oliveira on 13/02/23.
//

import SwiftUI
import PopupView

struct Card: Identifiable {
    let id = UUID()
    let title: String
}

struct CardView: View {
    let draw : Drawing
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var canvasView = PKCanvasRepresentation()
    @State var drawVM = DrawViewModel()
    @State var showingPopup = false
    @Environment(\.dismiss) var dismiss
    
    
    
    var body: some View {
        
        VStack {
            if(draw.imagJPEG != nil) {
                NavigationLink {
                    FullScreenModalView(image: (draw.imagJPEG ?? UIImage(named: "blank-canva-light")!))
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                HStack{
                                    Button {
                                        share()
                                    } label: {
                                        Image(systemName: "square.and.arrow.up")
                                    }
                                    
                                    Button {
                                        showingPopup.toggle()
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                                .alert("Delete drawing?", isPresented: $showingPopup) {
                                    HStack {
                                        Button("Cancel", role: .cancel) {
                                            showingPopup = false
                                        }
                                        
                                        Button("Delete", role: .destructive) {
                                            drawVM.delete(draw: draw)
                                            showingPopup = false
                                        }
                                    }
                                    
                                }
                                
                            }
                        }
                        .background(Color("Background"))
                    
                    //                }
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("Background"))
                            .frame(width: UIScreen.main.bounds.width/3.2)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 3)
                        Image(uiImage: draw.imagJPEG!)
                            .resizable()
                        //                    .foregroundColor(.accentColor)
                            .cornerRadius(12)
                            .frame(width: UIScreen.main.bounds.width/3.2)
                        
                    }
                    .padding(4)
                    
                }.accessibilityLabel("Your drawing")
            }
        }
    }
    
    func share() {
        guard let image = draw.imagJPEG else { return }
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct GalleryScreenView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Drawing.date, ascending: false)])
    var draws: FetchedResults<Drawing>
    let challenge: String
    
    var body: some View {
        DrawsView(results: draws, challenge: challenge)
            .navigationTitle(challenge.capitalized)
    }
}

struct DrawsView<Results:RandomAccessCollection>: View where Results.Element == Drawing {
    
    let results: Results
    let challenge: String
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 160))
    ]
    
    let height: CGFloat = 198
    
    var body: some View {
        
        let drawsFiltered = results.filter { $0.challenge!.contains(challenge) }
        let drawingsTemp = drawsFiltered
        
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 16) {
                ForEach(drawingsTemp, id: \.self) { draw in
                    if draw.imagJPEG != nil {
                        CardView(draw: draw)
                            .frame(height: height)
                    }
                }
            }
            .padding()
            
            
        }.background(Color("Background"))
    }
}

