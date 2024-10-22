//
//  ContentView.swift
//  O Desafio De Lumen
//
//  Created by Italo Guilherme Monte on 22/10/24.
//

import SwiftUI

struct Final: View {
    
    
    var body: some View {
        
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
            
            
            
            
            VStack{
                Text("O Desafio De Lumen")
                    .font(.custom("AmaticSC-Bold", size: 36, relativeTo: .title))
                    .foregroundStyle(.white)
                    .shadow(radius: 10, x: 0, y: 10)
                    .padding()
                
                Text("Você descobriu todas as charadas! Faça um desejo e eu lhe concederei.")
                    .font(.custom("AmaticSC-Regular", size: 36, relativeTo: .title))
                    .foregroundStyle(.white)
                    .shadow(radius: 10, x: 0, y: 10)
                    .padding()
                
                Image(.gato2)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                NavigationLink(destination: MenuView()) {
                    Text("Voltar")
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
        
    }
}


#Preview {
    Final()
}
