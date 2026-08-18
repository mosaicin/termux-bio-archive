demo = Biography.find_or_initialize_by(slug: "the-cartographer-of-open-questions")
demo.update!(
  title: "Картограф открытых вопросов",
  summary: "Вымышленная биография о человеке, который собирал свидетельства и учился отличать факт от слуха.",
  body: "Это художественный пример. Его задача — показать структуру материала, а не утверждать реальные события. Каждая версия сопровождается источником, уровнем проверки и возможностью ответа.",
  status: "published",
  fictional: true,
  author_name: "Редакционная мастерская"
)
demo.sources.find_or_create_by!(title: "Методика проверки источников", url: "https://example.org/method", notes: "Демонстрационная ссылка; замените её на реальный проверяемый источник.")
demo.open_questions.find_or_create_by!(prompt: "Какие утверждения требуют независимого подтверждения?", status: "open")
