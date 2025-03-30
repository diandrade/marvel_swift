//
//  ContentView.swift
//  Marvel_API
//
//  Created by iOSLab on 29/03/25.
//

//b8f4e830bb180f953e570a104ef2d1c3 (Public)
//9cbdc624d704f14a24c1f98f690c41700c300a95 (Private)

import SwiftUI

struct ContentView: View {
    let nomes = ["Gabriel", "Matheus", "Pedro", "Diego"]
    
    var body: some View {
        VStack {
            NavigationView
            { List(nomes, id: \.self) {
                nome in NavigationLink(destination: DescriptionView()) {
                    CharacterRow(nome: nome)
                }
            }
            .navigationTitle("Characters")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
