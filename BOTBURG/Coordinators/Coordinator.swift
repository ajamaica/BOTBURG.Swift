//
//  Coordinator.swift
//  BOTBURG
//
//  Created by Arturo Jamaica on 2021/05/09.
//

import Foundation
import UIKit

class Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func popViewController() {
        navigationController?.popViewController(animated: true)
    }

    func dismissModal() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func boot(windowScene: UIWindowScene) -> UIWindow { 
        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window.windowScene = windowScene
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.showBots()
        return window
    }
    
    func showBots() {
        let coordinator = BotsFlowViewCoordinator(navigationController: navigationController)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
