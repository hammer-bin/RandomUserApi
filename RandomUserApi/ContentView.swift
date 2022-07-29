//
//  ContentView.swift
//  RandomUserApi
//
//  Created by minkyuLee on 2022/07/30.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        
        List(randomUserViewModel.randomUsers) { aRandomUser in
            RandomUserRowView(aRandomUser)
        }
//        List(0...100, id: \.self){ index in
//            RandomUserRowView()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
