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
            menuName: ThrottleVSDebounceVC.menuName,
            menuNumber: ThrottleVSDebounceVC.menuNumber,
            menu: ThrottleVSDebounceVC()
        ),
        MenuModel(
            menuName: RelayViewController.menuName,
            menuNumber: RelayViewController.menuNumber,
            menu: RelayViewController(relayViewModel: RelayViewModel())
        )
    ]
}
