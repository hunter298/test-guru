class Admin::BadgesController < Admin::BaseController

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.parameter += case params[:parameter_type]
                        when 'Single test'
                          'tst'
                        when 'Success from N attempts'
                          'atm'
                        when 'All test of certain category'
                          'ctg'
                        when 'All test of certain level'
                          'lvl'
                        end

    if @badge.save
      redirect_to admin_badges_path
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
    params.require(:badge).permit(:name, :image, :parameter)
  end
end
