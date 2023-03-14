//
//  buttonView.swift
//  casinoRoulette
//
//  Created by qiuye on 2023/3/13.
//

import SwiftUI

struct GameButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(.yellow)
            .clipShape(Circle())
            .font(.system(size: 25))
            .foregroundColor(.black)
            .shadow(radius: 3.0, x: 6, y: 6)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}
struct GameButton: View {
    var fun: () -> Void
    var buttonName: String
    init(name: String, fun: @escaping () -> Void) {
        self.fun = fun
        self.buttonName = name
    }
    var body: some View {
        Button(action: {
            fun()
        }){
            Image(systemName: "\(buttonName)")
        }.buttonStyle(GameButtonStyle())
    }
}

struct buttonView: View {
    @EnvironmentObject var data: UserData
    @State var start: Bool = false
    var body: some View {
        HStack{
            GameButton(name: "trash.fill", fun: {
                data.betK = 0
                data.chipsInfo = []
            })
            GameButton(name: "goforward", fun: {
                data.betK = data.lastBetK
                data.chipsInfo = data.lastChipsInfo
                while(data.betK>data.totalK){
                    data.betK -= data.chipsInfo.last!.type.value
                    data.chipsInfo.removeLast()
                }
            })
            GameButton(name: "return", fun: {
                if(data.chipsInfo.count>0){
                    data.betK -= data.chipsInfo.last!.type.value
                    data.chipsInfo.removeLast()
                }
            })
            GameButton(name: "play.fill", fun: {
                if(data.chipsInfo.count>0){
                    data.isSpinning = true
                    start.toggle()
                }
            })
            .fullScreenCover(isPresented: $start) {
                rouletteView()
            }
        }
    }
}

struct buutonview_Previews: PreviewProvider {
    @StateObject var data = UserData()
    static var previews: some View {
        buttonView()
    }
}
