//
//  HomeVC.swift
//  IOS-developer-task
//
//  Created by Elsaadany on 24/12/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK:- Properties
    private let netWorkManager = NetworkManager()
    
    private var postDetails: PostDetails? {
        didSet {
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        }
    }
    
    // MARK:- OutLets
    @IBOutlet weak var homeTableView: UITableView!
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.viewControllersTitels.home
        homeTableView.delegate = self
        homeTableView.dataSource = self
        getData()
        register()
    }
    
    // MARK:- Methods
    private func register() {
        homeTableView.register(UINib(nibName: HomeTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }
}

// MARK:- TableViewDelegate, TableViewDataSource
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsVC()
        vc.postDetail = postDetails?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK:- extension For Method
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


