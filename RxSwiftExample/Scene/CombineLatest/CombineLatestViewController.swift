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
            accountInfoView
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
    }

    func bindViewModel() {
        self.viewModel.outpus.myDataRelay
            .asDriver()
            .drive(onNext: { myData in
                guard let myData = myData else { return }
                print(myData)
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

