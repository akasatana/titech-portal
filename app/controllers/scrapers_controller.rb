#encoding: utf-8
class ScrapersController < ApplicationController
	def scrape
		driver = Selenium::WebDriver.for :chrome #safari,firefox,ieでの対応も
		driver.get "http://portal.titech.ac.jp"

		failure = 0
		loop do
		    driver.find_element(:name => "login2").submit
            if driver.find_element(:name => "login").text.include?("Authentication Method")
			    driver.navigate.back
			    failure += 1
			elsif failure >= 5
				driver.quit
				redirect_to(root_path, :notice => "スクレイピングに失敗しました もう一度やり直してください") and return
			else
				break
			end
		end

		info = Account.where(user_id: current_user.id).first
		driver.find_element(:name => "usr_name").send_keys info.usr_name
		driver.find_element(:name => "usr_password").send_keys info.usr_password
		driver.find_element(:name => "OK").click

        begin
		  str = driver.find_element(:name => "login").text.split("\n")
          index = 2
          while index < 5
            part = str[index].delete("[]").split(",")
		    char = part[0]
		    row = part[1].to_i
		    data = Table.where(user_id: current_user.id)[row - 1]
		    column = case char
		    when "A" then data.col1
		    when "B" then data.col2
		    when "C" then data.col3
		    when "D" then data.col4
		    when "E" then data.col5
		    when "F" then data.col6
		    when "G" then data.col7
		    when "H" then data.col8
		    when "I" then data.col9
		    when "J" then data.col10
		    end
		    driver.find_element(:name => "message#{index + 1}").send_keys column
		    index += 1
		  end
		  driver.find_element(:name => "OK").click
		  driver.find_element(:link_text => "Tokyo Tech Mail")
		  redirect_to root_path, :notice => "スクレイピングに成功しました"
		  unless current_user.scraped
		  	current_user.update_attributes!({scraped: true}, without_protection: true)
		  end
		rescue Selenium::WebDriver::Error::NoSuchElementError
			driver.quit
	    redirect_to(root_path, :notice => "スクレイピングに失敗しました 入力が間違っている可能性があります") and return
		end 
	end
end
