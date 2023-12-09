//
//  UserInfoModel.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 12/9/23.
//

import Foundation

struct UserInfoModel: Codable {
    let name: String
    let id: String
    let phoneNumber: String
}

extension UserInfoModel {
    static let mockItem: UserInfoModel = .init(name: "Davidyoon", id: "Davidyoon", phoneNumber: "01000000000")
}
