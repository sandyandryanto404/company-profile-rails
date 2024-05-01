=begin
 * This file is part of the Sandy Andryanto Company Profile Website.
 *
 * @author     Sandy Andryanto <sandy.andryanto404@gmail.com>
 * @copyright  2024
 *
 * For the full copyright and license information,
 * please view the LICENSE.md file that was distributed
 * with this source code.
=end

require 'faker'

class PageController < ApplicationController

    def ping
        response = {
            message: "ok",
            status: true,
            data: nil
        }
        render :json => response, :status => :ok
    end

    def home

        articles = Article.select("
            articles.*,
            users.first_name,
            users.last_name,
            users.gender,
            users.about_me
        ")
        .where("articles.status = 1")
        .joins("INNER JOIN users ON users.id = articles.user_id")
        .limit(4)
        .order("articles.id desc")

        data = {
            header: {
                title: Faker::Lorem.paragraph(sentence_count: 2),
                description: Faker::Lorem.paragraph(sentence_count: 10)
            },
            sliders: Slider.where("status = 1").order("sort asc"),
            services: Service.where("status = 1").limit(4).order("sort asc"),
            testimonial: Service.where("status = 1").order("id desc").first,
            articles: articles
        }

        response = {
            message: "ok",
            status: true,
            data: data
        }
        render :json => response, :status => :ok
    end

    def about

        data = {
            header: {
                title: Faker::Lorem.paragraph(sentence_count: 2),
                description: Faker::Lorem.paragraph(sentence_count: 10)
            },
            section1: {
                title: Faker::Lorem.paragraph(sentence_count: 2),
                description: Faker::Lorem.paragraph(sentence_count: 20)
            },
            section2: {
                title: Faker::Lorem.paragraph(sentence_count: 2),
                description: Faker::Lorem.paragraph(sentence_count: 20)
            },
            teams: Team.where("status = 1").order("sort asc"),
        }

        response = {
            message: "ok",
            status: true,
            data: data
        }
        render :json => response, :status => :ok
    end

    def service

        data = {
            header: {
                title: Faker::Lorem.paragraph(sentence_count: 2),
                description: Faker::Lorem.paragraph(sentence_count: 10)
            },
            services: Service.where("status = 1").order("sort asc"),
            customers: Customer.where("status = 1").order("sort asc"),
            testimonials: Testimonial.where("status = 1").order("sort asc")
        }
        
        response = {
            message: "ok",
            status: true,
            data: data
        }
        render :json => response, :status => :ok

    end

    def faq

        data = {
            faq1: Faq.where("status = 1 AND sort <= 5").order("sort asc"),
            faq2: Faq.where("status = 1 AND sort > 5").order("sort asc")
        }
        
        response = {
            message: "ok",
            status: true,
            data: data
        }
        render :json => response, :status => :ok

    end

    def contact
        response = {
            message: "ok",
            status: true,
            data: {
                service: Service.where("status = 1").order("sort asc")
            }
        }
        render :json => response, :status => :ok
    end

    def message

        if(!params.has_key?(:name))
            payload = {
                message: "The field 'name' can not be empty!",
                status: false,
                data: nil
            }
            render :json => payload, :status => :bad_request
            return
        end

        if(!params.has_key?(:email))
            payload = {
                message: "The field 'email' can not be empty!",
                status: false,
                data: nil
            }
            render :json => payload, :status => :bad_request
            return
        end

        if(!params.has_key?(:subject))
            payload = {
                message: "The field 'subject' can not be empty!",
                status: false,
                data: nil
            }
            render :json => payload, :status => :bad_request
            return
        end

        if(!params.has_key?(:message))
            payload = {
                message: "The field 'message' can not be empty!",
                status: false,
                data: nil
            }
            render :json => payload, :status => :bad_request
            return
        end

        contact = Contact.new(
            :name => params[:name],
            :email=> params[:email],
            :subject => params[:subject],
            :message=> params[:message],
            :status=> 0
        )
        contact.save!

        response = {
            message: "ok",
            status: true,
            data: contact
        }
        render :json => response, :status => :ok

    end

    def subscribe
        response = {
            message: "ok",
            status: true,
            data: nil
        }
        render :json => response, :status => :ok
    end

    def getfile
        uuid = params[:uuid]
        file_path = Rails.root.join('storage', 'uploads', uuid)
        send_file file_path, type: 'image/png', disposition: 'inline'
    end

end
