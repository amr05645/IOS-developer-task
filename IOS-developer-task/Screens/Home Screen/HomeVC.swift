//
//  HomeVC.swift
//  IOS-developer-task
//
//  Created by Elsaadany on 24/12/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    let netWorkManager = NetworkManager()
    
    var postDetails: PostDetails? {
        didSet {
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.viewControllersTitels.home
        homeTableView.delegate = self
        homeTableView.dataSource = self
        getData()
        register()
    }
    
    private func register() {
        homeTableView.register(UINib(nibName: HomeTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as! HomeTableViewCell
        let shows = postDetails?[indexPath.row]
        cell.configure(show: shows)
        return cell
    }
    
}

extension HomeVC {
    func getData() {
        netWorkManager.getData { (result) in
            switch result {
            case .success(let postDetails):
                self.postDetails = postDetails
            case .failure(let error):
               print(error)
            }
        }
    }
}
    

