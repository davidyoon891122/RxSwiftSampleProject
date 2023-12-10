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

    private let userNameView = TitleValueView(title: "이름", value: "--")
    private let phoneNumberView = TitleValueView(title: "전화번호", value: "--")

    private lazy var userInfoTitleLabel: UILabel = {
        let label = UILabel()

        label.text = "UserInfo"
        label.font = .boldSystemFont(ofSize: 30)

        return label
    }()

    private lazy var userInfoView: UIView = {
        let view = UIView()
        [
            userInfoTitleLabel,
            userNameView,
            phoneNumberView
        ]
            .forEach {
                view.addSubview($0)
            }

        userInfoTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.General.offset)
            $0.leading.equalToSuperview().offset(Constants.General.offset)
            $0.trailing.equalToSuperview().offset(-Constants.General.offset)
        }

        userNameView.snp.makeConstraints {
            $0.top.equalTo(userInfoTitleLabel.snp.bottom).offset(Constants.General.offset)
            $0.leading.equalToSuperview().offset(Constants.General.offset)
            $0.trailing.equalToSuperview().offset(-Constants.General.offset)
        }

        phoneNumberView.snp.makeConstraints {
            $0.top.equalTo(userNameView.snp.bottom).offset(Constants.General.offset / 2)
            $0.leading.trailing.equalTo(userNameView)
            $0.bottom.equalToSuperview().offset(-Constants.General.offset)
        }

        return view
    }()

    private lazy var accountInfoTitleLabel: UILabel = {
        let label = UILabel()

        label.text = "AccountInfo"
        label.font = .boldSystemFont(ofSize: 30)

        return label
    }()

    private let accountNumberView = TitleValueView(title: "계좌번호", value: "--")
    private let totalAssetView = TitleValueView(title: "총자산", value: "--")

    private lazy var accountInfoView: UIView = {
        let view = UIView()

        [
            accountInfoTitleLabel,
            accountNumberView,
            totalAssetView
        ]
            .forEach {
                view.addSubview($0)
            }

        accountInfoTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Constants.General.offset)
            $0.leading.equalToSuperview().offset(Constants.General.offset)
            $0.trailing.equalToSuperview().offset(-Constants.General.offset)
        }

        accountNumberView.snp.makeConstraints {
            $0.top.equalTo(accountInfoTitleLabel.snp.bottom).offset(Constants.General.offset)
            $0.leading.trailing.equalTo(accountInfoTitleLabel)
        }

        totalAssetView.snp.makeConstraints {
            $0.top.equalTo(accountNumberView.snp.bottom).offset(Constants.General.offset / 2)
            $0.leading.trailing.equalTo(accountNumberView)
            $0.bottom.equalToSuperview().offset(-Constants.General.offset)
        }

        return view
    }()

    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black

        button.layer.cornerRadius = 8

        return button
    }()


    // MARK: - Variable
    private let viewModel: CombineLatestViewModelType
    private var disposeBag = DisposeBag()

    init(viewModel: CombineLatestViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
        bindUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.inputs.requestMyData()
    }
}

private extension CombineLatestViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground

        [
            userInfoView,
            accountInfoView,
            searchButton
        ]
            .forEach {
                view.addSubview($0)
            }

        userInfoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        accountInfoView.snp.makeConstraints {
            $0.top.equalTo(userInfoView.snp.bottom).offset(Constants.General.offset * 2)
            $0.leading.trailing.equalTo(userInfoView)
        }

        searchButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Constants.General.offset)
            $0.trailing.equalToSuperview().offset(-Constants.General.offset)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-Constants.General.offset)
            $0.height.equalTo(50.0)
        }
    }

    func bindViewModel() {
        self.viewModel.outpus.myDataRelay
            .asDriver()
            .drive(onNext: { [weak self] myData in
                guard let self = self,
                    let myData = myData else { return }
                self.userNameView.setValue(value: myData.userInfo.name)
                self.phoneNumberView.setValue(value: myData.userInfo.phoneNumber)
                self.accountNumberView.setValue(value: myData.accountInfo.accountNumber)
                self.totalAssetView.setValue(value: "\(myData.accountInfo.totalAsset)")
            })
            .disposed(by: disposeBag)
    }

    func bindUI() {
        searchButton.rx.tap
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .asDriver(onErrorDriveWith: .empty())
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.userNameView.reset()
                self.phoneNumberView.reset()
                self.accountNumberView.reset()
                self.totalAssetView.reset()
                self.viewModel.inputs.requestMyData()
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Preview
import SwiftUI

struct CombineLatestViewController_Preview: PreviewProvider {
    static var previews: some View {
        CombineLatestViewController(viewModel: CombineLatestViewModel(service: CombineLatestService()))
            .showPreview()
    }
}

