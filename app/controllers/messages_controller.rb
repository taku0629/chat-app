class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def new
    # 新しいメッセージの作成フォームを表示する処理
  end

  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)

    if @message.save
      # メッセージが正常に保存された場合の処理
      redirect_to messages_path(@room)  # メッセージ一覧画面にリダイレクト
    else
      # メッセージの保存に失敗した場合の処理
      render :index, status: :unprocessable_entity
    end
  end

end
