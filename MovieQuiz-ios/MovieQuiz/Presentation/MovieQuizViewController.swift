import UIKit

import UIKit

final class MovieQuizViewController: UIViewController, StatisticServiceProtocol, QuestionFactoryDelegate, AlertPresenterDelegate {
    
    
    // MARK: - Lifecycle
    private var questionFactory: QuestionFactoryProtocol = QuestionFactory()
    private let alertPresenter = AlertPresenter()
    private let statisticService = StatisticService()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 20
        yesButton.layer.cornerRadius = 15
        noButton.layer.cornerRadius = 15
        alertPresenter.setup(delegate: self)
        let questionFactory = QuestionFactory()
        questionFactory.setup(delegate: self)
        self.questionFactory = questionFactory
        questionFactory.requestNextQuestion()
    }

    func didReceiveNextQuestion(question: QuizQuestion?) {
        guard let question = question else {
            return
        }
        currentQuestion = question
        let viewModel = convert(model: question)
        DispatchQueue.main.async { [weak self] in
            self?.show(quiz: viewModel)
        }
    }

    // свойства
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var yesButton: UIButton!
    @IBOutlet private weak var noButton: UIButton!
    private var currentQuestionIndex: Int = 0
    private var correctAnswers: Int = 0
    private let questionsAmount: Int = 10
    private var currentQuestion: QuizQuestion?
    // методы
    
    var gamesCount: Int {
        statisticService.gamesCount
    }
    
    var bestGame: GameResult {
        statisticService.bestGame
    }
    
    var totalAccuracy: Double {
        statisticService.totalAccuracy
    }
    
    func store(result: GameResult) {
        statisticService.store(result: statisticService.bestGame)
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        showAnswerResult(isCorrect: false)
    }

    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        showAnswerResult(isCorrect: true)
    }

    // функция конвертации
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let viewModel = QuizStepViewModel(image: UIImage(named: model.image) ?? UIImage(),
        question: model.text,questionNumber: "\(currentQuestionIndex + 1)/\(questionsAmount)")
        return viewModel
    }

    // задаем параметры для наших переменных
    private func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }

    // в зависимости от результата переходим к следующему вопросу либо показываем финальный экран и алерт
    private func showNextQuestionOrResults() {
        if currentQuestionIndex == questionsAmount - 1 {
            let text = "Ваш результат: \(correctAnswers)/11"
            let viewModel = QuizResultsViewModel(title: "Этот раунд окончен!",
            text: text, buttonText: "Сыграть ещё раз")
            showResult(quiz: viewModel)
        } else {
            currentQuestionIndex += 1
            questionFactory.requestNextQuestion()
        }
    }

    // показывает результат вопроса, перекрашивая цвет рамки
    private func showAnswerResult(isCorrect: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        guard let currentQuestion = currentQuestion else { return }
        let answer = currentQuestion.correctAnswer
        if answer == isCorrect {
            imageView.layer.borderColor = UIColor.green.cgColor
            correctAnswers += 1
        } else {
            imageView.layer.borderColor = UIColor.red.cgColor
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.imageView.layer.borderColor = UIColor.clear.cgColor
            self.showNextQuestionOrResults()
        }
        self.disableButtons()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.enableButtons()
        }
    }

    // функция для выключения нажатия кнопки на секунду, чтобы нельзя было спамить на них, тем самым влияя на конечный результат
    private func disableButtons() {
        yesButton.isEnabled = false
        noButton.isEnabled = false
    }

    private func enableButtons() {
        yesButton.isEnabled = true
        noButton.isEnabled = true
    }

    // показывает результаты квиза
    private func showResult(quiz result: QuizResultsViewModel) {
        let alertModel = AlertModel(
            title: result.title,
            message: """
            Количество сыграннх квизов : \(statisticService.bestGame.total) \n
            Рекорд : \(statisticService.bestGame.correct)
            Средняя точность : \(self.totalAccuracy)
            """,
            buttonText: result.buttonText,
            completion: { [weak self] in
                guard let self = self else { return }
                self.currentQuestionIndex = 0
                self.correctAnswers = 0
                self.questionFactory.requestNextQuestion()
            }
        )

        alertPresenter.alertStartNewGame(on: self, with: alertModel)
    }
    
    // Реализация метода делегата AlertPresenterDelegate
    func didReceiveAlertModel(alertModel: AlertModel?) {
        guard let alertModel = alertModel else { return }
        alertPresenter.alertStartNewGame(on: self, with: alertModel)
    }
}
