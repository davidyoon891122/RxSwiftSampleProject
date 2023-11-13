//
//  SubjectViewController.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/13/23.
//

import UIKit
import RxSwift
import RxCocoa

final class SubjectViewController: UIViewController {
    static let menuNumber = "0003"
    static let menuName = "Subject"

    private var disposeBag = DisposeBag()

    private var viewModel: SubjectViewModelType

    init(viewModel: SubjectViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var behaviorNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "behavior"
        label.textColor = .label
        label.textAlignment = .center

        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.cornerRadius = 4.0

        return label
    }()

    private lazy var publishNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "publish"
        label.textColor = .label
        label.textAlignment = .center

        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.cornerRadius = 4.0

        return label
    }()

    private lazy var behaviorButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Behavior", for: .normal)
        button.setTitleColor(.label, for: .normal)

        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 4.0

        return button
    }()

    private lazy var publishButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Publish", for: .normal)
        button.setTitleColor(.label, for: .normal)

        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 4.0

        return button
    }()

    private lazy var buttonHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16

        [
            behaviorButton,
            publishButton
        ]
            .forEach {
                stackView.addArrangedSubview($0)
            }

        behaviorButton.snp.makeConstraints {
            $0.height.equalTo(50)
        }

        publishButton.snp.makeConstraints {
            $0.height.equalTo(50)
        }

        return stackView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

private extension SubjectViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            behaviorNumberLabel,
            publishNumberLabel,
            buttonHStack
        ]
            .forEach {
                view.addSubview($0)
            }

        let offset: CGFloat = 16.0

        behaviorNumberLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.height.equalTo(50)
        }

        publishNumberLabel.snp.makeConstraints {
            $0.top.equalTo(behaviorNumberLabel.snp.bottom).offset(offset)
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.height.equalTo(50)
        }

        buttonHStack.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(offset)
            $0.trailing.equalToSuperview().offset(-offset)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-offset)
        }
    }
}

