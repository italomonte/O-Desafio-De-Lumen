import SwiftUI
import Combine

struct Level1: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var password: String = ""
    let corret: String = "6908"
    @State private var isKeyboardActive = false
    @State private var keyboardPublisher: AnyCancellable? = nil // Declare it as a State variable to manage its lifecycle
    
    var body: some View {
        ZStack {
            Color.purpleCustom
                .ignoresSafeArea()
                        
            VStack(alignment: .leading) {
                
                Text("Onde o eco repousa e a escuridão é profunda, o caminho desce para onde segredos antigos dormem. Onde o chão é frio e nem a luz ousa entrar, encontrará o que procuras onde sombras começam a dançar.")
                    .font(.custom("AmaticSC-Bold", size: 28, relativeTo: .title))
                    .foregroundColor(.white)
                    .padding()
                
                Text("Insira a senha")
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                
                TextField("", text: $password)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .foregroundStyle(.black)
                
                HStack {
                    Spacer()
                    NavigationLink(destination: Level2()) {
                        Text("Próximo")
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(.darkOrangeCustom)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .disabled(password != corret)
                }
            }
            .padding()
            
            VStack {
                Spacer()
                Image(.gato1)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .offset(x: 130, y: 50)
                    .scaleEffect(x: -1, y: 1)
                    .opacity(isKeyboardActive ? 0 : 1)
            }
            .navigationBarBackButtonHidden(true)
        }
        .gesture(DragGesture().onChanged { value in
            if value.translation.width > 50 { // Verify gesture size
                presentationMode.wrappedValue.dismiss() // Go back to the previous view
            }
        })
        .onAppear {
            // Move keyboardPublisher declaration inside onAppear
            keyboardPublisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
                .merge(with: NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification))
                .sink { notification in
                    isKeyboardActive = (notification.name == UIResponder.keyboardWillShowNotification)
                }
        }
        .onDisappear {
            keyboardPublisher?.cancel()
            keyboardPublisher = nil // Clear reference when the view disappears
        }
    }
}

#Preview {
    Level1()
}
