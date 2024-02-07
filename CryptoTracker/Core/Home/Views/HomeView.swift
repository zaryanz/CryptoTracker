//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Aryan Singh on 05/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                // content layer
                homeHeader
                
                HStack {
                    Text("Coin")
                    Spacer()
                    Text("Holdings")
                    Text("Price")
                }.font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .padding(.horizontal)
                
                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView().navigationBarHidden(true)
        }.environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var homeHeader: some View { HStack {
        CircleButtonView(iconName: showPortfolio ? "plus": "info")
            .animation(.none)
        Spacer()
        Text(showPortfolio ? "Portfolio" : "Live Prices")
            .font(.headline)
            .fontWeight(.heavy)
            .foregroundColor(Color.theme.accent)
        Spacer()
        CircleButtonView(iconName: "chevron.right")
            .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
            .onTapGesture {
                withAnimation(.spring()) {
                    showPortfolio.toggle()
                }
            }
    }
    .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.listStyle(PlainListStyle())
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.listStyle(PlainListStyle())
    }
}
