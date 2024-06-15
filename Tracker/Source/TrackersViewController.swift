//
//  TrackersViewController.swift
//  Tracker
//
//  Created by Архип Семёнов on 07.06.2024.
//


import UIKit

final class TrackersViewController: UIViewController, UISearchBarDelegate {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        datePicker.date = Date()
        setupUI()
    }
    
    // MARK: - Public Methods
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.text = ""
        return true
    }
    
    // MARK: - Setup UI
    private func setupPlusButtonAndDatePicker() {
        let datePickerContainer = UIView()
        datePickerContainer.translatesAutoresizingMaskIntoConstraints = false
        datePickerContainer.addSubview(datePicker)
        datePicker.centerYAnchor.constraint(equalTo: datePickerContainer.centerYAnchor).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: datePickerContainer.leadingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: datePickerContainer.trailingAnchor).isActive = true
        datePickerContainer.heightAnchor.constraint(equalTo: datePicker.heightAnchor).isActive = true
        datePickerContainer.widthAnchor.constraint(equalTo: datePicker.widthAnchor).isActive = true

        let datePickerBarButton = UIBarButtonItem(customView: datePickerContainer)
        let plusBarButton = UIBarButtonItem(customView: plusButton)

        navigationItem.leftBarButtonItem = plusBarButton
        navigationItem.rightBarButtonItem = datePickerBarButton

        view.addSubview(datePickerContainer)
        NSLayoutConstraint.activate([
            datePickerContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            datePickerContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        ])
    }

    private func setupLargeTitle() {
        NSLayoutConstraint.activate([
            largeTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            largeTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            largeTitle.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
            largeTitle.heightAnchor.constraint(equalToConstant: 41)
        ])
    }
    
    private func setupSmallTitle() {
        NSLayoutConstraint.activate([
                    smallErrorTitle.topAnchor.constraint(equalTo: trackingErrorImage.bottomAnchor, constant: 8),
                    smallErrorTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    smallErrorTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    smallErrorTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
                ])
    }

    private func setupFailureImage() {
        NSLayoutConstraint.activate([
            trackingErrorImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trackingErrorImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            trackingErrorImage.heightAnchor.constraint(equalToConstant: 80),
            trackingErrorImage.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupSearchField() {
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBar.topAnchor.constraint(equalTo: largeTitle.bottomAnchor, constant: 7)
        ])
    }
    
    private func setupUI() {
        setupPlusButtonAndDatePicker()
        view.addSubview(largeTitle)
        view.addSubview(trackingErrorImage)
        view.addSubview(searchBar)
        view.addSubview(smallErrorTitle)
        
        setupLargeTitle()
        setupFailureImage()
        setupSearchField()
        setupSmallTitle()
    }
    
    // MARK: - Visual Components
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Plus Button"), for: .normal)
        button.tintColor = .black
        button.heightAnchor.constraint(equalToConstant: 42).isActive = true
        button.widthAnchor.constraint(equalToConstant: 42).isActive = true
        if let imageView = button.imageView {
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 18),
                imageView.heightAnchor.constraint(equalToConstant: 19)
            ])
        }
        return button
    }()
    
    private lazy var datePicker: UIDatePicker = {
        
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.heightAnchor.constraint(equalToConstant: 34).isActive = true
        datePicker.widthAnchor.constraint(equalToConstant: 100).isActive = true
        datePicker.date = Date()
        return datePicker
    }()
    
    private lazy var largeTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Трекеры"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    private lazy var smallErrorTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Что будем отслеживать?"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.text = "Поиск"
        search.showsCancelButton = false
        search.delegate = self
        search.searchBarStyle = .minimal
        search.searchTextField.textColor = UIColor.gray
        search.setImage(UIImage(), for: .clear, state: .normal)
        search.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        if let searchIconView = search.searchTextField.leftView as? UIImageView {
            searchIconView.image = searchIconView.image?.withRenderingMode(.alwaysTemplate)
            searchIconView.tintColor = UIColor.gray
        }
        return search
    }()
    
    private lazy var trackingErrorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.image = UIImage(named: "Tracking Error")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

}
