//
//  DIContainer.swift
//  TedoooOnBoardingApiImpl
//
//  Created by Mor on 06/07/2022.
//

import Foundation

@propertyWrapper
struct Inject<Component> {
    public let wrappedValue: Component
    public init() {
        self.wrappedValue = DIContainer.shared.resolve(Component.self)
    }
}

class DIContainer {
    
    static let shared = DIContainer()
    var container: Container!
    
    func registerContainer(container: Container) {
        self.container = container
    }
    
    public func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }

    
}
