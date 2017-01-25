class ParkOutWorker
  include Sidekiq::Worker

  def perform(parking_car_id)
    car = ParkingCar.find(parking_car_id)
    Parking.find(car.parking_id).update(balance: (Parking.find(car.parking_id).balance + car.balance))
    car.destroy
  end
end