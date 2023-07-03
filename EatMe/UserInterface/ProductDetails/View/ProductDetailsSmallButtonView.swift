//
//  ProductDetailsSmallButtonView.swift
//  EatMe
//
//  Created by Юрий Альт on 01.07.2023.
//

import SwiftUI

enum ProductDetailsSmallButtonType: String {
    case like
    case close
}

struct ProductDetailsSmallButtonView: View {
    let action: () -> ()
    let type: ProductDetailsSmallButtonType
    let isLiked: Bool
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Color(.EATME.White)
                Image(type == .close ? "close" : (isLiked ? "like" : "like"))
            }
            .frame(width: 40.dhs, height: 40.dhs)
            .cornerRadius(8.dhs)
        }
    }
}

struct ProductDetailsSmallButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.yellow)
            ProductDetailsSmallButtonView(action: {}, type: .like, isLiked: false)
        }
    }
}
