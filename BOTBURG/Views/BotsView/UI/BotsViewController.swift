//
//  BotsViewController.swift
//  BOTBURG
//
//  Created by Arturo Jamaica on 2021/05/09.
//

import UIKit

protocol BotsViewControllerDelegate: AnyObject { }
let BotTableViewCellIdentifier =  "BotTableViewCell"
class BotsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: BotsViewControllerDelegate?
    let viewModel: BotsViewModel
    
    init( viewModel: BotsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "BOTBURG"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: BotTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: BotTableViewCellIdentifier)
    }
}

extension BotsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: BotTableViewCellIdentifier, for: indexPath) as! BotTableViewCell
    }
}
