#
# Cookbook Name:: rg-new-databaguser
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

search(:localusers, "*:*").each do |data|
	user data["name"] do
		comment data["comment"]
		home data["homedir"]
	end
end
