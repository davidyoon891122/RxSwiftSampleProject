//
//  RelayViewController.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/8/23.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class RelayViewController: UIViewController {
    static let menuNumber = "0002"
    static let menuName = "Relay"

    private lazy var publishButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Publish", for: .normal)
        button.setTitleColor(.label, for: .normal)

        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 4.0

        return button
    }()

    private lazy var numberTextLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .label
        label.textAlignment = .center

        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.cornerRadius = 4.0

        return label
    }()


    private var relayViewModel: RelayViewModelType

    private var disposeBag = DisposeBag()

    private let publishRelay = PublishRelay<Int>()

    init(relayViewModel: RelayViewModelType) {
        self.relayViewModel = relayViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}


private extension RelayViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground

        [
            numberTextLabel,
            publishButton
        ]
            .forEach {
                view.addSubview($0)
            }

        let offset: CGFloat = 16.0

        numberTextLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.height.equalTo(50.0)
        }

        publishButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(offset)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.height.equalTo(50.0)
        }
    }

    func bindUI() {
        publishButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.relayViewModel.inputs.increaseLabel()
            })
            .disposed(by: disposeBag)


        relayViewModel.outputs.labelValueBehaviorRelay
            .subscribe(onNext: { [weak self] result in
                guard let self = self else { return }
                self.numberTextLabel.text = "\(result)"
            })
            .disposed(by: disposeBag)
    }
}
