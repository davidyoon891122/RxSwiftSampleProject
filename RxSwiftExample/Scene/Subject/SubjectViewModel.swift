//
//  SubjectViewModel.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/13/23.
//

import RxSwift
import RxCocoa

protocol SubjectViewModelInput {
    func increaseBehaviorLabel()
    func increasePublishLabel()
}

protocol SubjectViewModelOutput {
    var behaviorSubject: BehaviorSubject<Int> { get }
    var publishSubject: PublishSubject<Int> { get }
}

protocol SubjectViewModelType {
    var inputs: SubjectViewModelInput { get }
    var outputs: SubjectViewModelOutput { get }
}

final class SubjectViewModel: SubjectViewModelType, SubjectViewModelInput, SubjectViewModelOutput {
    var inputs: SubjectViewModelInput { self }
    var outputs: SubjectViewModelOutput { self }

    private var behaviorLabelValue = 0
    private var publishLabelValue = 0

    var behaviorSubject: BehaviorSubject<Int> = .init(value: 0)
    var publishSubject: PublishSubject<Int> = .init()

    func increaseBehaviorLabel() {
        behaviorLabelValue += 1
        behaviorSubject.onNext(behaviorLabelValue)
    }

    func increasePublishLabel() {
        publishLabelValue += 1
        publishSubject.onNext(publishLabelValue)
    }
}
