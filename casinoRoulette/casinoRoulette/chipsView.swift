//
//  chipsView.swift
//  casinoRoulette
//
//  Created by qiuye on 2023/3/13.
//

import SwiftUI

struct ChipView: View {
    @EnvironmentObject var data: UserData
    var type: Chip
    init(type: Chip) {
        self.type = type
    }
    var body: some View {
        ZStack {
            Image("\(type.imageName)")
                .resizable()
                .frame(width: 70 , height: 70 )
                .shadow(radius: 3.0, x: 6, y: 6)
                .if(data.selectedChip == type){ view in
                    view.border(.red, width: 2)
                        .scaleEffect(1.2)
                }
                .onTapGesture {
                    data.selectedChip = type
                }
            Text("\(type.value)K")
                .font(.system(size: 14, design: .rounded))
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
        
    }
}

struct BoardChip: View {

    var type: Chip, x: CGFloat=0, y: CGFloat=0, rotate: Bool
    init(type: Chip, rotate: Bool, x: CGFloat, y: CGFloat) {
        self.type = type
        self.rotate = rotate
        self.x = x
        self.y = y
    }

    var body: some View {
        Image("\(type.imageName)")
            .resizable()
            .frame(width: 30, height: 30)
            .shadow(radius: 3.0, x: 6, y: 6)
            .offset(x:x, y:y)
    }
}

struct chipsView: View {
    var body: some View {
        VStack{
            ChipView(type: Chip.onek)
            ChipView(type: Chip.fivek)
            ChipView(type: Chip.tenk)
            ChipView(type: Chip.fiftyk)
            ChipView(type: Chip.hundredk)
        }
    }
}

