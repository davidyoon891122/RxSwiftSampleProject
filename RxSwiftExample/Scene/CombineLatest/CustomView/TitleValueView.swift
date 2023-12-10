//
//  TitleValueView.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 12/9/23.
//

import UIKit
import SnapKit

class TitleValueView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .lightGray

        return label
    }()

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Value"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .right

        return label
    }()

    private let separatorView = SeparatorView()

    private lazy var containView: UIView = {
        let view = UIView()

        [
            titleLabel,
            valueLabel,
            separatorView
        ]
            .forEach {
                view.addSubview($0)
            }

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-16)
        }

        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        valueLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing)
            $0.trailing.equalToSuperview().offset(-16)
        }

        separatorView.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
        }

        return view
    }()


    init(title: String, value: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.valueLabel.text = value
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setValue(value: String) {
        valueLabel.text = value
    }
}

private extension TitleValueView {
    func setupViews() {
        addSubview(containView)

        containView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - Preview
import SwiftUI

struct TitleValueView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            TitleValueView(title: "이름", value: "Davidyoon")
        }
        .frame(height: 50)
//        .border(.gray)
    }
}
