//
//  Implementor.swift
//  Nimble
//
//  Created by Mor on 07/07/2022.
//

import Foundation
import TedoooOnBoardingApi
import Combine

class ApiImpl: TedoooOnBoardingApi {
    
    func finishOnBoarding(request: FinishOnBoardingRequest) -> AnyPublisher<Any?, Never> {
        print("finish", request)
        return Just(nil).delay(for: 1, scheduler: DispatchQueue.main).eraseToAnyPublisher()
    }
    
    func getBusinessSuggestions() -> AnyPublisher<[BusinessSuggestion], Never> {
        return Just([
            BusinessSuggestion(id: "ShopId1", name: "Shop 1", rating: 5, totalReviews: 900, categories: ["Handmade Crafts", "Textile"], description: "description", image: "https://i.imgur.com/sBmKIeD.png"),
            BusinessSuggestion(id: "ShopId2", name: "Shop 2", rating: 4, totalReviews: 450, categories: ["Handmade Crafts", "Textile", "Homemade"], description: "description", image: nil),
            BusinessSuggestion(id: "ShopId3", name: "Shop 3", rating: 3.5, totalReviews: 1358, categories: ["Tests", "Textile"], description: "description", image: "https://i.imgur.com/r4PtogW.png")
        ]).delay(for: 2.0, scheduler: DispatchQueue.main).eraseToAnyPublisher()
    }
    
    func getGroupSuggestions() -> AnyPublisher<[GroupSuggestion], Never> {
        return Just([
            GroupSuggestion(id: "GroupId1", name: "Wreath lovers", participants: 1500, description: "Hi there! this group is for people who are interested in Crafty fun and handmade items", image: "https://i.imgur.com/sBmKIeD.png"),
GroupSuggestion(id: "GroupId2", name: "Crafty fun", participants: 31010, description: "Our group is made to support crafters and handmade creators meet and share tips", image: "https://i.imgur.com/r4PtogW.png"),
GroupSuggestion(id: "GroupId3", name: "Handmade fans", participants: 456, description: "Our group is made to support crafters and handmade creators meet and share tips!", image: nil),
        ]).delay(for: 3.0, scheduler: DispatchQueue.main).eraseToAnyPublisher()
    }
}
