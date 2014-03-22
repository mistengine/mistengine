class Admin::CoversController < ApplicationController
  before_action :set_cover, only: [:show, :edit, :update, :destroy]

  def index
    @covers = Cover.all
  end

  def show
  end

  def new
    @cover = Cover.new
  end

  def edit
  end

  def create
    @cover = Cover.new(cover_params)

    respond_to do |format|
      if @cover.save
        format.html { redirect_to admin_covers_path, notice: 'Cover was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @cover.update(cover_params)
        format.html { redirect_to admin_covers_path, notice: 'Cover was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @cover.destroy
    redirect_to admin_covers_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cover
    @cover = Cover.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow
  # the white list through.
  def cover_params
    params.require(:cover).permit(:article_id, :title, :url, :description,
                                  :active, :weight, :image)
  end
end
