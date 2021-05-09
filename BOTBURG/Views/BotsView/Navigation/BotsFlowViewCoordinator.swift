//
//  BotsFlowViewCoordinator.swift
//  BOTBURG
//
//  Created by Arturo Jamaica on 2021/05/09.
//

import Foundation

protocol BotsFlowViewCoordinatorDelegate: AnyObject { }

final class BotsFlowViewCoordinator: Coordinator {
    weak var delegate: BotsFlowViewCoordinatorDelegate?
    func start() {
        guard let navigationController = navigationController else { return }
        let viewModel = BotsViewModel()
        let viewController = BotsViewController(viewModel: viewModel)
        viewController.delegate = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension BotsFlowViewCoordinator: BotsViewControllerDelegate {

}
