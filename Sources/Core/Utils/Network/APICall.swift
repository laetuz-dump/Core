//
//  APICall.swift
//  Rickpository
//
//  Created by Ryo Martin on 01/07/24.
//

import Foundation

public struct API {
    static let baseUrl = "https://rickandmortyapi.com/api/"
}

public protocol Endpoint {
    var url: String { get }
}

public enum Endpoints {
    
    public enum Gets: Endpoint {
        case characters
        
        public var url: String {
            switch self {
            case .characters: return "\(API.baseUrl)character"
            }
        }
    }
}
