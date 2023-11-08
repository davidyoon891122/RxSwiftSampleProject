//
//  MenuModel.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/8/23.
//

import UIKit

struct MenuModel: Hashable {
    let menuName: String
    let menuNumber: String
    let menu: UIViewController
}

extension MenuModel {
    static let menus = [
        MenuModel(
            menuName: "ThrottleAndDebounce",
            menuNumber: "0001",
            menu: ThrottleVSDebounceVC()
        )
    ]
}
