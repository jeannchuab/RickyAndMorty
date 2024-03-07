//
//  MockData.swift
//  RickAndMorty
//
//  Created by Jeann Luiz on 07/03/24.
//

import Foundation

struct MockData {
    
    //MARK: Character    
    static let character1 = CharacterModel(
        id: 1,
        name: "Mock Character",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Male",
        origin: OriginModel(
            name: "Earth (C-137)",
            url: "https://rickandmortyapi.com/api/location/1"
        ),
        location: LocationModel(
            name: "Citadel of Ricks",
            url: "https://rickandmortyapi.com/api/location/3"
        ),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/3"
        ],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    )

    static let character2 = CharacterModel(
        id: 2,
        name: "Morty Smith",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Male",
        origin: OriginModel(
            name: "unknown",
            url: ""
        ),
        location: LocationModel(
            name: "Citadel of Ricks",
            url: "https://rickandmortyapi.com/api/location/3"
        ),
        image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/3"
        ],
        url: "https://rickandmortyapi.com/api/character/2",
        created: "2017-11-04T18:50:21.651Z"
    )

    static let character3 = CharacterModel(
        id: 3,
        name: "Summer Smith",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Female",
        origin: OriginModel(
            name: "Earth (Replacement Dimension)",
            url: "https://rickandmortyapi.com/api/location/20"
        ),
        location: LocationModel(
            name: "Earth (Replacement Dimension)",
            url: "https://rickandmortyapi.com/api/location/20"
        ),
        image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg",
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/3"
        ],
        url: "https://rickandmortyapi.com/api/character/3",
        created: "2017-11-04T19:10:20.129Z"
    )
        
    static let characterList = [character1, character2, character3]
}
