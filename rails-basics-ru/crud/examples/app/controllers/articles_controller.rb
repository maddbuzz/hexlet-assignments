class ArticlesController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      # Flash сообщение
      # Сообщение рендерится в базовом шаблоне app/views/layouts/application.html.erb
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'New article was successfully created'
      # Выполняется новый полноценный запрос

      redirect_to article_path(@article)
    else
      flash[:failure] = 'Article cannot be created'
      # Отрисовывается форма создания, все параметры остаются
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      # Flash сообщение
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'Article was successfully updated'
      # Выполняется новый полноценный запрос

      redirect_to article_path(@article)
    else
      flash[:failure] = 'Article cannot be updated'
      # Отрисовывается форма создания, все параметры остаются
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      # Flash сообщение
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'article was successfully deleted'
      # Выполняется новый полноценный запрос

      redirect_to root_path
    else
      flash[:failure] = 'Article cannot be deleted'
      # Отрисовывается форма создания, все параметры остаются
      redirect_to article_path(@article)
    end
  end

  private

  def article_params
    # Требуем наличия ключа :article в params. Разрешаем использовать только некоторые ключи
    params.required(:article).permit(:title, :body, :author)
  end
end
