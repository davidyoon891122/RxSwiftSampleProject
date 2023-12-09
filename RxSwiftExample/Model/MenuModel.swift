//
//  MenuModel.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/8/23.
//

import UIKit

struct MenuModel {
    let menuName: String
    let menuNumber: String
    let instantiate: () -> UIViewController
}

extension MenuModel: Equatable, Hashable {
    static func == (lhs: MenuModel, rhs: MenuModel) -> Bool {
       return lhs.menuName == rhs.menuName && lhs.menuNumber == rhs.menuNumber
   }

    func hash(into hasher: inout Hasher) {
       hasher.combine(menuName)
       hasher.combine(menuNumber)
   }
}

extension MenuModel {
    static let menus = [
        MenuModel(
            menuName: ThrottleVSDebounceVC.menuName,
            menuNumber: ThrottleVSDebounceVC.menuNumber,
            instantiate: { ThrottleVSDebounceVC() }
        ),
        MenuModel(
            menuName: RelayViewController.menuName,
            menuNumber: RelayViewController.menuNumber,
            instantiate: { RelayViewController(relayViewModel: RelayViewModel()) }
        ),
        MenuModel(
            menuName: SubjectViewController.menuName,
            menuNumber: SubjectViewController.menuNumber,
            instantiate: { SubjectViewController(viewModel: SubjectViewModel()) }
        ),
        MenuModel(
            menuName: CombineLatestViewController.menuName,
            menuNumber: CombineLatestViewController.menuNumber,
            instantiate: {
                CombineLatestViewController(viewModel: CombineLatestViewModel(service: CombineLatestService()))
            }
        )

    ]
}
