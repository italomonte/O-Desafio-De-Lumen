//
//  ContentView.swift
//  O Desafio De Lumen
//
//  Created by Italo Guilherme Monte on 22/10/24.
//

import SwiftUI

struct GameView: View {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            ZStack {
                Color.purpleCustom
                    .ignoresSafeArea()
                HStack (alignment: .top){
                    VStack{
                        
                        Text("Uma vez em cada ano, Lumen, o misterioso gato branco surge na Apple developer academy. Reza a lenda que Lumen comanda várias outras entidades, como pássaros, coelhos e cavalos. O gato branco surge uma vez a cada ano com o objetivo de conceder um desejo àquele que resolver todos os seus enigmas. Seus olhos brilham com enigmas não resolvidos. Quem for corajoso o bastante para encarar suas charadas pode ganhar um desejo. Mas cuidado: falhe, e nunca mais verá o gato mágico.")
                            .font(.custom("AmaticSC-Bold", size: 28, relativeTo: .title))
                            .foregroundColor(.white)
                            .padding()
                            .padding(.bottom)
                            .padding(.bottom)
                        
                        NavigationLink(destination: Level1()) {
                            Text("Começar")
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                                .background(.darkOrangeCustom)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                                .font(.headline)
                                .foregroundColor(.white)
//                                .padding(.top)
                                .padding(.top)
                                .padding(.top)
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
                    
                }
                .navigationBarBackButtonHidden(true)
            }
            .gesture(DragGesture().onChanged { value in
                if value.translation.width > 50 { //verificação do tamanho do gesto
                    presentationMode.wrappedValue.dismiss() //volta para a view anterior
                }
            })
    }
}

#Preview {
    GameView()
}
