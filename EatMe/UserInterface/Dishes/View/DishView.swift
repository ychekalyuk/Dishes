//
//  DishView.swift
//  EatMe
//
//  Created by Юрий Альт on 28.06.2023.
//

import SwiftUI

struct DishView: View {
    @StateObject private var viewModel = DishViewModel()
    @State private var isShowDetails = false
    @State private var selectedDish = Dish.emptyDish()
    @Environment(\.presentationMode) var presentationMode
    let title: String
    
    var body: some View {
        ZStack {
            VStack {
                NavigationBarView(title: title,
                                  backButtonAction: { presentationMode.wrappedValue.dismiss() })
                FilterGrid(viewModel: viewModel)
                    .padding(.horizontal, 16.dhs)
                DishesGridView(viewModel: viewModel,
                               selectedDish: $selectedDish,
                               isShowDetails: $isShowDetails)
                    .padding(.horizontal, 16.dhs)
                    .padding(.bottom, 88.dvs)
                Spacer()
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            ProductDetailsView(isShowDetails: $isShowDetails,
                               likeAction: { viewModel.setFavoriteStatus(id: selectedDish.id) },
                               addInCartAction: { viewModel.addDishInCart(dish: selectedDish) },
                               dish: selectedDish,
                               isLiked: viewModel.getFavoriteStatus(id: selectedDish.id))
                .opacity(isShowDetails ? 1 : 0)
                .animation(.easeInOut(duration: 0.2), value: isShowDetails)
        }
    }
}

//MARK: - Subviews
struct FilterGrid: View {
    @ObservedObject var viewModel: DishViewModel
    private let rows = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(viewModel.tags, id: \.self) { tag in
                    DishFilterElementView(viewModel: viewModel, title: tag)
                }
            }
        }
        .frame(height: 35.dhs)
    }
}

struct DishesGridView: View {
    @ObservedObject var viewModel: DishViewModel
    @Binding var selectedDish: Dish
    @Binding var isShowDetails: Bool
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.filteredDishes, id: \.id) { dish in
                    VStack {
                        DishCellView(name: dish.name, imageURL: dish.imageURL)
                            .onTapGesture {
                                selectedDish = dish
                                isShowDetails.toggle()
                            }
                        Spacer()
                            .frame(height: 30.dvs)
                    }
                }
            }
        }
    }
}

//MARK: - Preview
struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(title: "Азиатская кухня")
    }
}
