//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/7/23.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4.0

        textField.becomeFirstResponder()

        return textField
    }()

    private lazy var submitButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 4.0

        return button
    }()

    private var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindUI()
    }
}

private extension ViewController {
    func setupViews() {

        view.backgroundColor = .systemBackground

        [
            textField,
            submitButton
        ]
            .forEach {
                view.addSubview($0)
            }

        let offset: CGFloat = 16.0

        textField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.height.equalTo(50.0)
        }

        submitButton.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.height.equalTo(50.0)
        }
    }

    func bindUI() {
        submitButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: {
                print("Submit Button tapped!")
            })
            .disposed(by: disposeBag)

        textField.rx.text
            .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)
            .subscribe(onNext: { text in
                print(text)
            })
            .disposed(by: disposeBag)
    }
}

