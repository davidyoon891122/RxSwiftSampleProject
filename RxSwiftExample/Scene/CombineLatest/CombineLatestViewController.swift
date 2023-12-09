//
//  CombineLatestViewController.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 12/9/23.
//

import UIKit
import RxSwift
import SnapKit

final class CombineLatestViewController: UIViewController {
    static let menuName = String(describing: CombineLatestViewController.self)
    static let menuNumber = "0004"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

private extension CombineLatestViewController {
    func setupViews() {
        view.backgroundColor = .systemCyan
    }
}


