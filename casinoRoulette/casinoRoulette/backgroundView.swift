//
//  backgroundView.swift
//  casinoRoulette
//
//  Created by qiuye on 2023/3/12.
//

import SwiftUI

struct backgroundView: View {
    @EnvironmentObject var data: UserData
    var body: some View {
        ZStack {
            Image("Roulette")
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 900)
            Image("table")
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 900)
                .offset(x:20, y:-40)
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.black)
                    .opacity(0.5)
                    .frame(width: 200, height: 125)
                Capsule()
                    .fill(.black)
                    .frame(width: 170, height: 40)
                    .offset(y:-30)
                Capsule()
                    .fill(.white)
                    .frame(width: 170, height: 40)
                    .offset(y:30)
                Text("B")
                    .foregroundColor(.white)
                    .frame(width: 150)
                    .font(.system(size: 34))
                    .background(.green)
                    .clipShape(Circle())
                    .offset(x:-70, y:30)
                Image(systemName:"dollarsign.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .offset(x:-70,y:-30)
                Text("\(data.totalK)K")
                    .foregroundColor(.yellow)
                    .font(.system(size: 30, design: .rounded))
                    .bold()
                    .frame(width: 300, alignment: .trailing)
                    .offset(x:-80,y:-30)
                Text("\(data.betK)K")
                    .foregroundColor(.red)
                    .font(.system(size: 30, design: .rounded))
                    .bold()
                    .frame(width: 300, alignment: .trailing)
                    .offset(x:-80,y:30)
                
                    
            }.offset(x:-80,y:-325)
        }
    }
}
