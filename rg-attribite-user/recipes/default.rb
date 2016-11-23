#
# Cookbook Name:: rg-attribite-user
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



if node["platform"] == "centos"
        puts "This is centos"

        node["rg-attribite-user"].each do |user, data|

		username = data["name"]

		user data["name"] do
                        comment data["comment"]
                        home "/home/#{data["name"]}"
                end

                puts "Creating file from template"

                template "/tmp/#{username}" do

                        source "userdata.erb"
                        mode "0644"

                        variables(
                                :name => data["name"],
                                :homedir => "/home/#{data["name"]}",
                                :comment => data["comment"],
                                :myos => node["platform"]
                        )

                end


        end

        puts "This is not cent os"
end
