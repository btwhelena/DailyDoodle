import SwiftUI
import PencilKit

struct ContentView: View {
    @State var canvasView = PKCanvasRepresentation()
    @State var isActive = false

    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").ignoresSafeArea()
                VStack {
                    Elements()
                    Text("Desafio de Hoje")
                        .frame(maxWidth: 330, alignment: .leading)
                    // .offset(x: -50)
                        .font(Font.custom("Comfortaa-Bold", size: 28))
                        .multilineTextAlignment(.leading)
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
                                    Button(action: canvasView.finishChallenge, label: {
                                        Image(systemName: "checkmark.circle.fill")
                                    })
                                }

                            }
                        }
                                   , isActive: $isActive) {
                        Button {
                            isActive.toggle()

                        } label: {
                            Image("caxorro")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 330, height: 200)
                                .cornerRadius(15)
                                .clipShape(Rectangle())
                                .overlay(
                                    Rectangle()
                                        .fill(.white).opacity(0.8)
                                        .frame(width: 330, height: 50)
                                        .cornerRadius(15)
                                        .padding(.top, 150)
                                        .overlay(alignment: .bottomTrailing) {
                                            HStack {
                                                Text("Iniciar desafio")
                                                    .font(Font.custom("Comfortaa-Bold", size: 24))
                                                    .foregroundColor(.black)

                                                Image(systemName: "chevron.right.circle")
                                                    .foregroundColor(.black)
                                                    .font(.title)
                                            } .padding(.trailing, 10)
                                                .padding(.bottom, 5)
                                        }
                                )
                        }
                    }
                    Text("Galeria")
                        .frame(maxWidth: 330, alignment: .leading)
                    // .offset(x: -110)
                        .font(Font.custom("Comfortaa-Bold", size: 28))
                        .multilineTextAlignment(.leading)
                    GalleryPreviews().frame(maxWidth: 330, alignment: .leading)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
