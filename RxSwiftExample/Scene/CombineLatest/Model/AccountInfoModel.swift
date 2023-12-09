//
//  AccountInfoModel.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 12/9/23.
//

import Foundation

struct AccountInfoModel: Codable {
    let accountNumber: String
    let accountType: AccountType
}

extension AccountInfoModel {
    static let mockItem: AccountInfoModel = .init(accountNumber: "6888888", accountType: .total)
}

enum AccountType: Codable {
    case total
    case coin
    case stock
}

