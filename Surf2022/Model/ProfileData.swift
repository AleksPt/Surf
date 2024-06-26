//
//  ProfileData.swift
//  Surf2022
//
//  Created by Алексей on 26.06.2024.
//

import Foundation

struct ProfileData {
    let avatar: String
    let name: String
    let surname: String
    let status: String
    let city: String
    let phone: String
    let email: String
    
    static func getProfile() -> ProfileData {
        
            ProfileData(
                avatar: "avatar",
                name: "Браун",
                surname: "Эммет",
                status: "Я считаю, что если уж делать машину времени, то она должна выглядеть стильно!",
                city: "Hill Valley",
                phone: "88-88-88",
                email: "doc@backtothefuture.com"
            )
        
    }
}

