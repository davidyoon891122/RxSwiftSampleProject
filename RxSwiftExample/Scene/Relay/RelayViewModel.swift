//
//  RelayViewModel.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/8/23.
//

import Foundation
import RxCocoa
import RxSwift

protocol RelayViewModelInput {
    func increaseLabel()
}

protocol RelayViewModelOutput {
    var labelValueBehaviorRelay: BehaviorRelay<Int> { get }
}

protocol RelayViewModelType {
    var inputs: RelayViewModelInput { get }
    var outputs: RelayViewModelOutput { get }
}

class RelayViewModel: RelayViewModelType, RelayViewModelInput, RelayViewModelOutput {
    var inputs: RelayViewModelInput { self }
    var outputs: RelayViewModelOutput { self }

    private var labelValue: Int = 0

    var labelValueBehaviorRelay: BehaviorRelay<Int> = .init(value: 0)

    func increaseLabel() {
        self.labelValue += 1

        labelValueBehaviorRelay.accept(self.labelValue)
    }

}
