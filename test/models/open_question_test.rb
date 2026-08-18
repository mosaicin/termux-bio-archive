require "test_helper"

class OpenQuestionTest < ActiveSupport::TestCase
  test "accepts an open question" do
    biography = Biography.create!(title: "Question test", slug: "question-test", summary: "S", body: "B", author_name: "Desk", fictional: true, status: "draft")
    question = OpenQuestion.new(biography: biography, prompt: "What evidence is still missing?", status: "open")
    assert question.valid?
  end

  test "rejects unknown statuses" do
    biography = Biography.create!(title: "Invalid question test", slug: "invalid-question-test", summary: "S", body: "B", author_name: "Desk", fictional: true, status: "draft")
    question = OpenQuestion.new(biography: biography, prompt: "What evidence is still missing?", status: "convicted")
    assert_not question.valid?
  end
end
