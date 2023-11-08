//
//  RelayViewController.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/8/23.
//

import UIKit
import SnapKit

final class RelayViewController: UIViewController {
    static let menuNumber = "0002"
    static let menuName = "Relay"

    private var relayViewModel: RelayViewModelType

    init(relayViewModel: RelayViewModelType) {
        self.relayViewModel = relayViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
