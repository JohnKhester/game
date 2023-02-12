//
//  ContentView.swift
//  BrazenGames
//
//  Created by Andrey on 12.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showNextScreen = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Brazen Game!")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                Button(action: {
                    showNextScreen = true
                }, label: {
                    Text("High Low")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .padding()

                Spacer()
            }
           // .navigationTitle("Main Screen")
            .fullScreenCover(isPresented: $showNextScreen, content: {
                HighLow()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
