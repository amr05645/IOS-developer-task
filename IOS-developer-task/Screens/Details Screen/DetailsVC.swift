//
//  DetailsVC.swift
//  IOS-developer-task
//
//  Created by Elsaadany on 25/12/2021.
//

import UIKit
import SafariServices

class DetailsVC: UIViewController {
    
    // MARK:- Properties
    var postDetail: PostDetail?
    
    // MARK:- OutLets
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var runTimeLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    @IBOutlet weak var premieredLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var genersLbl: UILabel!
    @IBOutlet weak var offecialSiteLbl: UILabel!
    @IBOutlet weak var summeryLbl: UILabel!
    
    // Mark:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    // Mark:- Methods
    private func updateView() {
        title = Constants.viewControllersTitels.showDetails
        showImg.showImage(url: postDetail?.show?.image?.original ?? "")
        nameLbl.text = postDetail?.show?.name ?? ""
        rateLbl.text = "\(postDetail?.show?.rating?.average ?? 0)"
        runTimeLbl.text = "\(postDetail?.show?.runtime ?? 0) min"
        linkLbl.text = "\(postDetail?.show?.links?.linksSelf?.href ?? "")"
        premieredLbl.text = postDetail?.show?.premiered ?? ""
        languageLbl.text = (postDetail?.show?.language).map { $0.rawValue }
        genersLbl.text = postDetail?.show?.genres?.joined(separator: ", ")
        offecialSiteLbl.text = postDetail?.show?.officialSite ?? "Not Avilable"
        summeryLbl.attributedText = postDetail?.show?.summary?.htmlAttributedString()
    }
    
    private func presentSafariController(urlString: String?) {
        let urlString = urlString ?? "Not Avilable"
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    // Mark:- Actions
    @IBAction func linkBtnTapped(_ sender: Any) {
        presentSafariController(urlString: postDetail?.show?.url)
    }
    
    @IBAction func offecialWebBtnTapped(_ sender: Any) {
        presentSafariController(urlString: postDetail?.show?.officialSite)
    }
}

// Mark:- SafariViewControllerDelegate
extension DetailsVC: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
    
}
