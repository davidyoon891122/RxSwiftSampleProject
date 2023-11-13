//
//  SubjectViewModel.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/13/23.
//

import Foundation

protocol SubjectViewModelInput {

}

protocol SubjectViewModelOutput {

}

protocol SubjectViewModelType {
    var inputs: SubjectViewModelInput { get }
    var outputs: SubjectViewModelOutput { get }
}

final class SubjectViewModel: SubjectViewModelType, SubjectViewModelInput, SubjectViewModelOutput {
    var inputs: SubjectViewModelInput { self }
    var outputs: SubjectViewModelOutput { self }

}
