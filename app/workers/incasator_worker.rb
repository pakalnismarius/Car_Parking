class IncasatorWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  #recurrence { daily.hour_of_day(3) }
  recurrence { minutely.second_of_minute(0, 10, 20) }

  def perform
  	@total = 0
    Parking.all.each do |parking|
    	@total += parking.balance
    end
    ParkingsBalance.create(daily_balance: @total)
  end

end
