//
//  MenuViewController.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 11/8/23.
//

import UIKit
import SnapKit

enum MenuSectionType {
    case menu
}

final class MenuViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()

        tableView.register(
            MenuCell.self,
            forCellReuseIdentifier: MenuCell.identifier
        )

        tableView.delegate = self

        return tableView
    }()

    private var datasource: UITableViewDiffableDataSource<MenuSectionType, MenuModel>!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDatasource()

    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuModel = MenuModel.menus[indexPath.row]
        print(menuModel.menuName)
        print(menuModel.menuNumber)

        let targetViewController = menuModel.instantiate()

        navigationController?.pushViewController(targetViewController, animated: true)
    }
}

private extension MenuViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            tableView
        ]
            .forEach {
                view.addSubview($0)
            }

        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    func configureDatasource() {
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, item in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else { return UITableViewCell() }

            cell.setupCell(menu: item.menuName)

            return cell
        })

        applySnapshot()
    }

    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<MenuSectionType, MenuModel>()
        snapshot.appendSections([.menu])
        snapshot.appendItems(MenuModel.menus)

        datasource.apply(snapshot, animatingDifferences: true)
    }
}
