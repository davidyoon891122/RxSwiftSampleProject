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
        return Signal.just(UserInfoModel.mockItem).delay(.milliseconds(1000))
    }
}

extension CombineLatestService: AccountServiceProtocol {
    func requestAccountInfo() -> Signal<AccountInfoModel> {
        return Signal.just(AccountInfoModel.mockItem).delay(.milliseconds(5000))
    }
}
