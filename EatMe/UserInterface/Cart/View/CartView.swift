//
//  CartView.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = CartViewModel()
    var body: some View {
        VStack {
            NavigationBarWithGeoView()
            MainCartGrid(viewModel: viewModel)
            Spacer()
            BlueButtonView(title: "Оплатить \(viewModel.finalSum)₽", action: {})
                .padding(.bottom, 104.dvs)
                .padding(.horizontal, 16.dhs)
        }
        .onAppear {
            viewModel.getDishes()
            viewModel.getFinalSum()
        }
        .ignoresSafeArea()
    }
}


struct MainCartGrid: View {
    @ObservedObject var viewModel: CartViewModel
    private let columns = [GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(viewModel.dishes, id: \.id) { dish in
                    CartDishCellView(dish: dish, quantity: viewModel.getQuantity(id: dish.id), minusAction: {viewModel.quantityMinus(id: dish.id)}, plusAction: {viewModel.quantityPlus(id: dish.id)})
                }
            }
        }
        .padding(.horizontal, 16.dhs)
    }
}



//MARK: - Preview
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
