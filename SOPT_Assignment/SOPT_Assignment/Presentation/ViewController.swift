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
    private lazy var test = LocationListButton()
    private lazy var test2 = LocationListButton()
    private lazy var test3 = LocationListButton()
    private lazy var test4 = LocationListButton()
    private lazy var test5 = LocationListButton()
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
        scrollView.setupStyle {
            $0.showsVerticalScrollIndicator = false
            $0.alwaysBounceVertical = true
            
        }
    
        contentView.setupStyle {
            $0.axis = .vertical
            $0.spacing = 16
        }
    }
    
    
    // 레이아웃 세팅
    private func setupLayout() {
        view.addSubViews(weatherTitle, moreButton, searchBar, scrollView)
        scrollView.addSubview(contentView)
        //contentView.addArrangedSubviews(locationListButton, test, test2, test3, test4, test5)
        contentView.addArrangedSubviews(locationListButton)
        weatherTitle.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(53)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.width.equalTo(67)
            $0.height.equalTo(44)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.width.equalTo(44)
            $0.height.equalTo(44)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(105)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.height.equalTo(40)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(15)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
//        locationListButton.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.width.equalToSuperview()
//            $0.height.equalTo(117)
//        }
    }
    
}

// MARK: - Extensions
