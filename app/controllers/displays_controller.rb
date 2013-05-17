#coding:utf-8
class DisplaysController < ApplicationController
	before_filter :create_base
	#before_filter :check_logged_in, :only => [:edit,:show]
	def home
	end
	def show
		@datas = Display.all
		@info = Scraper.first
	end
	def edit
		@datas = Display.all
		@info = Scraper.first
	end
	def create
		begin
		    Display.transaction do
		        params[:datas].each do |data|
			        key = Display.where(id: data[:id]).first
			        key.update_attributes!(data)
		        end
		    end
		rescue
			redirect_to displays_edit_path, :notice => "登録出来ませんでした"
		else
		    pass = Scraper.where(id: params[:info].first[:id]).first
		    if pass.update_attributes(params[:info].first)
		        redirect_to displays_edit_path, :notice => "登録しました"
		    else
		    	redirect_to displays_edit_path, :notice => "登録出来ませんでした"
		    end
		end
	end
	def create_base
		if Display.all.empty?
			7.times do
				data = Display.new
				data.save
			end
		end
		if Scraper.all.empty?
			@info = Scraper.new
			@info.save
		end
	end
	#private
	#def check_logged_in
		#authenticate_or_request_with_http_basic("Displays") do |username,password|
			#username == "12B15286" && password == "akasatana"
		#end
	#end
end







