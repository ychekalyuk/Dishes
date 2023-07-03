//
//  CartDishCellView.swift
//  EatMe
//
//  Created by Юрий Альт on 01.07.2023.
//

import SwiftUI
import Kingfisher

struct CartDishCellView: View {
    let dish: Dish
    
    let quantity: Int
    let minusAction: () -> ()
    let plusAction: () -> ()
    
    var body: some View {
        HStack {
            ZStack {
                Color(.EATME.LightGray)
                    .frame(width: 62.dhs, height: 62.dhs)
                    .cornerRadius(6.dhs)
                KFImage(URL(string: dish.imageURL))
                    .resizable()
                .frame(width: 48.dhs, height: 48.dhs)
            }
            
            
            VStack(spacing: 4.dvs) {
                HStack {
                    Text(dish.name)
                        .font(Font.SFProDisplay.Regular.size(of: 14.dfs))
                    Spacer()
                }
                HStack {
                    Text("\(dish.price) ₽")
                        .font(Font.SFProDisplay.Regular.size(of: 14.dfs))
                    Text("· \(dish.weight)г")
                        .font(Font.SFProDisplay.Regular.size(of: 14.dfs))
                        .foregroundColor(Color(.EATME.Black.withAlphaComponent(0.4)))
                    Spacer()
                }
            }
            .padding(.leading, 8.dhs)
            
            CartQuantityButtonView(minusAction: minusAction, plusAction: plusAction, quantity: quantity)
        }
    }
}
