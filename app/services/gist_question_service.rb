class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
    # method return number of response. 2XX - success
    @client.last_response
  end

  private

  def gist_params
    {
        description: (I18n.translate('services.gist_question_service.gist_params.description', title: @test.title)),
        files: {
            I18n.translate('services.gist_question_service.gist_params.file_name') => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
