//
//  MenuCell.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/8/23.
//

import UIKit
import SnapKit

final class MenuCell: UITableViewCell {
    static let identifier = "MenuCell"

    private lazy var menuTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu"
        label.textColor = .label

        return label
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        [
            menuTitleLabel
        ]
            .forEach {
                view.addSubview($0)
            }

        menuTitleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16.0)
        }

        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(menu: String) {
        menuTitleLabel.text = menu
    }
}

private extension MenuCell {
    func setupViews() {
        [
            containerView
        ]
            .forEach {
                contentView.addSubview($0)
            }

        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
