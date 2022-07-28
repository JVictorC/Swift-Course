//
//  ContentView.swift
//  VictorCard
//
//  Created by Joao Victor on 21/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52).ignoresSafeArea()
            VStack {
                
                Image("Victor")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(.white, lineWidth: 5)
                    )
                
                Text("João Victor")
                    .font(.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                
                
                Text("Mobile Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                
                Divider()
                
                
                InfoView(
                    title: "+55 11 97613-0280",
                    imageName:"phone.fill"
                )
                
                InfoView(
                    title: "joaogmavictor@gmail.com",
                    imageName: "envelope.fill"
                )
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

