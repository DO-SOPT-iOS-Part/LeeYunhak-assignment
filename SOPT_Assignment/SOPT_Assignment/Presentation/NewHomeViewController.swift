//
//  NewHomeViewController.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/6/23.
//

import UIKit
import Then

class NewHomeViewController: UIViewController {
    
    // MARK: - Properties
    private let weatherTitle = UILabel()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    // UI 세팅 작업
    private func setupUI() {
        self.view.backgroundColor = .black
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "날씨"
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "SFProDisplay-Bold", size: 36) ?? UIFont()]
        self.navigationItem.standardAppearance = appearance
        
        setupLayout()
    }
    
    // 레이아웃 세팅
    private func setupLayout() {

    }
    
}

// MARK: - Extensions

