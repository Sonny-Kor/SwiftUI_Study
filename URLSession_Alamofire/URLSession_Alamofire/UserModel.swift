//
//  UserModel.swift
//  URLSession_Alamofire
//
//  Created by 승재 on 2/26/24.
//

/*
 {
    "result":[
    {
        "name":
        {
            "title":Ms",
            "fist":Deanna",
            "last":Bryant"
 
        },
        "email":"denna.bryant@exaple.com"
    }]
 }

 */
import Foundation

struct UserModel: Codable{
    var results: [RandomUser]
}

struct RandomUser: Codable, Identifiable {
    var id = UUID()
    let name: Name
    let email: String
    
    struct Name: Codable {
        var title: String
        var first: String
        var last: String
        
        var full: String{
            return "\(self.title.capitalized).\(self.last.capitalized) \(self.first.capitalized)"
        }
    }
    
    enum CodingKeys: String, CodingKey {
           case name, email
       }
    
    static func getDummy() -> Self {
        return RandomUser(name: Name.init(title: "Mr", first: "Seungjae", last: "Son"), email: "exampme@example.com")
    }
}
