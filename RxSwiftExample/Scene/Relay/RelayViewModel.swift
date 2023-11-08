//
//  RelayViewModel.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/8/23.
//

import Foundation

protocol RelayViewModelInput {

}

protocol RelayViewModelOutput {

}

protocol RelayViewModelType {
    var inputs: RelayViewModelInput { get }
    var outputs: RelayViewModelOutput { get }
}

class RelayViewModel: RelayViewModelType, RelayViewModelInput, RelayViewModelOutput {
    var inputs: RelayViewModelInput { self }
    var outputs: RelayViewModelOutput { self }


}
