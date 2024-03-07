//
//  CustomError.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import Foundation

import Foundation

enum CustomError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
    case unableToComplete
    case unknownError
    case invalidFavorite
    case endpointNotFound
}
