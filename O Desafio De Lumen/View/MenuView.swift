//
//  ContentView.swift
//  O Desafio De Lumen
//
//  Created by Italo Guilherme Monte on 22/10/24.
//

import SwiftUI

struct MenuView: View {
    
    @State private var fantasmaOffset = CGSize(width: 0, height: 0)
    @State private var caldeiraOffset = CGSize(width: -120, height: 70)
    @State private var caldeiraRotation: Double = 20
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.purpleCustom
                    .ignoresSafeArea()
                
                VStack{
                    Circle()
                        .fill(.purple)
                        .frame(width: 25)
                        .offset(CGSize(width: 100, height: -50))
                    Circle()
                        .fill(.purple)
                        .frame(width: 25)
                        .offset(CGSize(width: -200, height: -30))
                    Circle()
                        .fill(.purple)
                        .frame(width: 25)
                        .offset(CGSize(width: -100, height: -300))
                    
                    Circle()
                        .fill(.purple)
                        .frame(width: 25)
                        .offset(CGSize(width: 0, height: 200))
                    Circle()
                        .fill(.purple)
                        .frame(width: 25)
                        .offset(CGSize(width: 180, height: 30))
                    Circle()
                        .fill(.purple)
                        .frame(width: 25)
                        .offset(CGSize(width: 100, height: 300))
                }
                
                VStack {
                    Image("fantasma")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .padding(EdgeInsets(top: 0, leading: 250, bottom: 0, trailing: 0))
                        .offset(fantasmaOffset)
                        .animation(
                            Animation.easeInOut(duration: 3)
                                .repeatForever(autoreverses: true),
                            value: fantasmaOffset
                        )
                    
                    Spacer()
                    
                    Image("caldeira")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .offset(caldeiraOffset)
                        .rotationEffect(.degrees(caldeiraRotation))
                        .animation(
                            Animation.easeInOut(duration: 3)
                                .repeatForever(autoreverses: true),
                            value: caldeiraOffset
                        )
                        .animation(
                            Animation.easeInOut(duration: 3)
                                .repeatForever(autoreverses: true),
                            value: caldeiraRotation
                        )
                }
                .onAppear {
                    withAnimation {
                        fantasmaOffset = CGSize(width: 10, height: 10) // Pequena oscilação
                        caldeiraOffset = CGSize(width: -110, height: 80) // Pequena oscilação
                        caldeiraRotation = 30 // Rotação leve
                    }
                }
                    
                VStack{
                    Text("O Desafio De Lumen")
                        .font(.custom("AmaticSC-Bold", size: 36, relativeTo: .title))
                        .foregroundStyle(.white)
                        .shadow(radius: 10, x: 0, y: 10)
                        .padding()
                    
                    NavigationLink(destination: GameView()) {
                        Text("Jogar")
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(.darkOrangeCustom)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                            .bold()
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                    
                    
                }
            .navigationBarBackButtonHidden(true)

            }
        }
    }


#Preview {
    MenuView()
}
