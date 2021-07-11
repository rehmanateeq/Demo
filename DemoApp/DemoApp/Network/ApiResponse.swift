//
//  ApiResponse.swift
//  DemoApp
//
//  Created by Ateeq on 7/11/21.
//

import Foundation


struct ApiResponse<T: Codable>: Codable {
    let status: Bool
    let message:String?
    let data: T?
}

