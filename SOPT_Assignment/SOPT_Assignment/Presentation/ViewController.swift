//
//  ViewController.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 10/23/23.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    lazy var weatherTitle = UILabel()
    lazy var moreButton = UIButton()
    let searchBar = UITextField()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setupLayout()
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    // UI 세팅 작업
    private func setStyle() {
        self.view.backgroundColor = .black
        
        weatherTitle.text = "날씨"
        weatherTitle.textColor = .white
        weatherTitle.font = UIFont(name: "SFProDisplay-Bold", size: 36)
        
        
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        
        
        searchBar.borderStyle = .roundedRect
        searchBar.backgroundColor = UIColor(hexCode: "#FFFFFF", alpha: 0.1)
        searchBar.placeholder = "도시 또는 공항 검색"
        searchBar.setPlaceholderColor(UIColor(hexCode: "#FFFFFF", alpha: 0.5), UIFont(name: "SFProDisplay-Regular", size: 19))
        searchBar.textColor = .white
        searchBar.font = UIFont(name: "SFProDisplay-Regular", size: 19)
        searchBar.clearButtonMode = .whileEditing

        var leftView: UIView = {
            let view = UIView(frame: CGRectMake(0, 0, 32, 40))
            let overlayView = UIImageView(frame: CGRectMake(8, 8, 24, 24))
            overlayView.image = UIImage(named: "magnifyingGlass")
            view.addSubview(overlayView)
            return view
        }()
        searchBar.leftView = leftView
        searchBar.leftViewMode = .always
    }
    
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.view.addSubViews(weatherTitle, moreButton, searchBar)
        
        weatherTitle.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(53)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(67)
            make.height.equalTo(44)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(8)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(105)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(40)
        }
    }
    
}

// MARK: - Extensions
