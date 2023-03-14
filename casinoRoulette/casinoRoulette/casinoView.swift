//
//  ContentView.swift
//  casinoRoulette
//
//  Created by qiuye on 2023/3/12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = UserData()
    var body: some View {
        ZStack {
            backgroundView()
            boardView()
                .offset(x:50, y: 20)
            chipsView()
                .offset(x:-150, y:100)
            buttonView()
                .offset(x:40, y:380)
        }
        .padding()
        .environmentObject(data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
