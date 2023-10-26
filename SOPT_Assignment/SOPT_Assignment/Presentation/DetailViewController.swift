//
//  DetailViewController.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 10/26/23.
//

import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var backgroundImageView = UIImageView()
    
    private lazy var summaryStackView = UIStackView()
    private lazy var locationLabel = UILabel()
    private lazy var temperatureLabel = UILabel()
    private lazy var weatherLabel = UILabel()
    private lazy var temperatureRangeLabel = UILabel()
    
//    private lazy var descriptionText = UILabel()
//    private lazy var weatherTimelineStackView = UIStackView()
//    private lazy var weatherStateView = UIStackView()
//    private lazy var timeLabel = UILabel()
//    private lazy var weatherIcon = UIImage()
//    private lazy var liveTemperatureLabel = UILabel()
    
    
    
    private lazy var toolbarView = UIView()
    private lazy var mapButton = UIButton()
    private lazy var backMenuButton = UIButton()
    private lazy var indexStackView = UIStackView()
    private lazy var currentButton = UIButton()
    private lazy var nextButton = UIButton()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupLayout()
    }
    
    // MARK: - @IBAction Properties
    @objc fileprivate func navigationpop() {
        print("move")
        self.navigationController?.popViewController(animated: true)
    }
    // MARK: - @Functions
    // UI 세팅 작업
    private func setupStyle() {
        
        backgroundImageView.setupStyle {
            $0.image = .mainBackground
            $0.contentMode = .scaleAspectFill
        }
        
        summaryStackView.setupStyle {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 4
        }
        
        locationLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 36),
                text: "의정부시"
            )
        }
        
        temperatureLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Thin", size: 102),
                text: "21°"
            )
        }
        
        weatherLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 24),
                text: "흐림"
            )
        }
        
        temperatureRangeLabel.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Medium", size: 20),
                text: "최고:29°  최저:15°"
            )
        }
        
        toolbarView.layer.addBorder([.top], color: UIColor(hexCode: "#FFFFFF", alpha: 0.1), width: 0.4)
        
        indexStackView.setupStyle {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 4
        }
        
        mapButton.setupStyle {
            $0.setImage(.map, for: .normal)
        }
        
        backMenuButton.setupStyle {
            $0.setImage(.listBullet, for: .normal)
            $0.addTarget(self, action: #selector(navigationpop), for: .touchUpInside)
        }
        
        currentButton.setupStyle {
            $0.setImage(.paperPlane, for: .normal)
        }
        
        nextButton.setupStyle {
            $0.setImage(.dot, for: .normal)
        }
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        view.addSubViews(
            backgroundImageView, summaryStackView, toolbarView
        )
        summaryStackView.addArrangedSubviews(
            locationLabel, temperatureLabel, weatherLabel, temperatureRangeLabel
        )
        toolbarView.addSubViews(
            mapButton, indexStackView, backMenuButton
        )
        
        indexStackView.addArrangedSubviews(currentButton, nextButton)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        summaryStackView.snp.makeConstraints {
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(34)
        }
        
        toolbarView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(82)
        }
        
        mapButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalToSuperview().inset(4)
        }
        
        backMenuButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(9)
            $0.top.equalToSuperview().inset(4)
        }
        
        indexStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.centerX.equalToSuperview()
        }

    }
    
}

// MARK: - Extensions

