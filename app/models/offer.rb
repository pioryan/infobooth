class Offer
  #range
  #name
  MAX_UPPER = 100
  attr_accessor :list
  attr_accessor :lower_bound
  attr_accessor :upper_bound
  def initialize(country_code = '*', offers = {})
    offers = {'MY' => {'says' => 30, 'sponsorpay' => 40, 'tmp' => 50}, '*' => {'sponsorpay' => 100}}
    @list = {}
    @lower_bound = 1
    @upper_bound = 1
    country_code = '*' unless offers.key? country_code
    offers[country_code].each do |offer, percentage|
      self << {offer => percentage}
    end
  end


  def <<(offer)
    name, percentage = offer.shift
    @upper_bound = lower_bound + percentage - 1
    @upper_bound = MAX_UPPER if @upper_bound > MAX_UPPER
    @list.merge!({ name => @lower_bound..@upper_bound})
    @lower_bound = @lower_bound + percentage
    @lower_bound = MAX_UPPER if @lower_bound > MAX_UPPER
  end

  def get(random = (rand(100)+1))
    @list.select {|offer, range| range.cover? random}.first.first
  end

end