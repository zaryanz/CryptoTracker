//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by Aryan Singh on 06/02/24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin)
    }
}
