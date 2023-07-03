//
//  CartQuantityButtonView.swift
//  EatMe
//
//  Created by Юрий Альт on 01.07.2023.
//

import SwiftUI

struct CartQuantityButtonView: View {
    let minusAction: () -> ()
    let plusAction: () -> ()
    let quantity: Int
    
    var body: some View {
        ZStack {
            Color(.EATME.Gray)
            HStack {
                Button(action: minusAction) {
                    Image("minus")
                        .frame(width: 24.dhs, height: 24.dhs)
                }
                .padding(.leading, 6.dhs)
                Spacer()
                Text("\(quantity)")
                    .font(.SFProDisplay.Medium.size(of: 14))
                Spacer()
                Button(action: plusAction) {
                    Image("plus")
                        .frame(width: 24.dhs, height: 24.dhs)
                }
                .padding(.trailing, 6.dhs)
            }
        }
        .frame(width: 99.dhs, height: 32.dvs)
        .cornerRadius(10.dhs)
    }
}

struct CartQuantityButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartQuantityButtonView(minusAction: {}, plusAction: {}, quantity: 10)
    }
}
