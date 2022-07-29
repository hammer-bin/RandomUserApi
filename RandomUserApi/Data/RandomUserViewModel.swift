//
//  RandomUserViewModel.swift
//  RandomUserApi
//
//  Created by minkyuLee on 2022/07/30.
//

import SwiftUI
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    
    //MARK: Properties
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers(){
        print(#fileID, #function, #line, "")
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap{ $0.value }
            .map{ $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터스트림 완료 ")
            }, receiveValue: { receivedValue in
                //guard let self = self else {return}
                print("받은 값 : \(receivedValue.count)")
                self.randomUsers = receivedValue
            }).store(in: &subscription)
    }
}
