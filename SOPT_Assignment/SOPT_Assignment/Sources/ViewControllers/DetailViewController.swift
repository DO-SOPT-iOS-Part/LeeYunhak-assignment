//
//  NewDetailViewController.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/10/23.
//


import UIKit
import SnapKit
import Then

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    var selectedCellData: LocationListData?
    private let backgroundImageView = UIImageView()
    
    private let pageScrollView = UIScrollView()
    private let pageContentView = UIStackView()
    
    private let summaryStackView = DetailVCSummaryStackView()
    private let weatherTimelineView = DetailVCWeatherTimelineView()
    private let weatherForecastTableView = DetailVCWeatherForecastTableView()
    private let toolbarView = DetailVCToolBarView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - @IBAction Properties
    @objc fileprivate func navigationpop() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - @Functions
    // UI 세팅 작업
    
    private func setUI() {
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    private func setStyle() {
        backgroundImageView.do {
            $0.image = .mainBackground
            $0.contentMode = .scaleAspectFill
        }
        
        pageScrollView.do {
            $0.alwaysBounceVertical = true
            $0.showsVerticalScrollIndicator = false
        }
        
        pageContentView.do {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 20
        }
        summaryStackView.bindData(data: selectedCellData)
        
        toolbarView.backMenuButton.do {
            $0.addTarget(self, action: #selector(navigationpop), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageScrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(34)
            $0.bottom.equalTo(toolbarView.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        toolbarView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(82)
        }
        
        pageContentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        weatherTimelineView.snp.makeConstraints {
            $0.height.equalTo(212)
            $0.horizontalEdges.equalToSuperview()
        }
        
        weatherForecastTableView.snp.makeConstraints {
            $0.height.equalTo(675)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setHierarchy() {
        view.addSubViews(
            backgroundImageView, pageScrollView, toolbarView
        )
        
        pageScrollView.addSubViews(
            pageContentView
        )
        
        pageContentView.addArrangedSubViews(
            summaryStackView, weatherTimelineView, weatherForecastTableView
        )
    }
}

// MARK: - Extensions

