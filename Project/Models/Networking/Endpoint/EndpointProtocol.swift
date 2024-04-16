//
//  EndpointProtocol.swift
//  Project
//
//  Created by Chetan Choudhary on 17/04/24.
//

import Foundation

protocol EndpointProtocol {
    var path: String { get }
    var method: HTTPMethod_Enum { get }
}

