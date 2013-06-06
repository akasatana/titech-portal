#coding:utf-8
class DocumentsController < ApplicationController
	before_filter :scraped
	skip_before_filter :verify_authenticity_token, :only => [:upload]

  def index
  	@ua = request.env['HTTP_USER_AGENT']
  	@documents = Document.all
  end

  def upload
  	begin
      file = params[:file]
      filename = file.original_filename
      redirect_to(documents_index_path, :notice => "同名のファイルが存在します ファイル名を変更してください") and return if Document.where(name: filename).exists?
      doc = current_user.documents.build(name: filename)
      doc.generate(file)
      redirect_to documents_index_path, :notice => "アップロードに成功しました"
    rescue
    	redirect_to documents_index_path, :notice => "アップロードに失敗しました"
    end
  end

  def download
  	doc = Document.find(params[:id])
  	send_file("public/docs/#{doc.name}")
  end

  def destroy
  	doc = Document.find(params[:id])
  	doc.delete
  	redirect_to documents_index_path, :notice => "ファイルを削除しました"
  end

  def scraped
  	redirect_to root_path, :notice => "一度スクレイピングを成功させなければアクセス出来ません" unless current_user.scraped 
  end
end
