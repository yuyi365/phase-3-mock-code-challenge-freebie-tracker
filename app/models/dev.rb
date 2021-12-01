class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    status = self.freebies.where(item_name: item_name)
    status.length != 0 ? true : false
  end

  def give_away(dev, freebie)
    if self.received_one?(freebie.item_name)
      freebie.update(dev_id: dev.id)
    else
      'This dev does not have the freebiee'
    end
  end
end

# self.freebies.map do |freebie|
#   Freebie.where(item_name: freebie.item_name).update(dev_id: dev.id)
# end
