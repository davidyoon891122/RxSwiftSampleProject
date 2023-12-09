//
//  CombineLatestViewModel.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 12/9/23.
//

import Foundation
import RxSwift
import RxCocoa

protocol CombineLatestViewModelInput {
    func requestMyData()
}

protocol CombineLatestViewModelOutput {
    var userInfoRelay: BehaviorRelay<UserInfoModel?> { get }
    var accountInfoRelay: BehaviorRelay<AccountInfoModel?> { get }
}

protocol CombineLatestViewModelType {
    var inputs: CombineLatestViewModelInput { get }
    var outpus: CombineLatestViewModelOutput { get }
}

class CombineLatestViewModel: CombineLatestViewModelType, CombineLatestViewModelInput, CombineLatestViewModelOutput {
    var inputs: CombineLatestViewModelInput { self }
    var outpus: CombineLatestViewModelOutput { self }

    private let service: CombineLatestServiceProtocol

    var userInfoRelay: BehaviorRelay<UserInfoModel?> = .init(value: nil)
    var accountInfoRelay: BehaviorRelay<AccountInfoModel?> = .init(value: nil)

    init(service: CombineLatestServiceProtocol) {
        self.service = service
    }

    func requestMyData() {
        let combineResult = Observable.combineLatest(
            self.service.requestUserInfo().asObservable(),
            self.service.requestAccountInfo().asObservable()) { userInfoModel, accountInfoModel in
            print("\(userInfoModel) + \(accountInfoModel)")
        }
    }
}
