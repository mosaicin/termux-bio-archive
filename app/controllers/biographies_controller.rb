class BiographiesController < ApplicationController
  def index
    @biographies = Biography.publicly_visible.order(created_at: :desc)
  end

  def show
    @biography = Biography.publicly_visible.find_by!(slug: params[:slug])
    @response = @biography.responses.new(status: "pending")
    @open_question = @biography.open_questions.new(status: "open")
  end

  def create_response
    biography = Biography.publicly_visible.find(params[:id])
    response = biography.responses.new(response_params.merge(status: "pending"))
    if response.save
      redirect_to biography_path(biography.slug), notice: "Ответ отправлен на редакционную проверку."
    else
      redirect_to biography_path(biography.slug), alert: "Ответ не отправлен: #{response.errors.full_messages.to_sentence}."
    end
  end

  def create_question
    biography = Biography.publicly_visible.find(params[:id])
    question = biography.open_questions.new(question_params.merge(status: "open"))
    if question.save
      redirect_to biography_path(biography.slug), notice: "Вопрос добавлен в архив открытых вопросов."
    else
      redirect_to biography_path(biography.slug), alert: "Вопрос не добавлен: #{question.errors.full_messages.to_sentence}."
    end
  end

  private

  def response_params
    params.require(:response).permit(:name, :body)
  end

  def question_params
    params.require(:open_question).permit(:prompt)
  end
end
