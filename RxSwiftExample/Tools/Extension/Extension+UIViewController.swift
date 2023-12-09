//
//  Extension+UIViewController.swift
//  RxSwiftExample
//
//  Created by Jiwon Yoon on 12/9/23.
//

import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

        }
    }

    func showPreview(_ deviceType: DeviceType = .iPhone14Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}
