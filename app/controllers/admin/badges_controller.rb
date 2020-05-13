class Admin::BadgesController < Admin::BaseController

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to :admin_badges
    else
      render :new
    end
  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    redirect_to admin_badges_path, notice: 'Badge deleted!'
  end

  private

  def badge_params
    name = params[:badge][:name]
    if params[:badge][:exact_test] == "true"
      exact_test = true
      test_id = params[:badge][:test_id].to_i
    else
      exact_test = false
      category = params[:badge][:category].nil? ? nil : params[:badge][:category].join
      level = params[:badge][:level].nil? ? nil : params[:badge][:level].join
    end
    attempts = params[:badge][:attempts].to_i == 0 ? nil : params[:badge][:attempts].to_i
    image = params[:badge][:image]

    {name: name, exact_test: exact_test, test_id: test_id, category: category, level: level, attempts: attempts, image: image}
  end
end
