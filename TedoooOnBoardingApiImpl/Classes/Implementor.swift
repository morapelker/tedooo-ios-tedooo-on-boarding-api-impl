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
    
    private struct BusinessSuggestionsResponse: Decodable {
        let suggestions: [BusinessSuggestion]
    }
    
    public func getBusinessSuggestions(interests: [String]) -> AnyPublisher<[BusinessSuggestion], Never> {
        return restApi.requestRx(outputType: BusinessSuggestionsResponse.self, request: HttpRequest(path: "suggestions/businesses", withAuth: true, method: .post), parameters: InterestsRequest(interests: interests) ).map({$0.suggestions}).replaceError(with: []).eraseToAnyPublisher()
    }
    
    private struct GroupSuggestionResponse: Decodable {
        let suggestions: [GroupSuggestion]
    }
    
    private struct InterestsRequest: Encodable {
        let interests: [String]
    }
    
    public func getGroupSuggestions(interests: [String]) -> AnyPublisher<[GroupSuggestion], Never> {
        return restApi.requestRx(outputType: GroupSuggestionResponse.self, request: HttpRequest(path: "suggestions/groups", withAuth: true, method: .post), parameters: InterestsRequest(interests: interests) ).map({$0.suggestions}).replaceError(with: []).eraseToAnyPublisher()
    }
}
