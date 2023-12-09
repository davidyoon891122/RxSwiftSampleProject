//
//  UserServiceProtocol.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 12/9/23.
//

import Foundation
import RxCocoa

protocol UserServiceProtocol: ServiceProtocol {
    func requestUserInfo() -> Signal<UserInfoModel>
}
