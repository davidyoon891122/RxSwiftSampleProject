//
//  AccountServiceProtocol.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 12/9/23.
//

import Foundation
import RxCocoa

protocol AccountServiceProtocol: ServiceProtocol {
    func requestAccountInfo() -> Signal<AccountInfoModel>
}
