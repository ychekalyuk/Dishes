//
//  BlueButtonView.swift
//  EatMe
//
//  Created by Юрий Альт on 29.06.2023.
//

import SwiftUI

struct BlueButtonView: View {
    let title: String
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Color(uiColor: .EATME.Blue)
                Text(title)
                    .font(.SFProDisplay.Medium.size(of: 16.dfs))
                    .foregroundColor(Color(.EATME.White))
            }
            .frame(height: 48.dvs)
            .cornerRadius(10.dhs)
            
        }
    }
}

struct BlueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BlueButtonView(title: "Добавить в корзину", action: {})
    }
}
