//
//  DetailsVC.swift
//  IOS-developer-task
//
//  Created by Elsaadany on 25/12/2021.
//

import UIKit
import SafariServices

class DetailsVC: UIViewController, SFSafariViewControllerDelegate {
    
    var postDetail: PostDetail?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.viewControllersTitels.showDetails
        updateView()
    }
    
    private func updateView() {
        showImg.showImage(url: postDetail?.show?.image?.original ?? "")
        nameLbl.text = postDetail?.show?.name ?? ""
        rateLbl.text = "\(postDetail?.show?.rating?.average ?? 0)"
        runTimeLbl.text = "\(postDetail?.show?.runtime ?? 0) min"
        linkLbl.text = "\(postDetail?.show?.links?.linksSelf?.href ?? "")"
        premieredLbl.text = postDetail?.show?.premiered ?? ""
        languageLbl.text = (postDetail?.show?.language).map { $0.rawValue }
        genersLbl.text = "\(postDetail?.show?.genres ?? ["Not Avilable"])"
        offecialSiteLbl.text = postDetail?.show?.officialSite ?? "Not Avilable"
        summeryLbl.attributedText = postDetail?.show?.summary?.htmlAttributedString()
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
    
    @IBAction func linkBtnTapped(_ sender: Any) {
        let urlString = postDetail?.show?.url ?? ""
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    @IBAction func offecialWebBtnTapped(_ sender: Any) {
        let urlString = postDetail?.show?.officialSite ?? "Not Avilable"
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    
    
}
