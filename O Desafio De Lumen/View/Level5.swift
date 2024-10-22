//
//
//  ContentView.swift
//  O Desafio De Lumen
//
//  Created by Italo Guilherme Monte on 22/10/24.
//

import SwiftUI
import Combine


struct Level5: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var password: String = ""
    let corret: String = "1054"
    @State private var isKeyboardActive = false
    @State private var keyboardPublisher: AnyCancellable? = nil
    
    var body: some View {
            ZStack {
                Color.purpleCustom
                    .ignoresSafeArea()
                HStack (alignment: .top){
                    VStack (alignment: .leading){
                        
                        Text("Eu sou o lugar onde o calor me abraça, e o brilho do dia nunca passa. Minhas horas douradas fazem tudo brilhar, quem gosta de sol vem me procurar. Quem sou eu?")
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
                            
                        
                        HStack{
                            Spacer()
                            NavigationLink(destination: Level6()) {
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
                }
                VStack{
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
                if value.translation.width > 50 { //verificação do tamanho do gesto
                    presentationMode.wrappedValue.dismiss() //volta para a view anterior
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
    GameView()
}
