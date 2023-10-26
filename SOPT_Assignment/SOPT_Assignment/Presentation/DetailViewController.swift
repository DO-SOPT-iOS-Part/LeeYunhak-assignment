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
    
    private lazy var detailContentsView = UIView()
    private lazy var descriptionText = UILabel()
    private lazy var dividerView = UIView()
    private lazy var weatherTimelineScrollView = UIScrollView()
    private lazy var weatherTimelineContentView = UIStackView()
    private lazy var weatherStateView = WeatherStateView()
    private lazy var weatherStateView2 = WeatherStateView()
    private lazy var weatherStateView3 = WeatherStateView()
    private lazy var weatherStateView4 = WeatherStateView()
    private lazy var weatherStateView5 = WeatherStateView()
    private lazy var weatherStateView6 = WeatherStateView()
    private lazy var weatherStateView7 = WeatherStateView()
    private lazy var weatherStateView8 = WeatherStateView()

    
    
    
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
        //print("move")
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
        toolbarView.addTopBorder(with: UIColor(white: 1, alpha: 0.3), andWidth: 0.4)
        
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
        
        detailContentsView.backgroundColor = UIColor(white: 1, alpha: 0.03)
        detailContentsView.layer.cornerRadius = 15
        detailContentsView.layer.borderWidth = 0.5
        detailContentsView.layer.borderColor = UIColor(white: 1, alpha: 0.25).cgColor
        
        descriptionText.setupStyle {
            $0.setBasic (
                font: UIFont(name: "SFProDisplay-Regular", size: 18),
                text: "08:00~09:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다."
            )
            $0.numberOfLines = 2
        }
        
        dividerView.addTopBorder(with: UIColor(white: 1, alpha: 0.5), andWidth: 0.2)
        
        weatherTimelineScrollView.setupStyle {
            $0.alwaysBounceHorizontal = true
            $0.showsHorizontalScrollIndicator = false
        }
        weatherTimelineContentView.setupStyle {
            $0.axis = .horizontal
            $0.spacing = 22
        }
        
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        view.addSubViews(
            backgroundImageView, summaryStackView, detailContentsView, toolbarView
        )
        summaryStackView.addArrangedSubViews(
            locationLabel, temperatureLabel, weatherLabel, temperatureRangeLabel
        )
        toolbarView.addSubViews(
            mapButton, indexStackView, backMenuButton
        )
        
        indexStackView.addArrangedSubViews(
            currentButton, nextButton
        )
        
        detailContentsView.addSubViews(
            descriptionText, dividerView, weatherTimelineScrollView
        )
        
        weatherTimelineScrollView.addSubViews(weatherTimelineContentView)
        
        weatherTimelineContentView.addArrangedSubViews(
            weatherStateView, weatherStateView2, weatherStateView3, weatherStateView4, weatherStateView5, weatherStateView6, weatherStateView7, weatherStateView8
        )
        
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
        
        detailContentsView.snp.makeConstraints {
            $0.top.equalTo(summaryStackView.snp.bottom).offset(44)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(212)
        }
        
        descriptionText.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
        
        dividerView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(1)
            $0.top.equalTo(descriptionText.snp.bottom).offset(11)
            $0.height.equalTo(4)
            $0.leading.equalToSuperview().inset(14)
        }
        
        weatherTimelineScrollView.snp.makeConstraints {
            $0.top.equalTo(dividerView).offset(10)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview()
        }
        
        weatherTimelineContentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
    }
    
}

// MARK: - Extensions

