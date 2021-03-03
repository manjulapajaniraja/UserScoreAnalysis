//
//  ViewController.swift
//  UserStatsApp
//
//  Created by Manjula Pajaniraja on 02/03/21.
//

import UIKit
import StatsData

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var viewModel = UserStatsViewModel()
    
    //LifeCycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindData()
        viewModel.getUserDataForDisplay()
    }
    
    func bindData() {
        self.viewModel.userData.bind(observer: { userData in
            DispatchQueue.main.async {
                
                guard let data = userData else { return }
                
                //Loading the library for showing user score analysis in the view.
                let statsView = StatsView.init(withData: data)
                statsView.translatesAutoresizingMaskIntoConstraints = false
                self.containerView.subviews.forEach { $0.removeFromSuperview() }
                self.containerView.addSubview(statsView)
                let constraints = [statsView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
                                   statsView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
                                   statsView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor),
                                   statsView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor)]
                NSLayoutConstraint.activate(constraints)
            }
        })
    }
    
    //IBActions
    
    @IBAction func CheckMyScoreTapped(_ sender: Any) {
        viewModel.getUserDataForDisplay()
    }

}

