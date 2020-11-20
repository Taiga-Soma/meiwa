class Resident < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '入居中' },
    { id: 3, name: '空室' }
  ]

  include ActiveHash::Associations
  has_many :homes
end
