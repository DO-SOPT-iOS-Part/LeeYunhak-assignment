//
//  NewHomeViewController.swift
//  SOPT_Assignment
//
//  Created by 이윤학 on 11/6/23.
//

import UIKit
import Then

final class HomeViewController: UIViewController {
    
    
    // MARK: - Properties
    private var currentLocationWeatherData: [CurrentLocationWeatherData] = []
    
    private let navigationTitleText = "날씨"
    private let searchBarPlaceHolderText = "도시 또는 공항 검색"
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableView = UITableView(frame: CGRect(), style: .plain)
    private let rightBarButton = UIBarButtonItem()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData(of: "gumi")
        self.getData(of: "seoul")
        self.getData(of: "jeju")
        self.getData(of: "busan")
        self.getData(of: "seosan")
        self.getData(of: "sokcho")
        
        self.setUI()
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentLocationWeatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeVCLocationTableViewCell.identifier, for: indexPath) as? HomeVCLocationTableViewCell else {return UITableViewCell()}
        cell.bindOnlineData(data: currentLocationWeatherData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let selectedCellData = LocationListData.dummyData[indexPath.row]
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController {
    func getData(of location: String) {
        let baseURL = Config.plistValue(forKey: Config.Keys.Plist.weatherBaseURL)
        let APIKey = Config.plistValue(forKey: Config.Keys.Plist.weatherAPIKey)
        
        guard let url = URL(string: baseURL + "/weather?q=\(location)" + "&units=metric" + "&appid=\(APIKey)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { [self] (data, response, error) in
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(CurrentLocationWeatherData.self, from: data)
                self.currentLocationWeatherData.append(decodedData)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
}

