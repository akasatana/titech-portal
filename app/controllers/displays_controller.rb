#coding:utf-8
class DisplaysController < ApplicationController
	#before_filter :create_base
	#before_filter :check_logged_in, :only => [:edit,:show]
	def home
		#多分場所オカシイ
		redirect_to new_user_session_path unless user_signed_in?
	end
	def show
		@datas = Table.where(user_id: current_user.id)
		@info = Account.where(user_id: current_user.id).first
	end
	def edit
		@datas = Table.where(user_id: current_user.id)
		@info = Account.where(user_id: current_user.id).first
	end
	def create
		begin
		    Table.transaction do
		        params[:datas].each do |data|
			        key = Table.where(id: data[:id]).first
			        key.update_attributes!(data)
		        end
		    end
		rescue
			redirect_to displays_edit_path, :notice => "登録出来ませんでした"
		else
		    pass = Account.where(id: params[:info].first[:id]).first
		    if pass.update_attributes(params[:info].first)
		        redirect_to displays_edit_path, :notice => "登録しました"
		    else
		    	redirect_to displays_edit_path, :notice => "登録出来ませんでした"
		    end
		end
	end
	#アカウントを作ったらこれを実行させる あるいはapplication_controller
	#def create_base
		#if Table.all.empty?
			#7.times do
				#data = Table.new(user_id: current_user.id)
				#data.save
			#end
		#end
		#if Account.all.empty?
			#@info = Account.new(user_id: current_user.id)
			#@info.save
		#end
	#end
	#private
	#def check_logged_in
		#authenticate_or_request_with_http_basic("Displays") do |username,password|
			#username == "12B15286" && password == "akasatana"
		#end
	#end
end







