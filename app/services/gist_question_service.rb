class GistQuestionService

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
    Result.new(@client.last_response)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

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

class Result

  attr_reader :html_url

  def initialize(response)
    @html_url = response.data[:html_url]
  end

  def success?
    @html_url.present?
  end
end
