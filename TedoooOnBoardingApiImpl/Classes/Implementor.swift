//
//  Implementor.swift
//  Nimble
//
//  Created by Mor on 07/07/2022.
//

import Foundation
import TedoooOnBoardingApi
import Combine
import Swinject
import TedoooRestApi

public class ApiImpl: TedoooOnBoardingApi {
    
    private let restApi: TedoooRestApi.RestApiClient
    
    public init(container: Container) {
        self.restApi = container.resolve(TedoooRestApi.RestApiClient.self)!
    }
    
    public func finishOnBoarding(request: FinishOnBoardingRequest) -> AnyPublisher<Any?, Never> {
        print("finish", request)
        return Just(nil).delay(for: 1, scheduler: DispatchQueue.main).eraseToAnyPublisher()
    }
    
    public func getBusinessSuggestions(interests: [String]) -> AnyPublisher<[BusinessSuggestion], Never> {
        return Just([
            BusinessSuggestion(id: "ShopId1", name: "Shop 1", rating: 5, totalReviews: 900, categories: ["Handmade Crafts", "Textile"], description: "description", image: "https://i.imgur.com/sBmKIeD.png"),
            BusinessSuggestion(id: "ShopId2", name: "Shop 2", rating: 4, totalReviews: 450, categories: ["Handmade Crafts", "Textile", "Homemade"], description: "description", image: nil),
            BusinessSuggestion(id: "ShopId3", name: "Shop 3", rating: 3.5, totalReviews: 1358, categories: ["Tests", "Textile"], description: "description", image: "https://i.imgur.com/r4PtogW.png")
        ]).delay(for: 2.0, scheduler: DispatchQueue.main).eraseToAnyPublisher()
    }
    
    private struct GroupSuggestionResponse: Decodable {
        let suggestions: [GroupSuggestion]
    }
    
    public func getGroupSuggestions(interests: [String]) -> AnyPublisher<[GroupSuggestion], Never> {
        return restApi.requestRx(outputType: GroupSuggestionResponse.self, request: HttpRequest(path: "suggestions/groups", withAuth: true)).map({$0.suggestions}).replaceError(with: []).eraseToAnyPublisher()
    }
}
