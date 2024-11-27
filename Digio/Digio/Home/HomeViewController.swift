//
//  HomeViewController.swift
//  Digio
//
//  Created by Matheus Campos on 25/11/24.
//
import UIKit

class HomeViewController: UIViewController {
    // MARK: Private variables
    private var viewModel: HomeViewModel!
    private lazy var homeView: HomeView = {
        return HomeView()
    }()

    // MARK: - View Lifecycle
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.setup(icon: UIImage(named: "DigioLogo")!, title: "Olá, Matheus")
    }
}
