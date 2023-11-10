//
//  NewHomeViewController.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/6/23.
//

import UIKit
import Then

final class NewHomeViewController: UIViewController {
    
    // MARK: - Properties
    private let navigationTitleText = "날씨"
    private let searchBarPlaceHolderText = "도시 또는 공항 검색"
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView(frame: CGRect(), style: .insetGrouped)
    private let rightBarButton = UIBarButtonItem()
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - @IBAction Properties
    
    // MARK: - @Functions
    // 전체 세팅
    private func setup() {
        setupUI()
        setupTableView()
        setupLayout()
    }
    
    // UI 세팅
    private func setupUI() {
        // view
        self.view.backgroundColor = .black
        
        // Navigation Title
        self.navigationController?.navigationBar.do {
            $0.barStyle = .black
            $0.largeTitleTextAttributes = [.font: UIFont(name: "SFProDisplay-Bold", size: 36) ?? UIFont()]
            $0.titleTextAttributes = [.foregroundColor: UIColor.white]
            $0.prefersLargeTitles = true
            $0.tintColor = .white
        }
        self.navigationItem.do {
            $0.title = navigationTitleText
            $0.searchController = searchController
            $0.hidesSearchBarWhenScrolling = false
            
        }
        
        // Navigation Bar Button Item
        rightBarButton.do {
            $0.image = UIImage(named: "more")
        }
        self.navigationController?.navigationBar.do {
            $0.topItem?.rightBarButtonItem = rightBarButton
        }
        
        // UISearchController
        searchController.do {
            $0.searchBar.placeholder = searchBarPlaceHolderText
            $0.searchBar.setValue("취소", forKey: "cancelButtonText")
            $0.searchBar.tintColor = .white
        }
        
        // TableView
        tableView.do {
            $0.backgroundColor = .clear
            $0.rowHeight = 133
        }
    }
    
    // 레이아웃 세팅
    private func setupLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // TableView 세팅
    private func setupTableView() {
        self.tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}

// MARK: - Extensions

extension NewHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocationListData.dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as? LocationTableViewCell else {return UITableViewCell()}
        cell.bindData(data: LocationListData.dummyData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCellData = LocationListData.dummyData[indexPath.row]
        let detailVC = NewDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
