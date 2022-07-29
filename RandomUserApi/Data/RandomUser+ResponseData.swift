//
//  RandomUser+ResponseData.swift
//  RandomUserApi
//
//  Created by minkyuLee on 2022/07/30.
//

import SwiftUI

struct RandomUser: Codable, Identifiable, CustomStringConvertible {
    var id = UUID()
    var name : Name
    var photo : Photo
    private enum CodingKeys : String, CodingKey {
        case name = "name"
        case photo = "picture"
    }
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    
    var profileImgUrl : URL {
        get {
            URL(string: photo.medium)!
        }
    }
    
    var description: String {
        return name.description
    }
}

struct Name: Codable, CustomStringConvertible {
    var title : String
    var first : String
    var last : String
    
    var description: String {
        return "[\(title)] \(last), \(first)"
    }
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Name(title: "개발자", first: "이민규", last: "망치통")
    }
}

struct Photo: Codable {
    var large : String
    var medium : String
    var thumbnail : String
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Photo(large: "https://randomuser.me/api/portraits/women/5.jpg", medium: "https://randomuser.me/api/portraits/women/5.jpg", thumbnail: "https://randomuser.me/api/portraits/women/5.jpg")
    }
}

struct Info : Codable {
    var seed : String
    var resultCount : Int
    var page : Int
    var version : String
    private enum CodingKeys : String, CodingKey {
        case seed = "seed"
        case resultCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse: Codable, CustomStringConvertible {
    var results: [RandomUser]
    var info: Info
    private enum CodingKeys: String, CodingKey {
        case results, info
    }
    var description: String{
        return "result.count \(results.count) / info : \(info.seed)"
    }
}
