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

    private lazy var weatherTitle = UILabel()
    private lazy var moreButton = UIButton()
    private lazy var searchBar = UITextField()
    
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIStackView()
    private lazy var locationListButton = LocationListButton()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupLayout()
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    // UI 세팅 작업

    
    private func setupStyle() {
        self.view.backgroundColor = .black
        
        weatherTitle.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Bold", size: 36),
                text: "날씨"
            )
        }
        moreButton.setupStyle {
            $0.setImage(UIImage(named: "more"), for: .normal)
        }
        
        
        searchBar.setupStyle {
            $0.borderStyle = .roundedRect
            $0.backgroundColor = UIColor(hexCode: "#FFFFFF", alpha: 0.1)
            $0.placeholder = "도시 또는 공항 검색"
            $0.setPlaceholderColor(UIColor(hexCode: "#FFFFFF", alpha: 0.5), UIFont(name: "SFProDisplay-Regular", size: 19))
            $0.textColor = .white
            $0.font = UIFont(name: "SFProDisplay-Regular", size: 19)
            $0.clearButtonMode = .whileEditing

            let leftView: UIView = {
                let view = UIView(frame: CGRectMake(0, 0, 32, 40))
                let overlayView = UIImageView(frame: CGRectMake(8, 8, 24, 24))
                overlayView.image = UIImage(named: "magnifyingGlass")
                view.addSubview(overlayView)
                return view
            }()
            $0.leftView = leftView
            $0.leftViewMode = .always
        }
    }
    
    
    // 레이아웃 세팅
    private func setupLayout() {
        view.addSubViews(weatherTitle, moreButton, searchBar, locationListButton)
        weatherTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(53)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.width.equalTo(67)
            make.height.equalTo(44)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(105)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(40)
        }
        
        
        
        
        locationListButton.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(117)
        }
    }
    
}

// MARK: - Extensions
