//
//  CombineLatestService.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 12/9/23.
//

import Foundation
import RxCocoa
import RxSwift

class CombineLatestService: CombineLatestServiceProtocol {

}

extension CombineLatestService: UserServiceProtocol {
    func requestUserInfo() -> Signal<UserInfoModel> {
        let mockItem = UserInfoModel.mockItem

        return Signal.just(mockItem)
    }
}

extension CombineLatestService: AccountServiceProtocol {
    func requestAccountInfo() -> Signal<AccountInfoModel> {
        return Signal.just(AccountInfoModel.mockItem)
    }
}
