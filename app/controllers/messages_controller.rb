class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  def create
    # {name: 'hogehoge', body: 'hugahuga'}
    @message = Message.new
    if @message.save(message_params)
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
      #メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end
  
  def edit
  end

  def update
    if @message.update(message_params)
      #保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      #保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
  
  private
  
  def message_params
    # params = {message: {name: 'hogehoge', body: 'hugahuga'}}
    # params.require(:message) # {name: 'hogehoge', body: 'hugahuga', id: 3}
    params.require(:message).permit(:name, :body, :url)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
end
