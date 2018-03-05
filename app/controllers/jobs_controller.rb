require 'httparty'

class JobsController < ApplicationController
  before_action :data_url, only: [:insert_jobs]
  API_URL = 'https://enigmatic-meadow-90199.herokuapp.com/'

  def index; end

  def show

  end

  def insert_jobs
    @jobs = @jobs_api['jobs']['job']
    @jobs.each do |job|
      Job.find_or_create_by!(jobId: job['jobId']) do |item|
        item.date = job['date']
        item.jobId = job['jobId']
        item.city = job['city']
        item.state = job['state']
        item.zipcode = job['zipcode']
        item.license = job['license']
        item.specialty = job['specialty']
        item.shift = job['shift']
        item.startdate = job['startdate']
        item.enddate = job['enddate']
        item.description = job['description']
        item.benefits = job['benefits']
        item.requirements = job['requirements']
        item['created_at'] = job['created_at']
        item['updated_at'] = job['updated_at']
      end
    end
    @jobs_list = Job.all
    render json: @jobs_list
  end

  private
  def data_url
    response = HTTParty.get(API_URL)
    json = JSON.parse(response.body)
    @jobs_api = json
  end

end


# t.date "date"
# t.integer "jobId"
# t.string "city"
# t.string "state"
# t.string "zipcode"
# t.string "license"
# t.string "specialty"
# t.string "shift"
# t.date "startdate"
# t.date "enddate"
# t.text "description"
# t.text "benefits"
# t.text "requirements"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
