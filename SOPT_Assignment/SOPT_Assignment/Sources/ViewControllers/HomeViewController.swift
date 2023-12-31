//
//  NewHomeViewController.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/6/23.
//

import UIKit
import SnapKit
import Then

final class HomeViewController: UIViewController {
    
    
    // MARK: - Properties
    private let navigationTitleText = "날씨"
    private let searchBarPlaceHolderText = "도시 또는 공항 검색"
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView(frame: CGRect(), style: .plain)
    private let rightBarButton = UIBarButtonItem()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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
    private func setUI() {
        setTableViewConfig()
        updateTableViewData()
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    // UI 세팅
    private func setStyle() {
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
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setHierarchy() {
        self.view.addSubview(tableView)
    }
    
    // TableView 세팅
    private func setTableViewConfig() {
        self.tableView.register(HomeVCLocationTableViewCell.self, forCellReuseIdentifier: HomeVCLocationTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}

// MARK: - Extensions

// tableView Confing
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocationListData.onlineData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeVCLocationTableViewCell.identifier, for: indexPath) as? HomeVCLocationTableViewCell else {return UITableViewCell()}
        cell.bindData(data: LocationListData.onlineData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCellData = LocationListData.onlineData[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.selectedCellData = selectedCellData
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

// Update with Network Data
extension HomeViewController {
    func weatherInfo(of location: String) async throws -> CurrentLocationWeatherData {
        let baseURL = Config.plistValue(forKey: Config.Keys.Plist.weatherBaseURL)
        let APIKey = Config.plistValue(forKey: Config.Keys.Plist.weatherAPIKey)
        
        guard let url = URL(string: baseURL + "/weather?q=\(location)" + "&units=metric" + "&lang=kr" + "&appid=\(APIKey)") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard response is HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        let decodedData = try JSONDecoder().decode(CurrentLocationWeatherData.self, from: data)
        
        return decodedData
    }
    
    func updateTableViewData() {
        Task {
            do {
                for location in Location.allCases {
                    let data = try await self.weatherInfo(of: location.englishName)
                    let locationListData = CurrentLocationWeatherData.bindOnlineData(data: data)
                    LocationListData.onlineData.append(locationListData)
                }
            } catch {
                print(error)
            }
            self.tableView.reloadData()
        }
    }
}
