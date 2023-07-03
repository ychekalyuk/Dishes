//
//  TabBarView.swift
//  EatMe
//
//  Created by Юрий Альт on 30.06.2023.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Tab = .home

    enum Tab {
        case home
        case search
        case cart
        case account
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            CategoryView()
                .tabItem {
                    Image(selectedTab == .home ? "homeSelected" : "home")
                        .frame(width: 28, height: 28)
                    Text("Главная")
                        .foregroundColor(selectedTab == .home ? Color(.EATME.Blue) : Color(.EATME.DarkGray))
                        .font(.SFProDisplay.Medium.size(of: 14))
                }
                .tag(Tab.home)

            SearchView()
                .tabItem {
                    Image(selectedTab == .search ? "searchSelected" : "search")
                        .frame(width: 28, height: 28)
                    Text("Поиск")
                        .foregroundColor(selectedTab == .search ? Color(.EATME.Blue) : Color(.EATME.DarkGray))
                        .font(.SFProDisplay.Medium.size(of: 14))
                }
                .tag(Tab.search)

            CartView()
                .tabItem {
                    Image(selectedTab == .cart ? "cartSelected" : "cart")
                        .frame(width: 28, height: 28)
                    Text("Корзина")
                        .foregroundColor(selectedTab == .cart ? Color(.EATME.Blue) : Color(.EATME.DarkGray))
                        .font(.SFProDisplay.Medium.size(of: 14))
                }
                .tag(Tab.cart)
            
            AccountView()
                .tabItem {
                    Image(selectedTab == .account ? "accountSelected" : "account")
                        .frame(width: 28, height: 28)
                    Text("Аккаунт")
                        .foregroundColor(selectedTab == .account ? Color(.EATME.Blue) : Color(.EATME.DarkGray))
                        .font(.SFProDisplay.Medium.size(of: 10))
                }
                .tag(Tab.account)
        }
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search View")
    }
}

struct AccountView: View {
    var body: some View {
        Text("Account View")
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
